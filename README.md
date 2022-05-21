<div align="center">

# <img src="data/images/icon_256.ico" width="32" height="32"> Battles of Batch
  
[![Foo](https://badgen.net/badge/icon/windows?icon=windows&label)](https://github.com/136MasterNR/Battles-of-Batch#-battles-of-batch) [![Foo](https://badgen.net/github/release/136MasterNR/Battles-of-Batch)](https://github.com/136MasterNR/Battles-of-Batch/releases) [![Foo](https://badgen.net/github/stars/136MasterNR/Battles-of-Batch)](https://github.com/136MasterNR/Battles-of-Batch/stargazers)

##### _Copyright (C) 2019~2022 HTSoft-Studios™_

</div>

Battles of Batch is a game which runs on Window's MS-DOS terminal. It's an RPG text game, where you fight enemies in various battles. This project was started by 136MasterNR in 13th August 2021.

## Download/Installation Process, Requirements & Notes
  - **Download the wizard here**: [BattlesOfBatch-Setup.exe](https://htssoft.tk/get-download/BattlesOfBatch-Setup.exe) [LATEST RELEASE]
  - **Download manually here**: [battlesofbatch-latest.zip](https://htssoft.tk/get-download/battlesofbatch-latest.zip) [LATEST RELEASE]

Battles of Batch is currently only available on Windows, with a required command line version at least 10.0.1 and higher.

This project uses [ANSI](https://www.robvanderwoude.com/ansi.php) as a text formatter. We use [ANSI](https://www.robvanderwoude.com/ansi.php) to format the colors on the window and manage displayed text. It is required for almost anything to work properly.

Please note that downloading the game from the source code is not recommended because it contains features which are yet not finished or not tested out. The source code also contains files that are not yet added to the original game. Please consider installing by the wizard or downloading a release instead!

**Warning: Your antivirus might detect the wizard as a malware, but that's a false positive. I coded the wizard in PowerShell and converted it to EXE using  [PS2EXE](https://github.com/MScholtes/PS2EXE) which is falsely detected as a malware due to vandalism on the software. If you are unable to whitelist the wizard, please consider using the manual download which was mentioned above, or a release in this repository.**

# About
### Contact (#1.0)
  - **Discord**: [Discord]([discord.gg/Qst63njdBG](https://discord.com/invite/Qst63njdBG)) (for Community & Support)
  - **e-Mail**: [htsdevteamofficial@gmail.com](mailto:htsdevteamofficial@gmail.com) (for Business Related)
  - **Website**: [HTSoft](htssoft.tk) (for More Information)
### Copyright (#1.1)
  - **Read**: [Copyright](copyright.txt)
  - **Read**: [License](license.txt)

# Game Details & How To Play

### Game Controls (#2.0)
  - **Menu**: 
    - **Play**/**Start**: Level Selection
    - **Quests**: Quests
    - **Shop**: Items Shop & Skill Upgrades
    - **Settings**/**Options**: Cahnge your Preferences
    - **Exit**: Exit The Game
  - **Map**: 
    - **Play**/**Start**: Start Selected Level
    - **Forward**: Move Forward/Next Level
    - **Prev**: Move Backwards/Previous Level
    - **Exit**/**Back**: Move to the previous UI (to the Menu)
  - **Battle**: 
    - *Enter the Whole Word of an Action, e.g. `attack` or `atk` to attack an enemy*
    - **Exit/Quit/Back** = End current battle and move to the previous UI (to the Map)

### Shortcut Keys (#2.1)
  - **Menu**:
    - ***A***/***P***: Level Selection
    - ***Q***: Quests
    - ***W***: Workshop & Upgrades
    - ***S***: Settings/Options
    - ***E***: Exit the game
  - **Map**: 
    - ***A***/**P**: Start Selected Level
    - ***F***: Move Forward/Next Level
    - ***D***: Move Backwards/Previous Level
    - ***Q***: Move to the previous UI (to the Menu)
  - **Battle**: 
    - *Press the First Letter of an Action, e.g. `A` to attack*
    - ***Q*** = End current battle and move to the previous UI (to the Map)


## Strategy Method
### How it Works : Enemies (#3.0)
  - Enemies spawn with a random amount of HP, the amount increases depending on the level you have selected.
  - Enemies deal a random amount of damage to the player, the amount increases depending on the level you have selected.
  - Every enemy deals its own damage, so this means once one enemy is dead it will no longer deal damage, dealing less total damage to the player.

### How it Works : Skills (#3.1)
  - **Main Attack**: More Info Soon!
  - **Crit Rate**: More Info Soon!
  - **Max Health**: More Info Soon!

### How it Works : Items (#3.2)
  - **Bomb**: Stuns enemies, skipping their next round/action. Bosses cannot be stunned by this attack type. Effects, such as poison on the player, will still function.
  - **Heal**: Gives the player HP. This does not skip the next enemy round/action, and still take damage. Thus it's upgradable.
  - More coming soon.

### How it Works : Materials (#3.3)
  - Coming Soon!

## Levels & Story

<details><summary>

### Chapter 1 (Click)

</summary>

  - **Level 1**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 2**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 3**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 4**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 5**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 6**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 7**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!

</details>

<details><summary>

### Chapter 2 (Click)

</summary>

  - **Level 8**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 9**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 10**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 11**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 12**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 13**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
  - **Level 14**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!

</details>

## User Interfaces
### Shop (#4.0)
  - **Items**: Items require in-game currency and specific character level. The level requirement is displayed as the symbol "↑", and currency as the symbol "$".
  - **Skills**: More Info Soon!

### Quests (#4.1)
  - More Info Soon!

### Options (#4.2)
  - More Info Soon!
 
# Explaining Technical Features
### Gameplay Features
  - More Info Soon!

### Saves Manager
  - Where your data are stored:
    - All your data of our porjects are saved on a single local directory in your appdata; `%appdata%\HTS_DATA`. Battles of Batch's directory is named after its PHASE and VERSION. On `%appdata%\HTS_DATA`, you will find the game named as `BATTLESOFBATCH-%PHASE%-%VERSION%`. `%PHASE%` means the stage of the project, and `%VERSION%` the game version. E.g. `BATTLESOFBATCH-INDEV-0245`. Under that directory are the child directories `SAVES` and `SETTINGS`, plus some other `.dll` true/false files. On your first startup of the game, it automatically creates the player data saves under your game's appdata path directory.
  - How the saving system works:
    - The game automatically saves your progress every time your player data variables are modified. The program does not rewrite the whole save file, it only modifies lines on it. For example, if you complete a quest, it will only change the line where that quest is saved on, that also goes for total completed levels, items and more.
  - Creating multiple saved profiles:
    - Coming Soon!

### Audio Manager
  - More Info Soon!

### Auto Updater
  - The updater starts and checks for updates automatically when you start the game. It pulls information from [get-update](https://github.com/136MasterNR/HTS-Studios/tree/main/get-update), compares your local game's version with the online version and then prompts to you whether to update or not before completely loading into the game. After you confirm to update, the updater will pull the whole game from [get-download](https://github.com/136MasterNR/HTS-Studios/tree/main/get-download) and will replace all your old game files with the new game files. This will not reset your saves, but if the next update requires you to reset your saves, you will be prompted for a second confirmation.

# Miscellaneous
### Cheats
  - Go to the menu and type `cheats` (WARNING: IT WILL RESET YOUR SAVES, CREATE A BACKUP FIRST!)

# For Developers
### Code your own levels
  - Coming Soon!

### Use Commands for Devs
  - Go to the menu, and type `cmd`, then type `commands` to list all available dev cmds.
    - **clear**: Clears the console window.
    - **debug**: Enables manual debugging mode, it gives more information on some User Interfaces, and reverts some User Interfaces back to preDev versions.
    - **import**: Display an [ANSI](https://www.robvanderwoude.com/ansi.php) text file. Use `.ans` as a file type. Use an argument after the command, e.g. `import mysupertxt.ans`. Make sure to move your ansi text in the directory `.\data\cmds\`.

# FAQ
  - Q: **Why in Batch?**
    - A: **I started this project as a challenge for myself. Making a game in such a tricky and badly-made langauge might have been hell, but a great challenge.**

# Credits
  - **Programmed** by
    - 136MasterNR

  - **Story** directed by
    - 136MasterNR
    - johnypro150

  - Character Designs by
    - 136MasterNR
    - [asciiart.eu](https://www.asciiart.eu/)
    - [patorjk.com](https://patorjk.com/)
  - Layout Designs by
    - 136MasterNR

  - Music provided by 
    - [Unwind Station](https://www.youtube.com/channel/UCATu7pOE-X5L__hWParE5DQ)
    - [pedi me arxes](https://www.youtube.com/c/pedimearxes)
  - SFX provided by
    - 136MasterNR

  - Shoutout to our testers
    - AgentANP
    - 2002Spiele
    - ComradeTurtle
    - BlackStorm
    - JayKayHere3987

# Thanks you for choosing our projects! :shipit:
### Tons more infromation will be added to this readme, some time™.
