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
 * @file iface_demo.c
 * @author Sergey Sanders
 * @date March 2025
 * @brief ucosR development demo interface
 *
 */
#include "FreeRTOS.h"
#include "task.h"
#include "bsp.h"
#include "rshell.h"
#include "tstring.h"
#include "colours.h"
#include "graph.h"

#include <stdlib.h>

static bool iface_demo_init(bool verbose);
static cmd_err_t cmd_demo_hello(_cl_param_t *sParam);
static cmd_err_t cmd_demo_circle(_cl_param_t *sParam);
static cmd_err_t cmd_demo_devid(_cl_param_t *sParam);

const _iface_t ifaceDemo = {
    .name = "demo", // Interface name
    .prompt = NULL, // interface prompt. If set to NULL then the interface name will be used
    .desc = "ucosR demo interface",
    .init = iface_demo_init,
    .cmdList = {
        {.name = "hello", .desc = "Hello world", .func = cmd_demo_hello},
        {.name = "circle", .desc = "Draw a circle", .func = cmd_demo_circle},
        {.name = "devid", .desc = "Print device ID", .func = cmd_demo_devid},
        {.name = NULL, .func = NULL},
    }};

static bool iface_demo_init(bool verbose)
{
   static bool initialized = false;
   if (initialized)
      return true;
   /// Put the interface initialization code here
   initialized = true;
   if (verbose)
      tprintf("Interface \"demo\" initialized.\n");
   return initialized;
}

static cmd_err_t cmd_demo_hello(_cl_param_t *sParam)
{
   tprintf("Hello world!\n");
   if (sParam->argc) // there are parameters
      for (uint8_t i = 0; i < sParam->argc; i++)
      {
         tprintf("  Param[%d] = %s\n", i, sParam->argv[i]);
      }
   return CMD_NO_ERR;
}

const char *YesNo[] = {"no", "yes", NULL}; // list for enumeration decode by tget_enum, terminated by null
const char *Colours[] = {"black", "blue", "red", "magenta", "green", "cyan", "yellow", "white", NULL};

static cmd_err_t cmd_demo_circle(_cl_param_t *sParam)
{
   uint16_t centerX = 160, centerY = 120;
   uint8_t radius = 20, colour = SC_YELLOW;
   bool fill = false;
   tprintf("Circle test\n");
   if (sParam->argc)
      switch (sParam->argc)
      {
      case 5:
         fill = tget_enum(sParam->argv[4], YesNo) ? true : false;
      case 4:
         colour = tget_enum(sParam->argv[3], Colours); // get colour code
      case 3:
         radius = (uint8_t)strtol(sParam->argv[2], NULL, 0);
         if (radius > 120)
            radius = 120;
      case 2:
         centerY = (uint8_t)strtol(sParam->argv[1], NULL, 0);
         if (centerY > 239)
            centerY = 239;
      case 1:
         centerX = (uint8_t)strtol(sParam->argv[0], NULL, 0);
         if (centerX > 319)
            centerX = 319;
         break;
      default:
         return "Too many params";
      }
   tprintf("Circle at %d,%d\n radius = %d\n colour: %s\n filled: %s\n", centerX, centerY, radius, Colours[colour], fill ? "Yes" : "No");
   if (fill)
      circle_fill(centerX, centerY, radius, ANSI_pal256[colour]); // conver the colour code to the RGB values
   else
      circle(centerX, centerY, radius, ANSI_pal256[colour]); // conver the colour code to the RGB values

   return CMD_NO_ERR;
}

static cmd_err_t cmd_demo_devid(_cl_param_t *sParam)
{
    /*
     * SAM D5x/E5x Family Data Sheet, Section 9.6 
    */
    uint32_t id[4];
    id[0] = *((uint32_t *)0x008061FC);
    id[1] = *((uint32_t *)0x00806010);
    id[2] = *((uint32_t *)0x00806014);
    id[3] = *((uint32_t *)0x00806018);
    tprintf(" Dev ID:\n");
    for (uint8_t i=0;i<4;i++)
        tprintf("    Word %d = 0x%8X\n",i,id[i]);
    return CMD_NO_ERR;
}