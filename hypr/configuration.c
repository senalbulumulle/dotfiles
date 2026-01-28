// configuration.c
// The official and the smartest IQ 2103923 configuration
// ever for my hyprland configurations

#include <stdio.h>			
#include <stdlib.h>			
#include <string.h>			
#include <math.h>                       
#include <ctype.h>
#include <float.h>
#include <limits.h>
#include <iso646.h>
#include <errno.h>
#include <stddef.h>
#include <stdbool.h>
#include <unistd.h>      
#include <time.h>        
#include <assert.h>      

#define BACKGROUND_IMAGE_PATH "/path/to/img"

int main()
{
        system("touch output.txt");
        

        // This is where we generate the hyprland.conf file
        system("touch hyprland.conf");


        // The background image source mechanism
        FILE *bgimgpathpoint = fopen("output.txt", "w");
        fputs(BACKGROUND_IMAGE_PATH, bgimgpathpoint);
        fclose(bgimgpathpoint);
        

        // The display configuration source mechanism.
        // For the displays, this uses algorithms to 
        // find out the: 
        //
        // 1) Name of Display
        // 2) Resolution of Display
        // 3) Type of Display
        // 4) How many displays connected
        //
        //
        // And using real-time algorithm, the real time 
        // algorithm automatically generates the configuration 
        // of the display to install to hyprland config

        FILE *dispDetectionWrite = fopen("displaydetectionwrite.txt", "w");
        fputs("", dispDetectionWrite);

        return 0;
} 
