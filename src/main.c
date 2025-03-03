/**-----------------------------------------------------------------------------
 * Copyright (c) 2025 Sergey Sanders
 * sergey@sesadesign.com
 * -----------------------------------------------------------------------------
 * Licensed under Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * International (CC BY-NC-SA 4.0). 
 * 
 * You are free to:
 *  - Share: Copy and redistribute the material.
 *  - Adapt: Remix, transform, and build upon the material.
 * 
 * Under the following terms:
 *  - Attribution: Give appropriate credit and indicate changes.
 *  - NonCommercial: Do not use for commercial purposes.
 *  - ShareAlike: Distribute under the same license.
 * 
 * DISCLAIMER: This work is provided "as is" without any guarantees. The authors
 * aren’t responsible for any issues, damages, or claims that come up from using
 * it. Use at your own risk!
 * 
 * Full license: http://creativecommons.org/licenses/by-nc-sa/4.0/
 * ---------------------------------------------------------------------------*/

/**
 * @file main.c
 * @author Sergey Sanders
 * @date 1 March 2025
 * @brief ucosR development suite
 * @see https://github.com/RimerSBC/release/wiki
 */
#include "freeRTOS.h"
#include "task.h"
#include "bsp.h"
#include "rshell.h"
#include "ucosR.h"

#include "iface_demo.h" 

/// Register user-defined interface using add_interface()
void interface_register(void)
{
    add_interface(&ifaceDemo);
}

int main(void)
{
    AppGreeting = "-- ucosR Demo app";
    bsp_init();
    xTaskCreate(ucosR_task, "ucosR", configMINIMAL_STACK_SIZE, NULL, 2, NULL);
    vTaskStartScheduler();
    while (1);
}

void vApplicationMallocFailedHook(void)
{
    asm("BKPT #1");
    while (1)
        __asm("nop");
}
