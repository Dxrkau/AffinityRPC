# AffinityRPC

A Free Discord Rich Presence Script for FiveM
Created by Affinity Development
Join our community: discord.gg/affinitydev

What is AffinityRPC?

AffinityRPC is a custom Rich Presence Script With Displaying Players Nickname, FPS, ID and Server Logos 

Setup Instructions

1. Add Your Server Links
Open the client.lua file:

Line 61 – Replace with your Discord server invite link.

Line 62 – Replace with your FiveM server connect IP (e.g., connect yourserverip).

Creating Your Discord Application

To enable Rich Presence, you need to create a Discord application:

Go to Discord Developer Portal and log in.

Click "New Application" and name it as you want it to appear in the Rich Presence.

Navigate to the “Rich Presence” / “Art Assets” tab on the left.

Upload your logo or any images you'd like to use in your presence.

Example:

https://cdn.discordapp.com/attachments/1376285546380398652/1377954675713900605/image.png?ex=683ad7cb&is=6839864b&hm=ebcdf9790a7db29ab647b71faaac3f111041c408fd7e8fe7ca26cbd35837e1ef&
https://cdn.discordapp.com/attachments/1376285546380398652/1377956085582790656/Screenshot_2025-05-30_195514.png?ex=683ad91b&is=6839879b&hm=747b2a74cef83c5165ee3687c6eaadd3055f56bae2b553d4fddea15075ecbd87&
https://cdn.discordapp.com/attachments/1376285546380398652/1377956085327204362/Screenshot_2025-05-30_195457.png?ex=683ad91b&is=6839879b&hm=a33d2583abbfdeaed8015c1b4aea17a33ef66f4404b7e3425d212b456a9cb754&


Configuring Your Script

In client.lua:

Line 1 – Paste your Discord Application ID.

Lines 2 & 3 – Enter the image key names you uploaded for your logo or icon.

Done!
Restart your FiveM resource and your custom Discord Rich Presence should now appear when players connect to your server!

Need help? Join our support server: discord.gg/affinitydev

