<div align="center">

# <img src="data/images/icon_256.ico" width="32" height="32"> Battles of Batch
  
[![](https://badgen.net/badge/icon/windows?icon=windows&label)](https://github.com/136MasterNR/Battles-of-Batch#-battles-of-batch) [![](https://badgen.net/github/release/136MasterNR/Battles-of-Batch)](https://github.com/136MasterNR/Battles-of-Batch/releases) [![](https://badgen.net/github/stars/136MasterNR/Battles-of-Batch)](https://github.com/136MasterNR/Battles-of-Batch/stargazers)

##### _Copyright (C) 2019~2022 HTSoft-Studios™_

</div>

Battles of Batch is a game which runs on Window's MS-DOS terminal. It's an RPG text game, where you fight enemies in various battles. This project was first developed by 136MasterNR in 13th August 2021.

## Download/Installation Process, Requirements & Notes
  - **Download the wizard here**: [BattlesOfBatch-Setup.exe](https://htssoft.tk/get-download/BattlesOfBatch-Setup.exe) [LATEST RELEASE]
  - **Download manually here**: [battlesofbatch-latest.zip](https://htssoft.tk/get-download/battlesofbatch-latest.zip) [LATEST RELEASE]

Battles of Batch is currently only available on Windows, with a required command line version at least 10.0.1 and higher. It is not recommended to use the new Windows Terminal.

This project uses [ANSI](https://www.robvanderwoude.com/ansi.php) as a text formatter. We use [ANSI](https://www.robvanderwoude.com/ansi.php) to format the colors on the window and manage displayed text. It is required for almost anything to work properly.

Please note that downloading the game from the source code is not recommended because it contains features which are not yet finished or tested out. The source code also contains files that are not added to the original game. Please consider downloading by using the wizard or a release instead!

**Warning: Your antivirus might detect the wizard as a malware, but that's a false positive. I coded the wizard in PowerShell and converted it to EXE using  [PS2EXE](https://github.com/MScholtes/PS2EXE) which is falsely detected as a malware due to vandalism on the software. If you are unable to whitelist the wizard, please consider using the manual download which was mentioned above, or a release in this repository. You can also find the source code of it in the [installer](/installer) folder.**

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
    - **Settings**/**Options**: Change your Preferences
    - **Exit**: Exit The Game
    - **Reset**: Reset your player data
    - **HTS**: LGBTQIA+
  - **Map**: 
    - **Play**/**Start**: Start Selected Level
    - **Forward**: Move Forward/Next Level
    - **Prev**: Move Backwards/Previous Level
    - **Exit**/**Back**: Move to the previous UI (to the Menu)
  - **Battle**: 
    - *Enter the Whole Word of an Action, e.g. `attack` or `atk` to attack an enemy*
    - **Exit/Quit/Back** = End current battle and move to the previous UI (to the Map)

### Shortcut Keys (#2.1)
Press ***CTRL*** + ***W*** on some User Interfaces to get more information about it.
  - **Menu**: 
    - ***A***/***P***: Level Selection
    - ***Q***: Quests
    - ***W***: Workshop & Upgrades
    - ***S***: Settings/Options
    - ***E***: Character & Inventory
    - ***Z***: Craft and forge Items
    - ***X***: View the items Workshop
    - ***C***: View and upgrade your Skills
    - ***V***: Credits
    - ***CTRL*** + ***Q***: Exit in safe-mode
    - ***CTRL*** + ***R***: Restart the game
    - ***CTRL*** + ***SHIFT*** + ***6***: Reset all your player data
    - ***CTRL*** + ***SHIFT*** + ***-***: LGBTQIA+
  - **Character**
    - ***A***: Equip items.
    - ***D***: Equip weapons.
    - ***X***: Customize your character's appearance.
    - ***Z***: View your character's history.
    - ***Q***: Return to the menu.
  - **Map**: 
    - ***A***/***Enter***: Start Selected Level
    - ***D***: Move Forward/Next Level
    - ***S***: Move Backwards/Previous Level
    - ***Q***: Move to the previous UI (Menu)
    - Press any **number** to instantly move to a level
  - **Battle**: 
    - *Press the First Letter of an Action, e.g. `A` to attack*
    - ***E***: Cast special skill
    - ***Q***: End current battle and move to the previous UI (to the Map)

## Strategy Methods
### How it Works : Enemies (#3.0)
  - Enemies spawn with a random amount of HP, the amount increases depending on the level you have selected.
  - Enemies deal a random amount of damage to the player, the amount increases depending on the level you have selected.
  - Every enemy deals its own damage, so this means once one enemy is dead it will no longer deal damage, dealing less total damage to the player.

### How it Works : Skills (#3.1)
  - **Main Attack**: Increases your base damage.
  - **Crit Rate**: Increases the chance to throw a critical strike to an enemy.
  - **Max Health**: Increases maximum HP by 100.

### How it Works : Items (#3.2)
  - **Bomb**: Stuns enemies, skipping their next round/action. Bosses cannot be stunned by this attack type. Effects, such as poison on the player, will still function.
  - **Heal**: Gives the player HP. This does not skip the next enemy round/action, and still take damage. Thus it's upgradable.
  - More Coming Soon!

### How it Works : Crafting Items [FUTURE UPDATE]
  - You can craft items by accessing the Shop, and switching to the Craft tab. Every item requires materials for it to be crafted, once you gather all required materials, you will be able to craft your item.
  - Items serve a rich in-game usage. You can equip weapons and other items such bombs or healing pots through your inventory. Weapons usually give you a big boost when it's about fighting enemies, they can give you extra damage and bonus effects.

## Enemy Details
### How Enemies Were Designed
  - The enemies' design come from the latin characters, and other references. These enemies are unable to hold any weapons, thus they could only upgrade their defense, that's why they have way too much Health Points. Enemies that come with something sharp on them, can deal a very larger amount of damage compared to other enemies. These enemies have also learnt multiple skills, some of them can really be dangerous.
### Easy Level
  - **Yara**: It is the first enemy which a beginner will encouter in the game. It's one of the weakest enemies, and there is nothing special about them.
  - **Jumpo**: It can be found on the second level. Its design comes from a Sea-Horse. It's very known for how strong it is, because of its very sharp but small tail.
  - **Nimbo**: This enemy is known for its defense power. It's very hard to kill, and can be very annoying.
### Medium Level
  - **Weavy**: More Info Soon!
  - **Boi**: More Info Soon!
  - **Zorm**: More Info Soon!
  - **French**: This enemy is the stronger version of Jumpo. Because of how hard and heavy it is, it deals a very large amount of damage, and has a decent amount of defense.
  - **Twu**: More Info Soon!
  - **Nein**: More Info Soon!
  - **Uno**: More Info Soon!
  - **Snek**: More Info Soon!
### Hard Level
  - More Coming Soon!

<details><summary>

### List of all Items (Click)

</summary>

      Weapon Items
        Dustblade (Lvl 1 Lame Blade) {Base Damage: 10}
        Cold Twill (Lvl 2 Basic Pistol) {Base Damage: 15}
        Comradehammer (Lvl 15 Super-Fi Heavy Hammer) {Base Damage: 45} [Bonus Effects: 10% Chance to deal a total amount of 150% damage)
        Stylefi (Lvl 16 Super Neon Pistol) {Base Damage: 60} [Bonus Effects: Extra 2% Crit Rate]
        Flora Thrower (Lvl 20 Light Blue Toxicthrower) {Base Damage: 75} [Bonus Effects: 10% Chance to Poison a single enemy, lasts for a total of 2 rounds]
        Trident of Gura (lvl 26 Blue Trident) {Base Damage: 80} [Bonus Effects: 25% Chance to stun a single enemy, skipping their next round]
        Infernal Blade (Lvl 30 Fire Blade) (Base Damage: 85) [Bonus Effects: 80% Chance to set on fire an enemy, dealing 10% of your base damage on every round]
        Ornate Cobalt (Lvl 40 Plasma Shooter) {Main Damage: 200} [Bonus Effects: Shares an extra amount of 5% of your base damage to all enemies]
        Brainleader (Lvl 50 One-Shot Gun) {Base Damage: 5} [Bonus Effects: An extra amount of 495 damage is dealt to ALL enemies on every single round] [Side Effects: -99% HP]

      Artifact Items
        Healing Potion (Lvl 1 Healing Item) {Effects: Heals you by 15% when used, and again 5% when the next round finishes}
        Oracle Shield (Lvl 4 Buff Item) {Effects: Take 30% less damage for 4 rounds, 20% chance to stun all enemies, skipping their next round}
        Cup of Misery (Lvl 8 Buff Item) {Effects: Extra 10% base damage for 4 rounds}
        Totem of Salute (Lvl 10 Buff Item) {Effects: If you lose all your HP on the next round, your HP will be increased by 100%}
        Barrel Bomb (Lvl 14 Explosive Item) {Effects: Deals 60% of your base damage to all enemies}

      Armour Items
        Boots of the Aether (Lvl 45) {Effects: Increases HP by 20%, automatically heals you by 20% every 3 rounds, if HP already maxed then max HP increases by 20%}

      Material Items
        Stained Dust (Lvl 1 Material)
        Reactive Powder (Lvl 8 Material)
        Light Resin (Lvl 12 Material)
        Double Marble (Lvl 18 Material)
        Prism Dust (Lvl 18 Material)
        Exalted Nickel (Lvl 24 Material)
        Eternal Ethereal (Lvl 40 Material)

</details>

<br/>

# Levels & Story

<details><summary>

### Chapter 1 (Click)

</summary>

  - **Prologue**:
    - Enemies: More Info Soon!
    - Story: Coming Soon!
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

# User Interfaces
### Menu (#4.0)
  - The menu is decorated with various ascii art, and the title at the top. In the middle, you can view your general stats such as your Level, your Money and your Next Battle. Below you can see the commands which let you navigate to other user interfaces. When shortcut keys enabled, press to A to navigate to the [Map](https://github.com/136MasterNR/Battles-of-Batch#map-41) interface, Q (which stands for Quests) to the [Quests](https://github.com/136MasterNR/Battles-of-Batch#quests-45) interface, W (which stands for Workshop) to the [Workshop](https://github.com/136MasterNR/Battles-of-Batch#shop-44) interface, E (which stands for Equipment) to the [Character & Equipment](https://github.com/136MasterNR/Battles-of-Batch#character--equipment-43) interface, S (which stands for Settings) to the [Settigns](https://github.com/136MasterNR/Battles-of-Batch#settings-46) interface.
![](https://user-images.githubusercontent.com/62593379/186289521-0bae6d42-d268-4c54-af6b-3a53cd08e624.png)

### Map (#4.1)
  - The Map interface lets you see all the available levels, and navigate through available chapters. At the top, you can view information about the current level & chapter, such as the Battle's title (Story Title), the next Battle, yout Total Wins and more information about the selected level, such as the general difficulty, the recommended level and the enemies that will appear in battle.
![](https://user-images.githubusercontent.com/62593379/186290360-ee5d9e6b-fa02-4cc3-9aeb-a0e19e20e8ba.png)

### Battle (#4.2)
  - More Info Soon!

### Character & Equipment (#4.3)
  - The Character & Equipment interface lets you view your character's statistics, customize your character, view your character's history (based in the story) and allows you to equip or unequip items. At the top center you can view you character and at the right and left you can view the statistics of your character such as, your username, your money, your level, your experience, your total health points, your strength, your chance to strike critical hit and your defense. Below you can view your Items + Equiped Items, your Materials and your Weapons + Equipped Weapons. More statistics are shown when you move to the equipment UI.
![image](https://user-images.githubusercontent.com/62593379/188514583-d3b5afcc-e39c-4ec7-b9e8-082b79e2fe69.png)

### Shop (#4.4)
  - **Items**: Items require in-game currency and specific character level. The level requirement is displayed as the symbol "↑", and currency as the symbol "$". The UI is categorized in 3 categories, first is Weapons and other sources that deal damage, second is Crafting Materials which are used for crafting items or weapons, and third is Potions and Other, which are used as support items.
![](https://user-images.githubusercontent.com/62593379/186287154-0b28429b-e357-4258-bbb7-f24c622a8fc5.png)
  - **Skills**: Upgrading skills is very important. It gives you an amount of permant benefits in the game. To upgrade a skill, you must meet the requirements, such as currency, which is represented as the symbol "$" and level, which is represented as the symbol "↑". The UI has a total of 5 upgradable skills. The first one is Base Attack which makes you deal more damage to enemies, second is Crit Rate which gives you more chance to make a critical strike, third is Max HP which gives you more total HP when in battle.
![](https://user-images.githubusercontent.com/62593379/186286664-2f4f36ea-2d10-4df5-bdda-5594943cb49a.png)
  - **Craft**: More Info Soon!

### Quests (#4.5)
  - Quests are important for quickly progressing through the game, once a quest is done, you get rewarded with lots of XP and Coins.
![](https://user-images.githubusercontent.com/62593379/186288456-bdf6044c-984f-4e17-8f73-6dfb8e7a74d6.png)

### Settings (#4.6)
  - The settings UI lets you customize your preferences. By typing the name of an option, you can toggle it off/on or set a specific value to it.
![](https://user-images.githubusercontent.com/62593379/186287701-8390e429-9cd4-4f8f-b0b2-ce0afedb0ed1.png)

# Explaining Technical Features
### Gameplay Features
  - More Info Soon!

### Saves Manager
  - Where your data are stored:
    - All your data of our porjects are saved on a single local directory in your appdata; `%appdata%\HTS_DATA`. Battles of Batch's directory is named after its PHASE and VERSION. On `%appdata%\HTS_DATA`, you will find the game named as `BATTLESOFBATCH-%PHASE%-%VERSION%`. `%PHASE%` means the stage of the project, and `%VERSION%` the game version. E.g. `BATTLESOFBATCH-INDEV-0245`. Under that directory are the child directories `SAVES` and `SETTINGS`, plus some other `.dll` true/false files. On your first startup of the game, it automatically creates the player data saves under your game's appdata path directory.
  - How the saving system works:
    - The game automatically saves your progress every time your player data variables are modified. The program does not rewrite the whole save file, it only modifies lines on it. For example, if you complete a quest, it will only change the line where that quest is saved on, that also goes for total completed levels and more.
  - How your inventory is managed:
    - Your in-game inventory is a complete different process than the ones mentioned above. There are no variables in your inventory save files, this fact makes this saves manager one of the most difficult things coded in this game. Your inventory is managed by a script called `items.cmd` located in `.\data\scripts\playerdata`, and it manages files in `SAVES\inv\`, files such materials, regular items, and weapons. Your inventory save data is completely dynamic, this means, the first time you enter the game you will have empty files laying in your inventory's save data. To store an item in your player data, it must include its name and its level (or amount). When an item's amount reaches a value 0, it no longer stays in your player data, instead the items script uses its name to search for the line position and then completely wipe that line leaving all the other items present except that one. When an item with the same name of an existing item tries to save in, it just stacks up and increases the amount value instead of saving the same item twice. When the game requests the manager to take data from the save files, there's a very complex way of doing this; first, the script has to seperate every single line into temporary multiple variables, then take that line in another process and seperate every part of it into usable multiple variables. Simple, right? Not at all.
  - Multiple profiles:
    - Coming Soon!
  - Saves encryption:
    - Coming Soon!

### Audio Manager
  - The audio is played by a Visual Basic script, which is managed by the Audio Manager, a batch file. The Audio Manager is always running in the background as a seperate task, unless you have turned sounds & music off. It detects whether the game is running every 1 second, and if it's not, it stops the audio tasks, and then itself. The way to detect whether the game is running is to try to access a file which is being used by the game contantly. On the start up of the game, the game sets a file as the logger, and that file cannot be accessed by other programs for as long the program which is using it (the game) is running.

### Auto Updater
  - The updater starts and checks for updates automatically when you start the game. It pulls information from [get-update](https://github.com/136MasterNR/HTS-Studios/tree/main/get-update), compares your local game's version with the online version and then prompts to you whether to update or not before completely loading into the game. After you confirm to update, the updater will pull the whole game from [get-download](https://github.com/136MasterNR/HTS-Studios/tree/main/get-download) and will replace all your old game files with the new game files. This will not reset your saves, but if the next update requires you to reset your saves, you will be prompted for a second confirmation.

### Error Handler
  - More Info Soon!

# Miscellaneous
### Cheats
  - Go to the menu and type `cheats` (WARNING: IT WILL RESET YOUR SAVES, CREATE A BACKUP FIRST!)

# For Developers
### Code your own levels
  - Coming Soon!

### Create your own enemies
  - Coming Soon!

### Create your own items
  - Coming Soon!

### Use Commands for Devs
  - Go to the menu, and type `cmd`, then type `commands` to list all available dev cmds. If shortcut keys enabled, hit CTRL + T.
    - **clear**: Clears the console window.
    - **debug**: Enables manual debugging mode, it gives more information on some User Interfaces, and reverts some User Interfaces back to preDev versions.
    - **import**: Display an [ANSI](https://www.robvanderwoude.com/ansi.php) text file. Use `.ans` as a file type. Use an argument after the command, e.g. `import mysupertxt.ans`. Make sure to move your ansi text in the directory `.\data\cmds\`.
    - **help**: See more information and all the commands.

# FAQ
  - Q: **Why in Batch?**
    - A: **I started this project as a challenge for myself. Making a game in such a tricky and badly-made langauge might have been hell, but a great challenge.**

# Credits
  - **Programmed** by
    - 136MasterNR

  - **Story directed** by
    - 136MasterNR
    - johnypro150

### Ascii Art
  - **Character Designs** by
    - [asciiart.eu](https://www.asciiart.eu/)
    - [patorjk.com](https://patorjk.com/)
    - 136MasterNR

  - **Layout Designs** by
    - 136MasterNR

### Sounds
  - **Music** provided by 
    - [pedi me arxes](https://www.youtube.com/c/pedimearxes) provided [Dangerous Plains](https://www.youtube.com/watch?v=rF9K51_3p10)
    - [Alexander Nakarada](https://www.serpentsoundstudios.com) provided [Village Ambiance](https://www.youtube.com/watch?v=VKKSQ4UHLRE) and [Winter Night](https://www.free-stock-music.com/alexander-nakarada-winter-night.html)

  - **SFX** provided by
    - 136MasterNR

### Special Thanks

  - **Shoutout** to our **Testers**:
    - ThePurgeKing
    - AgentANP
    - 2002Spiele
    - [ComradeTurtle](https://github.com/ComradeTurtle)
    - BlackStorm
    - JayKayHere3987

# Thank you for choosing our projects! :shipit:
### A lot more information about this project will be added in this read me every now and then.
