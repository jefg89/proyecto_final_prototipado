/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */


/* Device Memory Map

Device                      Dir

W training coefs.      0x100 - 0x14C
b output offset           0x150
In traning data           0x154
Start Register            0x158

*/
#include <stdio.h>

float x=1.1;
int main()
{
  printf("Hello from Nios II!\n %f", x);

  return 0;
}
