################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third-Party/SEGGER/SEGGER/SEGGER_RTT.c \
../Third-Party/SEGGER/SEGGER/SEGGER_SYSVIEW.c 

OBJS += \
./Third-Party/SEGGER/SEGGER/SEGGER_RTT.o \
./Third-Party/SEGGER/SEGGER/SEGGER_SYSVIEW.o 

C_DEPS += \
./Third-Party/SEGGER/SEGGER/SEGGER_RTT.d \
./Third-Party/SEGGER/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
Third-Party/SEGGER/SEGGER/%.o: ../Third-Party/SEGGER/SEGGER/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F3 -DSTM32F30 -DSTM32F303VCTx -DSTM32F3DISCOVERY -DDEBUG -DSTM32F303xC -DUSE_STDPERIPH_DRIVER -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/Utilities" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/Config" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/Third-Party/FreeRTOS/org/Source/include" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/Third-Party/SEGGER/Config" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/Third-Party/SEGGER/OS" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/Third-Party/SEGGER/SEGGER" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/StdPeriph_Driver/inc" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/inc" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/CMSIS/device" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Task_Notify/CMSIS/core" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


