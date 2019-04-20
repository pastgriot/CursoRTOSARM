/**
  ******************************************************************************
  * @file    main.c
  * @author  Ac6
  * @version V1.0
  * @date    01-December-2013
  * @brief   Default main function.
  ******************************************************************************
*/

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "stm32f30x.h"
//#include "stm32f3_discovery.h"
#include "FreeRTOS.h"
#include "task.h"

TaskHandle_t xTaskHandle1 = NULL;
TaskHandle_t xTaskHandle2 = NULL;

//task function prototypes

void vTask1_handler(void *params);
void vTask2_handler(void *params);

static void prvSetupHardware(void);
static void prvSetupUART(void);


char msg[100] = "HolaMarcolalalala";

void printmsg(char *msg);

#ifdef USE_SEMIHOSTING
//semi hosting
extern void initialise_monitor_handles();
#endif


//macros
#define TRUE 1
#define FALSE 0
#define AVAILABLE TRUE
#define NON_AVAILABLE FALSE

//variables globales
char usr_msg[250];
uint8_t  UART_ACCESS_KEY = AVAILABLE;

int main(void)
{

#ifdef USE_SEMIHOSTING
	initialise_monitor_handles();
	printf("Hello World Example!!!\n");
#endif



	DWT->CTRL |= (1 <<0); //Habilita CYCCNT en DWT_CTRL

	//1. resetea la configuracion RCC al estado de reset default
	//HSI On, PLL off, HSE off, system Clock = 8MHz, CPU Clock = 8  MHz
	RCC_DeInit();

	//2. actualiza la variable SystemCoreClock
	SystemCoreClockUpdate();

	prvSetupHardware();

	sprintf(usr_msg, "This is hello Word app starting\n");
	printmsg(usr_msg);

	//comienza a grabar segger
	SEGGER_SYSVIEW_Conf();
	SEGGER_SYSVIEW_Start();

	//3. Creacion de 2 task, task-1 y task-2
	xTaskCreate( vTask1_handler,"Task-1", configMINIMAL_STACK_SIZE, NULL,
			2, &xTaskHandle1 );

	xTaskCreate( vTask2_handler,"Task-2", configMINIMAL_STACK_SIZE, NULL,
			2, &xTaskHandle2 );

	//4. Start el scheduler
	vTaskStartScheduler();

	//nunca llega acá
	for(;;);

}


void vTask1_handler(void *params)
{
	while(1)
	{
		if (UART_ACCESS_KEY == AVAILABLE)
		{
			UART_ACCESS_KEY = NON_AVAILABLE;
			printmsg("Hello World Task-1\r\n");
			UART_ACCESS_KEY = AVAILABLE;
			taskYIELD();
		}
	}
}

void vTask2_handler(void *params){
	while(1){
		if (UART_ACCESS_KEY == AVAILABLE)
		{
			UART_ACCESS_KEY = NON_AVAILABLE;
			printmsg("Hello World Task-2\r\n");
			UART_ACCESS_KEY = AVAILABLE;
			taskYIELD();
		}
	}
}


static void prvSetupUART(void){

	GPIO_InitTypeDef gpio_uart_pins;
	USART_InitTypeDef uart2_init;

	//1. Habilitar UART Peripheral Clock y PortC Peripheral Clock
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

	//2. Configuro pines como UART  Rx = PA3 y Tx = PA2

	gpio_uart_pins.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_3;
	gpio_uart_pins.GPIO_Mode = GPIO_Mode_AF;
	gpio_uart_pins.GPIO_PuPd = GPIO_PuPd_UP;

	GPIO_Init(GPIOA, &gpio_uart_pins);

	//3. Configuro Alt. function para USART2 en Pin 4 y Pin 5
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource2, GPIO_AF_7);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource3, GPIO_AF_7);

	//4. Inicialización USART2

	//limpio las estructuras por si hay basura
	memset(&uart2_init,0,sizeof(uart2_init));
	uart2_init.USART_BaudRate = 115200;
	uart2_init.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	uart2_init.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;
	uart2_init.USART_Parity = USART_Parity_No;
	uart2_init.USART_StopBits = USART_StopBits_1;
	uart2_init.USART_WordLength = USART_WordLength_8b;

	//5. Enable USART2 periph

	USART_Init(USART2, &uart2_init);
	USART_Cmd(USART2, ENABLE);
	//USART_DirectionModeCmd(USART2,USART_Mode_Tx, ENABLE);


}


static void prvSetupHardware(void){

	//Setup UART1
	prvSetupUART();
}

void printmsg(char *msg){

	for (uint32_t i = 0;i < strlen(msg);i++){
		while (USART_GetFlagStatus(USART2,USART_FLAG_TXE) != SET);
		USART_SendData(USART2, msg[i]);
	}
}

