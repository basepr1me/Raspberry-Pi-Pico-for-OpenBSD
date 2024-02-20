cmake_minimum_required(VERSION 3.13)

include(/usr/local/raspberrypi-pico-sdk/pico_sdk_init.cmake)

project(hello_usb)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

add_executable(hello_usb
        hello_usb.c
        )

# pull in common dependencies
target_link_libraries(hello_usb
	pico_stdlib
	)

add_compile_options(
	-Wall
	-Wno-format
	-Wno-unused-function
	-Wno-maybe-uninitialized
	)

pico_enable_stdio_usb(hello_usb 1)
pico_enable_stdio_uart(hello_usb 0)

# create map/bin/hex/uf2 file etc.
pico_add_extra_outputs(hello_usb)
