################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third-Party/FreeRTOS/org/Source/croutine.c \
../Third-Party/FreeRTOS/org/Source/event_groups.c \
../Third-Party/FreeRTOS/org/Source/list.c \
../Third-Party/FreeRTOS/org/Source/queue.c \
../Third-Party/FreeRTOS/org/Source/stream_buffer.c \
../Third-Party/FreeRTOS/org/Source/tasks.c \
../Third-Party/FreeRTOS/org/Source/timers.c 

OBJS += \
./Third-Party/FreeRTOS/org/Source/croutine.o \
./Third-Party/FreeRTOS/org/Source/event_groups.o \
./Third-Party/FreeRTOS/org/Source/list.o \
./Third-Party/FreeRTOS/org/Source/queue.o \
./Third-Party/FreeRTOS/org/Source/stream_buffer.o \
./Third-Party/FreeRTOS/org/Source/tasks.o \
./Third-Party/FreeRTOS/org/Source/timers.o 

C_DEPS += \
./Third-Party/FreeRTOS/org/Source/croutine.d \
./Third-Party/FreeRTOS/org/Source/event_groups.d \
./Third-Party/FreeRTOS/org/Source/list.d \
./Third-Party/FreeRTOS/org/Source/queue.d \
./Third-Party/FreeRTOS/org/Source/stream_buffer.d \
./Third-Party/FreeRTOS/org/Source/tasks.d \
./Third-Party/FreeRTOS/org/Source/timers.d 


# Each subdirectory must supply rules for building sources it contributes
Third-Party/FreeRTOS/org/Source/%.o: ../Third-Party/FreeRTOS/org/Source/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F3 -DSTM32F30 -DSTM32F303VCTx -DSTM32F3DISCOVERY -DDEBUG -DSTM32F303xC -DUSE_STDPERIPH_DRIVER -I"C:/Users/rba/workspaceSTM32/HelloWorld/Utilities" -I"C:/Users/rba/workspaceSTM32/HelloWorld/Config" -I"C:/Users/rba/workspaceSTM32/HelloWorld/Third-Party/FreeRTOS/org/Source/include" -I"C:/Users/rba/workspaceSTM32/HelloWorld/Third-Party/SEGGER/Config" -I"C:/Users/rba/workspaceSTM32/HelloWorld/Third-Party/SEGGER/OS" -I"C:/Users/rba/workspaceSTM32/HelloWorld/Third-Party/SEGGER/SEGGER" -I"C:/Users/rba/workspaceSTM32/HelloWorld/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I"C:/Users/rba/workspaceSTM32/HelloWorld/StdPeriph_Driver/inc" -I"C:/Users/rba/workspaceSTM32/HelloWorld/inc" -I"C:/Users/rba/workspaceSTM32/HelloWorld/CMSIS/device" -I"C:/Users/rba/workspaceSTM32/HelloWorld/CMSIS/core" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


