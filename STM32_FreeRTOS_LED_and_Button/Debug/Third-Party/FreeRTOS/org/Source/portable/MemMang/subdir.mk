################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third-Party/FreeRTOS/org/Source/portable/MemMang/heap_4.c 

OBJS += \
./Third-Party/FreeRTOS/org/Source/portable/MemMang/heap_4.o 

C_DEPS += \
./Third-Party/FreeRTOS/org/Source/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
Third-Party/FreeRTOS/org/Source/portable/MemMang/%.o: ../Third-Party/FreeRTOS/org/Source/portable/MemMang/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F3 -DSTM32F30 -DSTM32F303VCTx -DSTM32F3DISCOVERY -DDEBUG -DSTM32F303xC -DUSE_STDPERIPH_DRIVER -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_LED_and_Button/Utilities" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_LED_and_Button/Config" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_LED_and_Button/Third-Party/FreeRTOS/org/Source/include" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_LED_and_Button/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_LED_and_Button/StdPeriph_Driver/inc" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_LED_and_Button/inc" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_LED_and_Button/CMSIS/device" -I"C:/Users/Asus/Documents/GitHub/workspaceSTM32/STM32_FreeRTOS_LED_and_Button/CMSIS/core" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


