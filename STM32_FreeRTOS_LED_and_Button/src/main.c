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
#include "stm32f3_discovery.h"
#include "FreeRTOS.h"
#include "task.h"


//MACROS varias

#define FALSE 0
#define TRUE 1
#define NOT_PRESSED FALSE
#define PRESSED TRUE

//task function prototypes
void led_task_handler(void *params);
void button_task_handler(void *params);

//normal function prototypes
static void prvSetupHardware(void);
static void prvSetupUART(void);
static void prvSetupGPIO(void);
void printmsg(char *msg);

//variables globales
uint8_t button_status_flag = NOT_PRESSED;


int main(void)
{


	//1. resetea la configuracion RCC al estado de reset default
	//HSI On, PLL off, HSE off, system Clock = 8MHz, CPU Clock = 8  MHz
	RCC_DeInit();

	//2. actualiza la variable SystemCoreClock
	SystemCoreClockUpdate();

	prvSetupHardware();


	//3. Creacion de 2 task, task-1 y task-2
	xTaskCreate(led_task_handler,"LED-TASK", configMINIMAL_STACK_SIZE, NULL,
			1, NULL );

	xTaskCreate(button_task_handler,"BUTTON-TASK", configMINIMAL_STACK_SIZE, NULL,
			1, NULL );


	//.4 Inicio el scheduler RTOS
	vTaskStartScheduler();

	for(;;);
}



void led_task_handler(void *params)
{
	while(1)
	{
		if(button_status_flag == PRESSED)
		{
			//prende LED
			GPIO_WriteBit(GPIOE,GPIO_Pin_9, SET);

		}else{

			//apaga LED
			GPIO_WriteBit(GPIOE,GPIO_Pin_9, RESET);
		}
	}
}

void button_task_handler(void *params){
	while(1)
	{
		//lee el botón
		if (GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_0))
		{
			//botón  presionado
			button_status_flag = PRESSED;
		}else{
			//botón no presionado
			button_status_flag = NOT_PRESSED;
		}
	}
}


static void prvSetupHardware(void){

	//Setup GPIO
	prvSetupGPIO();

	//Setup UART1
	prvSetupUART();


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
}


static void prvSetupGPIO(void){

	//board specific
	GPIO_InitTypeDef led_init, button_init;

	//1. Habilitar PortA (boton) Peripheral Clock y PortE (led) Peripheral Clock

	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOE, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

	//2. Configuro e inicio LED pin 9 gpio E como salida pushpull, slow speed
	led_init.GPIO_Mode = GPIO_Mode_OUT;
	led_init.GPIO_OType = GPIO_OType_PP;
	led_init.GPIO_Pin = GPIO_Pin_9 ;  //LED 3
	led_init.GPIO_Speed = GPIO_Speed_50MHz;
	led_init.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(GPIOE, &led_init);

	//3. Configuro e inicio botton pin 0 gpio A como Entrada

	button_init.GPIO_Mode = GPIO_Mode_IN;
	button_init.GPIO_Pin = GPIO_Pin_0 ;  //button_0
	button_init.GPIO_Speed = GPIO_Speed_50MHz;
	button_init.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(GPIOA, &button_init);

}

void printmsg(char *msg){

	for (uint32_t i = 0;i < strlen(msg);i++){
		while (USART_GetFlagStatus(USART2,USART_FLAG_TXE) != SET);
		USART_SendData(USART2, msg[i]);
	}
}


