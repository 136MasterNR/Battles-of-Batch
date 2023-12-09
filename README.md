<div align="center">

# <img src="data/images/icon_256.ico" width="32" height="32"> Battles of Batch
  
[![](https://badgen.net/badge/icon/windows?icon=windows&label)](https://github.com/136MasterNR/Battles-of-Batch#-battles-of-batch) [![](https://badgen.net/github/release/136MasterNR/Battles-of-Batch)](https://github.com/136MasterNR/Battles-of-Batch/releases) [![](https://badgen.net/github/stars/136MasterNR/Battles-of-Batch)](https://github.com/136MasterNR/Battles-of-Batch/stargazers)

##### _Copyright (C) 2023, 136MasterNR_

</div>

Battles of Batch is a RPG text game built for the Windows MS-DOS terminal version 10. Wanderers fight in various battles against a variety of enemies as they progress through the game. They can complete quests, acquire new items and weapons, and experience the game's story.
##### The project was initiated by 136MasterNR on August 13, 2021.<br/><br/>

## Download/Installation Process, Requirements & Notes
  - **Latest release**: [Battles.Of.Batch.zip](https://github.com/136MasterNR/Battles-of-Batch/releases/latest/download/Battles.Of.Batch.zip)
  - **Source code**: [Battles-of-Batch-main.zip](https://github.com/136MasterNR/Battles-of-Batch/archive/refs/heads/main.zip)

After the download is complete, simply extract and run the batch file `BattleOfBatch.bat`.

Battles of Batch is currently only available on Windows, with a required command line version at least 10.0.1 and higher.

**Recommended Command Prompt settings**:
- **Font size**: 18 or 20 (for 1080p displays), 13 (for 720p displays)
- **Font family**: Consolas

The game's launcher requires VBScript on your system. It uses VBScript to launch all additional tasks in the background. If you have a specific issue with it, delete the file [data\scripts\invisible.vbs](./data/scripts/invisible.vbs) and all invisible tasks should appear minimized on your taskbar instead.

This project uses [ANSI](https://www.robvanderwoude.com/ansi.php) as a text formatter. It's used to manage displayed text and colors on the console. It's required for almost any display-related feature to work as intended.

Please note that the Source Code version contains untested features, you should use a release instead, do not report issues otherwise.
# About
### Social Media
  - [Reddit](https://www.reddit.com/r/BattlesOfBatch/) - Community & Support
  - [Youtube](https://www.youtube.com/@136masternr) - Additional Content
### Copyright
  - Read [Copyright](copyright.txt) & [License](license.txt).

# Game Details & How To Play

## Game Controls
Press ***CTRL*** + ***W*** on some User Interfaces to get more information about it.
  - **Menu**: 
    - ***A***/***P***: Level Selection.
    - ***Q***: View your Quests.
    - ***W***: Workshop & Upgrades.
    - ***S***: Change your Options and general Preferences.
    - ***E***: Check out your Character & Inventory.
    - ***Z***: To Craft or Upgrade Items.
    - ***X***: Buy items from the in-game Workshop.
    - ***C***: View and upgrade your Skills.
    - ***V***: View the [Credits](#credits).
    - ***P***: Manage your profiles.
    - ***CTRL*** + ***Q***: Emergency quit. *(Shouldn't be used under normal circumstances)*
    - ***CTRL*** + ***R***: Restart the game.
    - ***CTRL*** + ***SHIFT*** + ***6***: Reset all saved data.
    - ***CTRL*** + ***SHIFT*** + ***-***: LGBTQIA+
  - **Character**
    - ***A***: Equip items.
    - ***D***: Equip weapons.
    - ***X***: Customize your character's appearance.
    - ***P***: Manage your profiles.
    - ***Q***: Return to the menu.
  - **Map**: 
    - ***A***/***Enter***: Start Selected Level.
    - ***D***: Move Forward/Next Level.
    - ***S***: Move Backwards/Previous Level.
    - ***Q***: Move to the previous UI (Menu).
    - Press any **number** to immediately move to a level.
  - **Battle**: 
    - ***A***: Make your action.
    - ***E***: Choose an item from your inventory.
    - ***Z***: Cast special skill.
    - ***Q***: Retreat current battle and go back to the map UI.
	- ***CTRL*** + ***R***: Restart battle.

## About Combat
  - Battles of Batch features a turn based combat mechanic, with various features associated within it.
  - Both players and enemies have AVs (Action Values), AV indicates who has the next turn, and in which order. It's important to take note of one's AV so you can make your plan.

## About Effects
  - Some effects are turn-based damages, it can be applied on both the player and the enemy. Effects such as poison or fire are useful for damaging the enemies without the need of any more additional player actions. Other effects such as slow down or weakness, can be used to debuff the player or enemy for a set of turns.
  - **Slow Down**: This effect will increase the action value of the enemy or player, basically slowing them down by a bit. This can be useful to avoid double enemy attacks caused by support units.
  - **Fire**: This effect will damage the enemy or the player every registered turn, for a set amount of turns.
  - **Poison**: This effect will damage the enemy or the player every registered round, for a set amount of rounds.
  - **Bleed**: This effect will damage the enemy or the player every registered turn, until they are Healed.

## About Enemies
  - Enemies spawn with a random amount of HP, the amount increases depending on the enemy's level.
  - Enemies deal a random amount of damage to the player, the amount increases depending on the enemy's level.
  - Every enemy deals its own damage, which means once one enemy is dead it will no longer deal damage, dealing less total damage to the player.
  - Some enemies have special ablities, such as poisoning the player, or literally anything else.
### How Enemies Were Designed
  - The design of the enemies were inspired by the Latin characters and other references. These enemies are unable to wield any weapons, thus they could only upgrade their defense. That's the reason they have way too much HP. Enemies that seem to have something sharp on them can deal a much larger amount of damage compared to other enemies.
  
  - Additionally, some other enemeis have special abilities or combat skills that aren't based on damage but instead on other combat mechanic elements, this fact can make them extremely dangerous when fought unexpectedly.

  - Large amounts of enemies can be extremely difficult to fight, but they have their weaknesses too. For example, if their main weapon is too short there's much more chance for them to miss a hit (Not yet an implemented feature).

### List of Enemies & their Traits
  - **Yara**  has a very low amount of HP and deals minimum damage of 1 to 2. Has 20% chance to inflict fire on you for 1 to 2 turns, basically dealing its natural damage for the set amount of turns.
  - **Jumpo** gets inspiration of its design from a Sea-Horse. It's very known for how strong it is because of its very sharp and strong but small tail.
  - **Nimbo** has 75% chance to support a random enemy by advancing it forward (decreasing action value) by 100% (basically resetting its AV back to 0), no natural attack included. The other 25% chance will only naturally attack the player.
  - **French** is the strongest type of enemy, an upgrade from Jumpo. Because of how hard and heavy it is, it deals a very large amount of damage, has a decent amount of defense, and has 75% chance to cause the bleeding effect on you.
  - **Snek** is basically a snake, and has the ability to poison you for a few rounds.
  - **Darp** is a healer type of enemy, which sacrifices 15~20% of its own health points to heal one of its allies with the lowest health points. It does not attack you, but if no enemy needs healing, it has no choice but to attack you.
  - **Weavy** no info.
  - **Boi** no info.
  - **Zorm** no info.
  - **Twu** no info.
  - **Nein** no info.
  - **Uno** no info.
  - **Conk** no info.
  - **Volve** no info.
  - **Keesors** no info.
  - **Tore** no info.
  - **Rear** no info.
  - **Hobot** no info.
  - **Acid** no info.
  - **Threed** no info.
  - **Firth** no info.
  - **Werm** no info.
  - **Ugnet** no info.
  - **Onkey** no info.
  - **Lose** unknown.
  - **Zoro** unknown.
  - **Aight** unknown.
  - **Qanana** unknown.
  - **G????** #$%f@#6V.

## About Skills
  - **Main Attack**: Increases your base damage.
  - **Crit Rate**: Increases the chance to throw a critical strike to an enemy.
  - **Max Health**: Increases maximum HP by 100.

## About Items
  - **Bomb**: Stuns enemies, skipping their next round/action. Bosses cannot be stunned by this attack type. Effects, such as poison on the player, will still function (Not yet an implemented feature).
  - **Heal**: Increases the HP of the player. This does not skip the next enemy round/action, and the player will still take damage as usual. Can stop bleeding effects.
  - More Coming Soon!

<details><summary>

### List of all Items (Click)

</summary>

```
Note
  Some stuff in here are not yet released.

About
	Items, such as weapons and armour, are used in-game to boost stats, such as extra attack damage or critical strikes etc., they can also give special buffs or any debuffs.
	Artifact items can be used to buff the player, debuff enemies or deal damage.
	Items are upgradable, every item can be upgraded 15 times. Once an item is upgraded, its level will be increased by one. Every upgrade will increase the
	item's stats by 115%. To upgrade an item witha level of 15 or higher, you must own at least one material of Mythril. The materials required to upgrade an
	item increases as the level of the item is increased.

Weapon Items [Released]
	Dustblade (Short Blade) {Base Damage: 8}
	Cold Twill (Short Bow) {Base Damage: 20} [Bonus Effects: Slows down the enemy by 25 action points]
	Comrade Hammer (Kusarigama) {Base Damage: 45} [Bonus Effects: 50% Chance to deal a total amount of 350% damage]
	Stylefi (Long Bow) {Base Damage: 60} [Bonus Effects: Extra 10% Crit Rate]
	Flora Thrower (Magic Wand) {Base Damage: 75} [Bonus Effects: 10% Chance to Poison a single enemy, lasts for a total of 2 rounds]
	Trident of Gawra (Trident) {Base Damage: 80} [Bonus Effects: 40% Chance to stun the targeted enemy, skipping their next round]
	Infernal Blade (Greatsword) (Base Damage: 85) [Bonus Effects: 80% Chance to set on fire the targeted enemy, dealing 20% of your base damage on every round]
	Ornate Cobalt (Shield) {Main Damage: 200} [Bonus Effects: Shares an extra amount of 20% of your base damage to all enemies]
	Brainleader (Magic Ball) {Base Damage: 250} [Bonus Effects: An extra amount of 9750 damage is dealt to ALL enemies on every single round. Debuff: Loe -99% HP every time you make an action.]

Consumable Items [Releasing]
	Healing Potion (Lvl 1 Buff Item) {Effects: Heals you by 25% when used, and another 4% for the next 2 turns, can stack}
	Reactive Bomb (Lvl 4 Buff Item) {Effects: Deals an additinal 20% of your base damage to all enemies, and 100% normal damage to the selected enemy.}
	Oracle Shield (Lvl 4 Buff Item) {Effects: Take 30% less damage for 2 rounds, 20% chance to stun each enemy, skipping their next round}
	Cup of Misery (Lvl 8 Buff Item) {Effects: Extra 10% base damage for 4 rounds}
	Totem of Salute (Lvl 10 Buff Item) {Effects: When used, it will increase your HP by 25% once it gets lower than 1%}
	Barrel Bomb (Lvl 14 AoE Attack Item) {Effects: Deals an additinal 60% of your base damage to all enemies}

Artifact Items [Not Released]
	Boots of the Aether (Lvl 45) {Effects: Increases HP by 20%, automatically heals you by 20% every 3 rounds, if HP already maxed then max HP increases by 20% until the current round ends}

Material Items [Released]
	Stained Dust (Lvl 1 Material)
	Black Wood (Lvl 4 Material)
	Reactive Powder (Lvl 6 Material)
	Francium (Lvl 8 Material)
	Light Resin (Lvl 12 Material)
	Double Marble (Lvl 18 Material)
	Prism Dust (Lvl 18 Material)
	Exalted Nickel (Lvl 24 Material)
	Mythril (Lvl 30 Material) {Used to upgrade items over level 15}
	Palladium (Lvl 44 Material)
	Eternal Ethereal (Lvl 57 Material)
  ```

</details>

## Crafting Items
  - You can craft items by accessing the Shop, and switching to the Craft tab or otherwise by pressing Z on the menu. Every item requires materials for it to be crafted, once you gather all required materials, you will be able to craft your item.
  - Items serve a rich in-game usage. You can equip weapons and other items such bombs or healing pots through your inventory. Weapons usually give you a big boost when it's about fighting enemies, they can give you extra damage and bonus effects.

## Levels & Story

<details><summary>

### Chapter 1

</summary>

  - **Prologue**:
    - Story: More Info Soon!
  - **Level 1**:
    - Enemies: Y↑1, Y↑1
    - Drops:
      - 1~2 Stained Dust
      - 0~1 Branch
  - **Level 2**: 
    - Summary: Reveals a new enemy striker type J (or Jumpo), first level requiring strategy making. The player also learns how to upgrade skills.
    - Enemies: J↑1, Y↑1
    - Drops:
      - 1~1 Dust Balde (Once)
      - 1~2 Double Marble
  - **Level 3**: 
    - Summary: Reveals a new enemy supporter type N (or Nimbo) that Advances Forward enemies, & first level UP for Yara (or Y). The player learns how to use the item Heal, and equips their first weapon before battle.
    - Enemies: Y↑1, J↑1, Y↑2
    - Drops:
      - 1~1 Bomb (Once)
      - 1~2 Black Wood
      - 0~2 Stained Dust
  - **Level 4**: 
    - Summary: Reveals a new enemy striker type F (or French) that deals heavy damage and causes the Bleed effect. The player learns how to use the item Bomb and properly negate bleeding damage using the Heal item.
    - Enemies: Y↑1, F↑1, Y↑2
    - Drops:
      - 1~2 Francium
      - 0~2 Stained Dust
  - **Level 5**:
    - Summary: Reveals a new enemy striker type S (or Snek) that effects the player with poison. The player is free to make any kind of strategy.
    - Enemies: N↑1, J↑1, S↑1, N↑1
    - Drops:
      - 2~3 Light Resin
      - 1~1 Prism Dust
  - **Level 6**:
    - Summary: Reveals new enemy supporter type D (or Deffy). The player has to survive constant damage, as it is very difficult to kill the striker enemies due to support enemies healing them.
    - Enemies: D↑1, Y↑3, D↑1
  - **Level 7**:
    - ???


</details>

*More chapters coming soon.*

## User Interfaces
### Menu (#6.0)
  - The menu is decorated with various ASCII art, and the title at the top. In the middle, you can view your general stats such as your Level, your Money and your Next Battle. Below you can see the commands which let you navigate to other user interfaces. When shortcut keys enabled, press to A to navigate to the [Map](https://github.com/136MasterNR/Battles-of-Batch#map-61) interface, Q (which stands for Quests) to the [Quests](https://github.com/136MasterNR/Battles-of-Batch#quests-65) interface, W (which stands for Workshop) to the [Workshop](https://github.com/136MasterNR/Battles-of-Batch#shop-64) interface, E (which stands for Equipment) to the [Character & Equipment](https://github.com/136MasterNR/Battles-of-Batch#character--equipment-63) interface, S (which stands for Settings) to the [Settigns](https://github.com/136MasterNR/Battles-of-Batch#settings-66) interface.
![](data/images/preview_menu.png)

### Map (#6.1)
  - The Map interface allows you see all available levels, and navigate through available chapters. At the top, you can view information about the current level, such as the Battle's title (Story Title), the general difficulty, the recommended player level, and  the enemies that will appear in battle.
![](data/images/preview_map.png)

### Battle (#6.2)
  - The Battle interface is the only place where you will encounter your true enemies. The enemies will appear at the right side of your screen, waiting for your first action. At the top, you can view the current turn, the current numeric turn and current numeric round. At the bottom, you can view the action logs, which shows a list of recently made actions, and below that you can view the currenlty equipped item. Pressing E will reveal your inventory, allowing you to swap between your equipped items. Right at the bottom, you can view your player HP, your AV (Action Value), the damage you last dealt, and the total HP of all enemies together.
![](data/images/preview_battle.png)

### Character & Equipment (#6.3)
  - The Character & Equipment interface lets you view your character's statistics, customize your character, view your character's history (based in the story) and lets you to equip or unequip items and weapons. At the top center you can view you character and at the right and left you can view the statistics of your character such as, your username, your money, your level, your experience, your total health points, your strength, your chance to strike critical hit and your defense. Below you can view your Items + Equiped Items, your Materials and your Weapons + Equipped Weapons. More statistics are shown when you move to the equipment UI.
![](data/images/preview_character.png)

### Shop (#6.4)
  - **Items**: Items require in-game currency and specific character level. The level requirement is displayed as the symbol "↑", and currency as the symbol "$". The UI is categorized in 3 categories, first is Weapons and other sources that deal damage, second is Crafting Materials which are used for crafting items or weapons, and third is Potions and Other, which are used as support items.
![](data/images/preview_shop.png)
  - **Skills**: Upgrading skills is very important. It gives you an amount of permanent benefits in the game. To upgrade a skill, you first have to meet the requirements such as an amount of in-game currency, which is represented as the symbol "$", and a specific player level, which is represented as the symbol "↑". Select a skill by moving using the keys `W` `A` `S` and `D`. If you meet the requirements to update the selected skill, press `A`.
![](data/images/preview_skills.png)
  - **Craft**: More Info Soon!
![](data/images/preview_craft.png)

### Quests (#6.5)
  - Quests are important for quickly progressing through the game. Once a quest has been completed, you get rewarded with lots of XP and Coins.
![](data/images/preview_quests.png)

### Settings (#6.6)
  - The settings UI lets you customize your preferences. By typing the name of an option, you can toggle it to true or false, or you can set a specific value to it.
![](data/images/preview_settings.png)

# For Developers
*When developing something on your own, you should use the DLC packs. **DO NOT** edit the game itself as it may corrupt it entirely or cause misbehaviour! Follow the guides provided in the example DLC pack or below.*
### Create your own levels using the Level Editor
  - The [LevelEditor.cmd](data/cmd/leveleditor.cmd) lets you to create your own levels, with a user friendly interface, making it extremely simple to delete or add additional enemies, and quickly edit their stats. To enter the Level Editor, you must unlock the terminal as mentioned [here](https://github.com/136MasterNR/Battles-of-Batch#use-commands-for-devs-83), then enter a level and press ***CTRL + P***. First, start with creating your new enemy by pressing C, you will be prompted to enter the enemy's type and level. You can find the list of enemies in [enemy.cmd](data/scripts/game/enemy.cmd). Using ***W A S D J*** and ***L*** you can move the enemy around, changing their screen position. You can use ***CTRL + R*** to undo all changes, and ***R*** to refresh the menu. Once you are done editing the level, you have to press ***P*** to save all changes permanently.

### Create your own enemie
  - Coming Soon!

### Create your own items
  - Coming Soon!

### Terminal & Commands
  - To unlock the terminal, go to the settings and type in "IAMADEVELOPER", all in caps.
  - For shortcut, hit ***CTRL + T*** in any interface to access the game's terminal. Exit using `exit`.
  - After entering the terminal, type in `commands` to show all available commands and their information. Below you can read some extra information about a few commands.

    - **commands**: View infromation about all loaded commands.
    - **save**: Dumps the memory and carries it outside the terminal enviroment. This is useful when editing variables in real-time.
    - **debug**: Is the debug tool, which is useful for quickly testing something out or accessing developer-only interfaces. Use the command with no arguments to enable general debugging, this will transform some UIs to developer-view, showing more infromation about variables and removing most visual features, additionally it will always start a real-time logger cmd window at the start-up. Use the `log` argument to create a new cmd window that displays all logs, such as errors, in real-time. Use the `wscript` argument to monitor all wscript processes in real-time, mainly for audio debugging purposes. Use the `choice` argument to easily copy and paste special keys into your editor.
    - **cver**: Is used to change game versions. This will effect the file versions.cmd and your saves location. You must give it at least 2 arguments, first is the version (e.g. 0440) and then the type (e.g. ALPHA), and optionally the switch /A which carries all current version's player data to the new version.
    - **garbagecollector**: Is used to print all useless variables, or clear all of them using the `clear` argument.
    - **open**: Searches in all directories and opens the requested directory. For example if you add the argument `scripts`, it will open the [scripts](data/scripts) directory. If no argument is given, it will open the [cmd](data/cmd) directory.
    - **import**: Is used to display an ansi (ans) file.
    - **bobfetch**: Basically neofetch, but made for this game. Use the switch /? for more information and arguments.
  - All terminal commands are placed in the [cmd](data/cmd) directory.

#### Useful console snippets
  - **Set player money**: ECHO OFF & CALL "%SAVE%" "FILE=%DATA_SAVES%\PLAYERDATA.cmd" 1 /A PLAYER.MONEY= 50000 & ECHO ON

# Explaining Technical Features
### Saves Manager
  - How your game data are stored:
    - All your game data are saved in a single local directory in your appdata; `%appdata%\HTS_DATA`. Battles of Batch's directory is named after its PHASE and VERSION. On `%appdata%\HTS_DATA`, you will find the game named as `BATTLESOFBATCH-%PHASE%-%VERSION%`, where `%PHASE%` stands for the stage of the project, and `%VERSION%` the game version, e.g. `BATTLESOFBATCH-INDEV-0400`. Under that directory are the child directories `SAVES`, `SETTINGS` and `main.config`. Under the SAVES directory, you will find your profile's player data. On your first start-up of the game, it automatically creates the player data saves under your game's appdata path directory.
  - How the saving system works:
    - The game automatically saves your progress every time your player data variables are modified. The script used for this process does not rewrite the whole save file, it only modifies lines on it. For example, if you complete a quest, it will only change the line where that quest is saved on, that also goes for total completed levels and the rest.
  - How your inventory is managed:
    - Your in-game inventory is a complete different process than the ones mentioned above. There are no variables in your inventory save files, this fact makes this saves manager one of the most difficult things coded in this game. Your inventory is managed by a script called `items.cmd` located in `.\data\scripts\playerdata`, and it manages files in `SAVES\inv\`, files such materials, regular items, and weapons. Your inventory save data is completely dynamic, this means that data written in it can easily be modified by other scripts and leaving it empty won't affect it at all. To store an item in your player data, it must include its name and its level (or amount). When an item's amount reaches a value of 0, it no longer stays in your player data, instead the items script uses its name to search for the line position and then completely wipe out that line leaving all the other items present. When an item with the same name of an existing item tries to save in, it just stacks up and increases the amount value instead of saving the same item twice. When the game requests the manager to take data from the save files, there's a very complex way of doing this; first, the script seperates every single line into temporary variables, then take that line in another process and seperate every part of it into other usable variables. I hope that sounds simple.
  - Profiles Manager:
    - The profiles manager creates multiple save data for you. Your profile will appear on `%appdata%\HTS_DATA\BATTLESOFBATCH-%phase%-%version%\SAVES\`. Under that directory, you will see folders named after the profiles you created. The first profile will be created automatically upon launching the game, by the name "Wanderer". Profile names will effect your in-game name, e.g. how you will be called in the story.
  - Saves encryption:
    - Coming Soon!

### Auto Updater
  - When you start the game, the updater will launch at some point in the startup and check for an update. It pulls information from [get-update](https://github.com/136MasterNR/HTS-Studios/tree/main/get-update), compares your local game's version with the online version and then prompts you to whether you wish to update or not before completely loading into the game. After you confirm to update, the updater will pull the whole game from [get-download](https://github.com/136MasterNR/HTS-Studios/tree/main/get-download) and will replace all your old game files with the new game files. This will not reset your saves, but if the next update requires you to reset your saves, you will be prompted for a second confirmation.

### Error Handler
  - More Info Soon!

# FAQ
  - Q: **Why in Batch?**
    - A: **I started this project as a challenge for myself. Making a game in such a tricky and weirdly-made langauge might have been hell, but a great challenge. I don't know why I am still working on this.**
  - Q: **Should I contribute into the project?**
    - A: **Simply not recommended.**
  - Q: **Where can I make suggestions?**
    - A: **You can suggest changes or ideas on my team's discord server.**

# Credits
  - **Programmed** by
    - 136MasterNR

  - **Story directed** by
    - 136MasterNR
    - johnypro150

### Pixel Art
  - **Enemy Designs** by
    - ThePurgeKing

### Ascii Art
  - **Character Designs** by
    - [asciiart.eu](https://www.asciiart.eu/)
    - [patorjk.com](https://patorjk.com/)
    - 136MasterNR

  - **User Interfaces** by
    - 136MasterNR

### Sounds
  - **Music** provided by 
    - [pedi me arxes](https://www.youtube.com/c/pedimearxes) provided [Dangerous Plains](https://www.youtube.com/watch?v=rF9K51_3p10)
    - [Alexander Nakarada](https://www.serpentsoundstudios.com) provided [Village Ambiance](https://www.youtube.com/watch?v=VKKSQ4UHLRE) and [Winter Night](https://www.free-stock-music.com/alexander-nakarada-winter-night.html)

  - **SFX** provided by
    - [epicstockmedia.com](https://epicstockmedia.com/)
    - [SOUND and IMAGE FX](https://www.youtube.com/channel/UCQvVl9c7RKpyO5aKwxtb_lw) provided the swing sfx.
### Special Thanks

  - **Shoutout** to my **Testers**:
    - Bench
    - BlackStorm
    - 2002Spiele
    - [ComradeTurtle](https://github.com/ComradeTurtle) [OLD]
    - AgentANP [OLD]
    - JayKayHere3987 [OLD]

### More information on this project will be added in this read me every now and then :shipit:
