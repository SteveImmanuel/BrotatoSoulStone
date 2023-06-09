# Brotato Soul Stone 

A mod for Brotato for revival functionality

- Added new item called **Soul Stone** in legendary tier with starting cost of `150`
- Add custom menu in the difficulty selection to determine how many **Soul Stone** in the initial run
- Modified game loop to make reviving possible

## Requirements

- <a href=https://github.com/BrotatoMods/Brotato-ContentLoader#user-content-fnref-1-52e351b45b755f548e67252ac622acc0>Content Loader</a>

## How it Works
This mod modifies the main gameloop signal that is triggered when the player died. I added a new key in the `RunData.effects` variables called `soulstone` to keep track of the number of remaining revival.

Contrary to how item works in Brotato, **Soul Stone** will decrease by one from your inventory each time you die. If you run out of **Soul Stone**, then you die for real.

## Add on Steam
Subscribe on <a href="https://steamcommunity.com/sharedfiles/filedetails/?id=2968200149">Steam Workshop</a>
