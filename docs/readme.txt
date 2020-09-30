
=================
=  U P L I N K  =
=      V1.55    =
=================


Welcome to Uplink!
Produced by Introversion Software.

For information on Uplink, visit www.introversion.co.uk

===============================================================================
                                CONTENTS
===============================================================================

- Installing
        From CD
        From an internet download

- Command line options

- Troubleshooting
        Getting the game to run
        Game crashes on startup (Due to a fault in ATIOGLXX.DLL, NVOGLNT.DLL)	
        Crash problems
        Graphical problems
        Controller problems
        Sound problems
        Speed problems
        What to do if you find a problem

- Credits

- Acknowledgement

- Legal


===============================================================================
                                INSTALLING
===============================================================================


* FROM CD
Insert the CD into the drive - it should autostart the installation.
If the installation doesn't start, open the CD, enter the "install"
directory and run the setup.exe program.


* FROM AN INTERNET DOWNLOAD
Double click on the executable and enter a path to install to.  Uplink
will now extract into that directory.  You can run uplink by going to
that directory and running uplink.exe.



===============================================================================
                            COMMAND LINE OPTIONS
===============================================================================


Uplink can be started with a variety of command line options.
Each option begins with either a '+' or a '-', to enable or
disable an option.  For example, starting uplink with the command

    uplink -graphics_fullscreen 

would start the game with fullscreen DISABLED, while starting it like this:

    uplink +graphics_fullscreen

will start the game with fullscreen ENABLED.


Here is the complete list of options:

graphics_fullscreen                     sets the game to run fullscreen   
                                          (default is on)

graphics_buttonanimations               enables or disables moving buttons 
                                          (default is on)

graphics_safemode                       runs slower but should be more 
                                          compatible 
                                          (default is off)

graphics_altlargemap                    use this to correct problems with 
                                          the large map 
                                          (eg all white) (default is off)

graphics_softwaremouse                  renders a software mouse.  
                                          Use this to correct problems with 
                                          the mouse cursor 
                                          (default is off)

graphics_screendepth                    Changes the colour depth to what you 
                                          specify (eg 16, 24, 32)
                                          If set to -1, the depth is not set
                                          (Your desktop depth will be used)
                                          (default is -1)

graphics_screenrefresh                  Changes the refresh rate to what you
                                          specify (eg 60, 85, 100)
                                          If set to -1, the refresh rate will
                                          not be set
                                          (Your desktop refresh will be used)
                                          (default is -1)

sound_musicenabled                      enables or disables music 
                                          (default is on)

game_debugstart                         Prints debugging info during start up 
                                          (default is off)



===============================================================================
                                TROUBLESHOOTING
===============================================================================



* GETTING THE GAME TO RUN

If the game simply refuses to run (ie a command prompt box appears, 
spits out some garbage then dies) then try looking at the file

    uplink/users/debug.log

This file has loads of debugging information about the game.
Take a look and see if you can see any obvious error messages.  
Alternativly, post a copy of that file to 

    http://forums.introversion.co.uk/uplink/

and we'll look into the problem as soon as possible.  
It would help if you mentioned what kind of graphics card you have, 
and what operating system you are running.

Its worth mentioning that most problems at this point (ie startup) are 
probably graphics or sound related - i'd always advise you get the 
newest drivers for your hardware before giving up.



* GAME CRASHES ON STARTUP (DUE TO A FAULT IN ATIOGLXX.DLL, NVOGLNT.DLL)

This problem is caused by a crash in ATI or NVIDIA OpenGL drivers. First thing 
to do, is to update your video drivers. If it still crash, you can work 
around this by using Microsoft's stock OpenGL driver instead: 

In the directory where Uplink.exe lives, rename the file 
OPENGL32.DLL.BAK to OPENGL32.DLL 



* CRASH PROBLEMS

If Uplink crashes or just stops running suddenly, then its a good bet
that something has gone wrong.  The first thing to do is to open up
the file 

    uplink/users/debug.log

and scroll to the bottom of the file.  You will see some information
on the most recent running of the game.  Hopefully there will be 
some information there.

If you can't figure it out, please post a copy of that file, along with
a detailed explanation of what went wrong, to 

    http://forums.introversion.co.uk/uplink/.

You should also keep a copy of uplink/CRASH.DMP for further debugging.



* GRAPHICAL PROBLEMS

If you can't see the mouse in game, or if the mouse is causing problems 
in any way, start the game like this:

    uplink +graphics_softwaremouse

The higher the colour depth of your desktop, the better Uplink will look.
There is a noticable difference in dithering qualtity between 16bit colour
and 32bit colour.

If the graphics in game appear corrupt, the first thing to try is to
get the newest OpenGL drivers for your graphics card.

If that doesn't work, try changing the Windows colour depth.  
We've found on some systems that one colour depth will work, 
but another won't.  Try 16bit, 24bit or 32bit colour.

If that doesn't work, try running in a Window - 
by starting uplink with the command

    uplink -graphics_fullscreen

If that doesn't work, try running in safe mode - 

    uplink +graphics_safemode

If that doesn't work, try disabling any hardware acceleration, 
antialiasing, anisotropic filtering, vertical sync (v-sync).

If you are having problems with the large world map 
(eg it may appear all white) then run like this

    uplink +graphics_altlargemap

If all that fails, please send a report of what went wrong to

    http://forums.introversion.co.uk/uplink/



* CONTROLLER PROBLEMS

If the mouse doesn't appear in game or appears corrupted, try starting the 
game like this:

    uplink +graphics_softwaremouse

This will render a software mouse on screen for you.



* SOUND PROBLEMS

If the sounds in game are causing any problems, you can disable 
them by running uplink with the command

    uplink -sound_musicenabled



* SPEED PROBLEMS

Uplink uses OpenGL - so it should work fine on pretty much any system
you choose to run it on.  However, it will run better on some.

Some Win98 systems that use split-screen (ie two monitors) have been seen
to run Uplink in software mode very slowly. This can be fixed by 
temporarily disabling the second monitor (from display properties->settings)

If the game is running too slowly (ie the moving icons are jerking around
the screen) you can disable the moving animations by starting Uplink with
the command

    uplink -graphics_buttonanimations



* WHAT TO DO IF YOU FIND A PROBLEM

If something is going wrong for you, you should follow these steps.  

The first thing to do is to check out the bug report forums on our website:

    http://forums.introversion.co.uk/uplink/

You will find information there about existing bugs that people have found.

If that doesn't help, post a message on 

    http://forums.introversion.co.uk/uplink/

include the file uplink/users/debug.log
and a complete description of exactly what goes wrong and when.
If you could tell us how to reproduce the bug, we'd be greatful.
You should also tell us what type of graphics card you have, what operating 
system etc etc.  The more information the better.


===============================================================================
                                    CREDITS
===============================================================================


    PRODUCED BY INTROVERSION SOFTWARE

- Chris Delay
- Mark Morris
- Thomas Arundel
- John Knottenbelt

    WITH HELP FROM

- James Lawton
- Francois 'frenchfrog' Gagne
- Gareth Sidebottom
- Ashley 'NeoThermic' Pinner

    VOICE TALENT

- Chris Delay
- Mark Morris
- Thomas Arundel
- Casey Wireman

    INITIAL BETA TESTERS

- Alex Bevi
- Joe Elleson
- Casey Wireman
- Woody Folsom
- Alastair Growcott
- Andrew 'Einstein' Clark
- Derek 'PunisherBass' Schott
- Alison 'Ravenshadow' Jarvis
- Gary 'Icepick' Chambers
- Ryan 'Zaptan' Thoma
- Leander 'elDiablo' Hambley
- Palle 'Absent' Raabjerg
- Dj 'LR Black Lightning' Vince
- Zakk 'TimeDoctor'
- rick@tproc.org
- yoonix@speakeasy.net
- Manel 'Asas' Pata

    MUSIC

- BlueValley        written by Karsten Koch (koch3@larry.scc.hab-weimar.de)
                    http://www.scc.hab-weimar.de/~koch

- Symphonic         written by Dual Crew

- Serenity          written by Ryan Cramer (rcramer@di.net)

- Mystique PartI    written by Timelord (timelord@nol.net)
- Mystique PartII   http://www.phoenix.net/~dspyre/timelord.html

- A94Final          written by Skaven


===============================================================================
                                ACKNOWLEDGEMENT
===============================================================================


Special thanks to the Introversion Community for continued testing and bug 
reporting. Your support is really appreciated.


===============================================================================
                                    LEGAL
===============================================================================


THE SOFTWARE IS PROVIDED "AS-IS" AND WITHOUT WARRANTY OF ANY KIND, 
EXPRESS, IMPLIED OR OTHERWISE, INCLUDING WITHOUT LIMITATION, ANY 
WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  

IN NO EVENT SHALL INTROVERSION SOFTWARE OR ITS MEMBERS BE LIABLE FOR
ANY SPECIAL, INCIDENTAL, INDIRECT OR CONSEQUENTIAL DAMAGES OF ANY KIND,
OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER OR NOT ADVISED OF THE POSSIBILITY OF DAMAGE, AND ON ANY THEORY OF 
LIABILITY, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE 
OF THIS SOFTWARE.


