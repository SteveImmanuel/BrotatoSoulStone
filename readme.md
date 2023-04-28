# Brotato Soul Stone 

A mod for Brotato for revival functionality

- Added new item called **Soul Stone** in legendary tier with starting cost of `350`
- Modified game loop to make reviving possible

## Requirements

- <a href=https://github.com/BrotatoMods/Brotato-ContentLoader#user-content-fnref-1-52e351b45b755f548e67252ac622acc0>Content Loader</a>

## How it Works
This mod modifies the main gameloop signal that is triggered when the player died. I added a new key in the `RunData.effects` variables called `soulstone` to keep track of the number of remaining revival.