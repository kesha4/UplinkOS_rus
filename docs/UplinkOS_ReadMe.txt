Uplink OS - v1.04 GOLD - 03.03.2017

TABLE OF CONTENTS
================================
	I.		Introduction
	II.		Installation
	III.		Change Log
	IV.		Contact
	V.		Thanks
	VI.		Copyright & Credits
================================

--------------------------------
I.		INTRODUCTION
--------------------------------
Uplink OS is a total graphical modification for 2001's indie
cult hit Uplink: Trust is a Weakness by Introversion Software.
It aims to bring a fresh look to the game's cyberpunk visuals
and a much needed upgrade to its interface and usability.

--------------------------------
II.		INSTALLATION
--------------------------------

1.		After downloading the corresponding version of the Mod,
		unzip it into a place of your choice.
		
2.		Go to Uplink's installation folder
			STEAM version (common):
				C:\Program Files\Steam\steamapps\common\Uplink
			GOG version (common):
				C:\GOG Games\Uplink
	a. 	Copy the contents of the Mod's zip file into this folder.
	b.	Go to the "users" folder.
	c.	Back-up & move/delete all the files here (saves are not
		compatible, unfortunately).

3.		Now just run UplinkOS.exe and your ready to start
		hacking!
		NOTE: On the STEAM version, you may have to run the game
		from the STEAM interface or it might not work, in this
		case you'll have to rename UplinkOS.exe to Uplink.exe.
		
--------------------------------
III.	CHANGE LOG
--------------------------------

GOLD v1.04
	- Made apps' progress be affected by the Game Speed
	- Fixed some issues with the Task Manager v2, where apps would appear doubled
	or a File Deleter app would appear without running
	- Fixed an issue where some objects would be drawn before being updated;
	this removes some visual artifacts
	- Made windows come to front when they're clicked
	- Fixed a bug that caused some apps to start with their bases red
	- Reworked the mouse pointer to remove some lag
	- Made Allegro5 use OpenGL 3.0; this hopefully fixes most users'
	"Could not create the display!" error messages
	- Fixed a bug that caused the red e-mail notification to not appear
	- Fixed the Status/Finance window title
	- Added a small sound when hovering on buttons
	- Fixed a bug that caused only one song to be looped

BETA v1.03
	- Added a new purchasable upgrade for the Task Manager
	- Added a red base for apps to highlight if they're running on low CPU
	- Added the LAN_Force versions back, but also brought back the Leveled Locks
	(somehow vanilla Uplink didn't use them)
	- Added CTRL+Left/Right for moving through texts word by word
	- Added CTRL+Backspace/Delete for deleting whole words
	- Added the ability to move the text caret using the mouse on single-line
	text fields
	- Fixed a bug with the App's CPU bar which would not color correctly
	- Typos
	- Fixed the Note's text field box hover graphic
	- Fixed a rare bug which caused save files to become corrupted

BETA v1.02
	- The player is no longer allowed to buy things if he doesn't have enough money in the
	currently active account
	- Added call buttons to Admins and Managers on the Company Contact page
	- Moved all Voice files to a new, Audio, tab in the Files Manager
	- The Randomize button on the map gets deactivated until the bounce is complete
	- Added a new color to map elements when they are targeted and favourited
	- After finishing, the Password_Breaker now also "clicks" the submit button
	- Fixed a bug where you could open previously deleted apps if they had hotkeys assigned to them
	- Fixed a crash when deleting logs with a level 3 account
	- The files apps that run on servers now take into account other instances of the same app when
	calculating the needed time to complete
	- Added a default gateway icon in the store (for modded gateways)
	- Made the minimum CPU requirement for passive apps scalable in accordance to the total CPU

BETA v1.01
	- Fixed some more typos
	- Fixed the Tour Guide buttons
	- Fixed another E-Mail crash
	- Fixed the hotkeys that ran the Log/LAN apps without having said apps
	- Fixed a bug with the Log_Undeleter
	- Definitely (for sure!) fixed the eMailz screen
	- Fixed the "Steal all files" mission check
	- Tweaked the Analyzer buttons
	- Apps now have a minimum percent of CPU usage and, if they're under it, they will work slower or not at all
	- Fixed a bug that caused the Apps total CPU usage to go over 100%
	- Changed the way the total CPU usage is calculated
	- The date is now visible, next to the clock
	- Added a hotkey for the Decrypter (Ctrl-D)
	- Externalized the context menus hotkeys to the default_hotkeys.xml file
	- Added the ability to remove saved passwords by right-clicking on them
	- Removed the auto-scroll to top on the Mission BBS screen if coming back from the Contact screen
	- Added the target computer/person to mission elements in the E-Mail list

BETA v1.00
	- Fixed a crash when accessing a file/log through the context menu after being disconnected
	- Changed the Password_Breaker's timings
	- Added time-stamps to files generated for "steal all" missions
	- Fixed a bug with the Revelation_Tracker that didn't update its title correctly
	- Fixed the subject line of the "Shiny Hammer" mission failed e-mail
	- Fixed a bug when uploading a file while the file server is empty, the new file would not appear
	- Fixed a bug when receiving an e-mail while the list is empty, the new e-mail would not appear
	- Fixed a minor spill on Rankings board
	- Fixed the Max Loan value. It now changes when you can loan more money
	- Fixed the Cancel context action missing icon
	- Fixed a bug that caused the Password_Breaker's text animation to contain the server's IP o_O
	- The Dead Agent's eMailz screen is definitely up now
	- Fixed a crash when assigning hotkeys to apps (oups!)
	- Removed the versions for LAN_Force since they weren't different in any way
	- Fixed a bug with the LAN Systems that would not reset the red color left by an admin
	- HUD_ConnectionRandomizer now appears in the Gateway Info window
	- Fixed a bank account values typo
	- Fixed a bug that caused the bank's title to not change when connecting to another one through the Finance window
	- Fixed some more typos
	- Made the Randomizer use only the player's links, not all encountered

BETA v0.99
	- Fixed a bug that stopped the player from accessing files on a
	file server with access from the employer
	- Fixed a bug that caused the images and fonts to become corrupted
	after changing resolutions
	- Fixed a bug that caused the resolution list to be empty on some systems
	- Fixed a crash when applying settings in-game
	- Made the Randomizer go through all available links
	- Fixed the Password_Breaker's animation from running when paused
	- Fixed a bug that stopped the player from deleting some bank statements
	- Fixed a bug that caused missions to use male pronouns instead of female ones
	- Added Cancel actions to files and logs
	- Fixed a crash when opening the Status window
	- Added app categories to the App Menu
	- Fixed a bug that caused the arrows on the E-Mail window to not update
	correctly when receiving a new message
	- Made the Trace_Tracker's sounds even louder
	- Fixed a bug that caused the resolution list to get out of screen
	- Updated some missions' descriptions to be more apparent that the
	player needs to wait for news about their deeds
	- Fixed a bug that allowed important bookmarks to be removed if using hotkeys
	- Added a Tour Guide window
	- Fixed a bug that that caused some files to appear duplicated on the user's system
	- On the App Upgrades screen, added space requirement for the apps

BETA v0.98
	- Tuned the Log_Modifier UI to make the Type menu more evident
	- Added the missing Easter-Egg screen ;)
	- Enlarged the View E-Mail subtitles a little bit
	- Made the HUD_MapRandomizer actually random
	- Added a gateway view, to better see what slots are filled or not
	- Replaced the Virtuanet R-Access gateway since it was redundant
	- Added NPC portraits
	- Added the Trace_Tracker sound beeps to the HUD_MapShowTrace too
	- Tuned the World Map a little bit, to be easiear to see the names
	of the target/fav locations
	- Fixed a bug where text field boxes could add infinite lines or
	characters
	- Fixed a bug that caused the rendering to become corrupted after
	the game was out of focus
	- Fixed a bug in the Files Manager that caused a file app to stop
	if the user changed tabs
	- Added a safe mode if the Allegro display can't be created
	- Removed the Connect To animation
	- Fixed a crash when contacting an employer of a Trace Hacker
	mission when the target was the player
	- Optimized the BBS screen
	- Fixed the Trace_Tracker from beeping while the game is paused
	- Fixed the files bugs introduced in 097
	- Fixed a bug when uploading and downloading at the same time
	resulted in the Not Enough Space pop-up to spam the player
	- Fixed a crash when an e-mail would be deleted while viewing
	another e-mail
	- Added back the dead agent's eMailz screen
	- Fixed a bug that prevented the player to delete a bank's
	transfer logs
	- Added tooltips to the in-game awards section

BETA v0.97
	- Added e-mail attachment to save file
	- Fixed a bug that caused the News screen to disappear
	- Fixed a bug that caused the Save button on the Map interface
	to not work
	- Fixed a minor truncation bug on the News items
	- Added a missing game over screen
	- Fixed a bug that caused the App Menu to not update correctly
	- Optimized the file server/gateway system
	- Fixed a bug that caused the deletion of the wrong file
	- Fixed a bug that caused file apps to close when changing
	tabs on the Files Manager
	- Fixed a bug that caused the LAN elements to not update correctly
	- Fixed a bug that caused the file servers unable to receive files
	- Fixed a bug with the Security screen
	- Added a case for the Security screen when there is no security
	installed
	- Fixed a bug that caused the infected systems to not be displayed
	on the fullscreen Map
	- Fixed a crash in the E-Mail window
	- Fixed a bug that caused the "Not enough space" pop-up to not
	appear when uploading files
	- Fixed a bug on the file server that made it show an incorrect
	amount of free space
	- Fixed a crash when editing notes or other text boxes
	- Removed the apps from the E-Mail attachment menu (except for the
	mission critical ones)
	- Changed the timing of the mission generation frequency
	- Made the readonly account on servers actually be useful
	- Fixed a bug that caused servers to not reset their bypassed security
	systems
	- Added a the version number in the About window
	- Fixed some typos

BETA v0.96
	- Fixed some scaling issues on 4:3 resolutions
	- Fixed an issue with LAN Locks where they would not display
	their status correctly
	- Added a pop-up when trying to load an old or corrupted profile
	- Fixed an issue with the surnames file which caused the names
	to have impossible to type characters
	- Fixed some more bugs related to the Security Screen
	- Added a login sound
	- Tuned the Logs and Files apps' timings to accustom the Mod's
	multitasking
	- Fixed a crash when getting caught while accessing logs or files
	- Added a "connecting to" animation when connecting to a new server
	- Fixed a crash when using the Log Out hotkey
	- Fixed a crash when deleting notes
	- Fixed a bug that caused the "readonly" user to be useless on
	the Internation Databases
	- Fixed a crash when opening the LAN Window, introduced in the last
	version (sorry 'bout that!)
	- Changed the Log_Deleter v3 to ignore deleted logs
	- Added Enter key support on server's input text fields
	- Changed the Voice_Analyser v2 files menu to only show the
	person's name
	- Fixed a bug in the View Record screen where the password and
	security fields where inverted
	- Fixed the Nuke and Motion Sensor icons
	- Fixed a bug that allowed the player to run the Motion_Sensor
	without actually having the system installed
	- Fixed a bug where the Decrypter showed an incorrect version
	in the Task Manager
	- Added a Save Game button in the system menu
	- Fixed a bug with the Uplink_Agent_List that caused the text
	to remain visible after closing
	- Fixed the bug with deleting e-mails
	- Moved the Attachment, Reply & Delete e-mail buttons to the
	bottom
	- Fixed a crash when deleting e-mails with the hotkey

BETA v0.95
	- Fixed the BBS Icons when the mission is encrypted
	- Made the details font on the E-Mail list items a bit bigger
	- Made the subject line of the E-Mail truncate when it's too big
	- Added a pop-up when leaving the Files or Logs screens while
	running apps
	- Changed the IPs to use IPv4 addresses (special IPs remain the same)
	- Fixed a bug in the loan missions where the mission would not be
	completed if the player wrote the loan as a "xxxxc" format
	- Fixed a bug in the "Destroy a computer" missions where sometimes
	an employer asked to destroy one of their own computers
	- Fixed a bug in the LAN view where elements would be out of draggable
	range
	- Fixed a bug on the LAN systems login where a Voice Analyzer button
	would appear instead of a Password one
	- Adjusted the timings of the apps (again!) to be closer to vanilla
	- Fixed a bug in the Files Manager where it would show an incorrect
	value for the available space
	- Fixed a crash when assigning hotkeys to Apps
	- Changed the icons for passive (context) apps to make the active ones
	stand out
	- Added an attachment button when viewing e-mails with attachments;
	this also fixes the vanilla bug where the campaign would become unplayable
	if he/she didn't have enough space on their HDD when receiving attachments
	- Fixed the Connection Analyzer showing more security systems than there
	actually are
	- Fixed some typos
	- Fixed a bug where the LAN View would be over the fullscreen Map
	- Adjusted the text truncation systems
	- On the Map, the Reset button changes into a Disconnect one if connected
	- Fixed a bug where the News list would not update correctly
	- Fixed the Revelation_Tracker and added an icon for it
	- Fixed the Revelation virus and added an icon for it
	- Fixed the Faith app and added an icon for it
	- Fixed the Voice_Analyzer v2.0 load menu
	- Adjusted the Dictionary_Hacker's timings
	- Made the news article scrollable
	- Fixed the Randomizer from removing InterNIC if it was originally
	selected by the player
	- Fixed a crash when loading a connection that had a recently removed link
	- Made the location name in the top bar truncate
	- Fixed the Logs screen issues! (Log_Deleter & Log_Modifier)
	- Added a completion sound to the Log_Modifier
	- Changed the Security Systems screen to let the player deactivate
	systems when the Proxy is bypassed
	- Made the Files Manager open on the Files tab
	- Fixed the known password buttons on Password screens
	- Fixed a crash when quitting the game from the HUD
	- Made the Notes and Hotkeys save in the users folder instead of in the
	uplinkHD folder
	- When removing a user, its Notes and Hotkeys also get deleted
	- Fixed a crash when deleting an E-Mail with the hotkey

BETA v0.941
	- Fixed a bug that made some missions replys not work
	- Fixed a bug that caused files to disappear after closing their
	delete app and then trying to download them

BETA v0.94
	- The mission links don't hide after completion anymore
	- Added the unused music from the Bonus CD
	- Fixed a crash when searching for people on
	Academic/Criminal/Social Databases
	- Fixed a bug that prevented the Analyzer to open on high resolutions
	- Made the News article field size bigger to prevent truncation
	- Some apps now close after a successful completion
	- The bounce sound can no longer be heard when just connecting to a 
	new computer
	- Fixed a bug where the time advancement would not work after a new game
	- Made the mission descriptions reflect the targets gender
	- Made the "Show only favourites" button keep its setting between disconnects
	- Fixed a hang when contacting an employer on the BBS Screen
	- Fixed the LAN Radio Transmitter Screen
	- Fixed a crash when connecting to different LAN servers one after the other
	- Fixed a bug that caused a LAN server to be unresponsive when connecting
	to it right after disconnecting from another one
	- Capped Text Field boxes
	- Fixed a bug with truncating large words in Text Fields
	- Fixed the Gateway_Nuke app
	- Fixed the Motion_Sensor app
	- Added truncation to the Hardware sale items to prevent spilling
	- The game speed is set to Normal after loading a game
	- Fixed a bug with the Gateway_Nuke pop-up that kept it shown
	- Fixed a bug with the Gateway_Nuke that prevented it to nuke correctly
	- Added icons for the Gateway_Nuke and Motion_Sensor
	- Added icons to special missions on the BBS
	- Fixed some timing issues with the apps
	- Fixed a bug with the Criminal Record in the User Window
	- Fixed the Log_Deleter
	- Fixed the crash when deleting logs
	- Fixed the crash when disconnecting or exiting the screen while
	deleting logs/files
	- Fixed a bug that caused the File Downloads to not stop after
	disconnecting or exiting the screen, causing it to fill up the
	player's computer
	- Fixed the Uplink_Agent_List
	- Added an icon for the Uplink_Agent_List
	- Fixed a crash when entering password screens
	- Fixed the Security Screen (for reals, this time!)
	- Made the input text field on the Console Screen stay selected
	after inputting a command
	- Made the Randomizer use all of the player's links instead of
	just the visible ones
	- Moved the game speed hotkeys to F5-F8 to prevent hittign them
	by mistake
	- Changed the arrow buttons directions on the E-Mail Window
	- Made the font a bit bigger on the E-Mail and Notes Windows
	- Made the font a lot bigger on the E-Mail and Notes Windows, on
	low resolutions
	- Definitely fixed the Text Caret sizing on different resolutions
	- Made the Open Window hotkey act as toggles
	- Fixed the assigning of App Hotkeys, again!
	- Fixed the IP_LookUp and IP_Probe apps
	- Fixed a crash when quitting while connected to a Files server
	- Fixed the layering of the windows and Map
	- Fixed keyboard lag!
	- Fixed software mouse lag!

BETA v0.93
	- Fixed the Log Out and Quit hotkeys
	- Adjusted the Browser & LAN screens positions on ultra-
	wide monitors
	- Added an instance limit to some apps; this fixes a crash
	when spamming log/files deletion
	- Fixed some crashes when hacking LAN systems
	- Fixed a bug that caused the LAN window to not open after
	a disconnect
	- Tuned the LAN system connections to work better
	- Added hotkeys for all LAN Tools
	- Added correct LAN Tools icons in the LAN System context-menu
	- Fixed a bug were after Enabling/Disabling an Isolation Bridge
	would render the LAN systems unresponsive
	- Added Connect & Reset commands to the LAN System context-menu
	- Fixed some issues with line rendering - most evident in the
	LAN Window
	- Fixed an incorrect font on the Criminal Database search person
	screen
	- Fixed a crash that happened when you disconnected while searching
	for a person
	- Fixed a few crashes on the Mission BBS screen
	- Definitely fixed the Game Over screen
	- Optimized the BBS/Links/Logs/Files server screens
	- Fixed incorrect text truncation on low resolutions
	- Tuned Scrollabled Lists
	- Fixed a bug on the Files Manager where the used space wasn't
	updating correctly
	- Removed the grab marks from all apps and added pass-through
	functionality to their buttons to make dragging easier
	- Fixed a bug where the Map became unresponsive if it was opened
	during a disconnect
	- Fixed a bug where deleting an E-Mail would not immediately do so
	- Fixed a bug in the Apps Menu to update with the most recent purchase
	- Made the Trace_Tracker sounds a bit louder
	- Removed the alert when deleting an empty note
	- Made the last user on the Main Menu update correctly when removing
	a user
	- Made the InterNIC & Uplink Internal links un-removable on the player's
	bookmarks screen
	- Added hotkeys for the links context-menu commands
	- Fixed the server Security screen
	- Fixed a missing Security screen icon
	- Removed 4:3 resolutions from the options menus
	- Fixed the Full Screen option to correctly detect the monitor's resolution
	- Fixed a bug where inactive buttons still received input
	- Fixed a bug which alowed the Tab hotkeys to jump to inactive text fields
	- Added captions to the Stock/Bank account creaion fields
	- Added a prompt to stop the player from purchasing the same thing twice
	- Fixed the links from being visible on the map after removal
	- Fixed a bug where while bouncing, hitting the Load button made the
	connection unresponsive
	- Definitely fixed the Stock/Bank account creation
	- Definitely fixed the Bank transfers (for realsies!)
	- Changed the Sample LAN map coordinates to not be outside of the map
 
BETA v0.92
	- Fixed the NPCs not saving their gender to the userfile
	(this lead to funny situations ;)
	- Fixed receiving of bank loan interest on new game
	- Added Tab/Shift+Tab hotkey to switch between TextFields
	- Changed "Software Upgrades" to "Apps Upgrades"
	- Added feedback when running the Password_Breaker
	- Added keyboard input to the Pop-Up: Esc to Cancel, Space
	or Enter to Accept
	- Fixed a slew of scaling issues
	- Custom Gateways now support thumbnails, by adding them to
	"uplinkHD/graphics/THUMB.png" - the size should be 148x205
	- Fixed a bug where the HUD Upgrades weren't detected properly
	- Fixed LAN Systems
	- Added Pop-Ups when Enabling/Disabling Locks or Isolation
	Bridges on LAN Systems
	- Added locked/unlocked states to the Lock systems on LANs
	- Fixed a bug where you could reset a connection while connected
	- Fixed the Decypher taking ages to complete
	- Fixed the crash when Loading a connection if you had none saved
	- Revelation infected systems are now visible on the Map
	- Turned the volume a tad higher on some NPC voices
	- Fixed text truncation on multiple resolutions
	- Added buttons to the Analyser window to start the needed apps
	easier
	- Fixed the TextField caret scaling
	- Added an option to disable/enable the software mouse
	- Changed the Connection Randomizer to let the player choose
	multiple end servers
	- Added a "Create New" option to the Notes Menu
	- Removed the Favourite/Show on Map options from the Links menu
	when not on the Player bookmarks screen
	- Added a visual cue to the Apps version button in the Apps
	upgrades screen
	- Added a Favourite filter on the Player's bookmarks screen
	- Removed the awful LAN tools sounds
	- Modified the App Menu to open and close only from the TaskBar
	button
	- Added a back button to the InterNIC Browse page and the
	copmany Links screen
	- Fixed a bug where the hotkeys would not work if you had CapsLock
	or ScrollLock on
	- Fixed the Voice_Analyzer taking ages to complete
	- Fixed a bug where the News and BBS screens would not update
	correctly while viewing them
	- Fixed a minor text spill on Company Info screen
	- Fixed a bug where if you'd log out while having apps open
	would leave some "App v1.0" items in the Task Manager when logging
	back in
	- Added Notes & Hotkeys autosaving with the userfile
	- Fixed a bug where the options would not save correctly
	- Added an Options menu in-game
	- Sorted the e-mails new to last
	- Added a few more E-Mail features based on user feedback
	- Fixed a bug where the Remove Bookmark option would not do anything
	- Added the version number on the Main Menu screen
	- Fixed a bug where the elements would not sort correctly after
	removing Logs/Missions/Files/anything; this also fixes a bunch of
	bugs where buttons would become unresponsive!
	- Fixed a minor text spill with the file encryption level in the
	Files Manager window
	- Bank transfers now work
	- You can now create Bank / Stock accounts
	- Files Manager and E-Mails windows can now be closed from their
	respective TaskBar buttons
	- Added a pop-up when deleting all notes
	- After sending an e-mail the window now returns to the last tab
	opened
	- Fixed tooltip scaling
	- Fixed a bug where the Welcome screen would not get removed after
	logging out and back in
	- Fixed a bug where there would be an Undefined username on the MM
	- Removed NPC names that used accents, rendering them unsearchable
	- Fixed a crash when using the speed buttons - it was because you
	were cought! And the disavow screen didn't work.
	- Fixed the Disavow/Game Over/TEAM screens

BETA V0.91
	- Saved Map connections are now saved in the userfile
	- Fixed issues with rescaling on different resolutions
	- Fixed a case in which the text in the E-Mail notification
	would not truncate correctly
	- Fixed a bug that caused lines to not render correctly
	- Added a confirmation pop-up when deleting user profiles
	- Added status icons to links to better see if it's already
	bookmarked or favourited
	- Fixed a bug that caused the Trace_Tracker to not reset
	after a trace
	- Fixed a bug that caused the BBS mission descriptions to not
	truncate correctly
	- Fixed a bug that caused the Apps descriptions to not truncate
	correctly
	- Fixed the UNIX Console. Works now!
	- Fixed the crash when deleting local files
	- Made the Connection Randomizer cheaper
	- Fixed Hotkeys from not working when NumLock was off
	- Added Read/Unread states to e-mails
	- Fixed a bug that allowed files/logs to be deleted even if
	the server had a Proxy/Firewall
	- Fixed the Company Links screen that displayed the search
	icon incorrectly
	- Fixed the E-Mails window get out of screen on 16:10 monitors
	
--------------------------------
IV.		CONTACT
--------------------------------
TUDOR C. STAMATE
	WEB:		tudorstamate.com
	E-Mail:		tudor.stamate@gmail.com
	TWITTER:	@VagabondTeddy
	
INTROVERSION SOFTWARE
	WEB:		introversion.co.uk
	SUPPORT:	support.introversion.co.uk
	TWITTER:	@IVSoftware

--------------------------------
V.		THANKS
--------------------------------
Special thanks go out to my lovely girlfriend, for putting up
with my lack of sleep induced shenanigans and all of my friends
and colleagues who supported me throughout. HUGS 4 EVERYBODY! <3
	
--------------------------------
VI.		COPYRIGHT & CREDITS
--------------------------------
UPLINK - TRUST IS A WEAKNESS
	COPYRIGHT (C) 2003, Introversion Software, Ltd.
	
UPLINK OS
	TUDOR C. STAMATE
	
AERO MATICS (Font)
	Created and Edited by: Jayvee D. Enaguas (Grand Chaos)
	Creative Commons (CC-BY-NC-SA 3.0)
	
SOUNDS
	DEV_TONES
	rcptones.com/dev_tones
	Creative Commons (CC BY 3.0 US)
	
	NARFSTUFF
	narfstuff.co.uk
	
PEOPLE PORTRAITS
	Copyright: Edhar Yuralaits / 123RF Stock Photo
	Copyright: Andriy Popov / 123RF Stock Photo
	
CIRCUIT BOARD TEXTURE
	Copyright: sdwhaven / Free for personal or commercial uses.
	
ALLEGRO 5
	|Copyright © 2008-2010 the Allegro 5 Development Team
	|
	|This software is provided 'as-is', without any express or implied warranty.
	|In no event will the authors be held liable for any damages arising from
	|the use of this software.
	|
	|Permission is granted to anyone to use this software for any purpose,
	|including commercial applications, and to alter it and redistribute it
	|freely, subject to the following restrictions:
	|
	|The origin of this software must not be misrepresented; you must not claim
	|that you wrote the original software. If you use this software in a product,
	|an acknowledgment in the product documentation would be appreciated but is not required.
	|
	|Altered source versions must be plainly marked as such, and must not be misrepresented
	|as being the original software.
	|
	|This notice may not be removed or altered from any source distribution.