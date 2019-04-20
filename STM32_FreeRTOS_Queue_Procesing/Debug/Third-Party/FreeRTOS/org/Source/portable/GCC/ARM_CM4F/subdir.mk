################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F/%.o: ../Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F3 -DSTM32F30 -DSTM32F303VCTx -DSTM32F3DISCOVERY -DDEBUG -DSTM32F303xC -DUSE_STDPERIPH_DRIVER -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/Utilities" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/Config" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/Third-Party/FreeRTOS/org/Source/include" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/Third-Party/SEGGER/Config" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/Third-Party/SEGGER/OS" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/Third-Party/SEGGER/SEGGER" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/StdPeriph_Driver/inc" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/inc" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/CMSIS/device" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_Queue_Procesing/CMSIS/core" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


