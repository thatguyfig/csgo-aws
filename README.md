# csgo-aws
Automation documents to help with setting up a CS:GO game server in AWS.

## Getting Started

### Build an EC2 Instance

I recommend you first build an EC2 instance on Ubuntu 16.04 LTS with a public IP address. Also make sure the instance has the IAM permissions to allow it to communicate with SSM. We will be using SSM to run the deployment + configuration of our server.

Once you have this you will be good to proceed.

### Install SteamCMD + Download CS:GO

To do this, we will use the script in this repository `ssm-csgo-install.yml`.

This will:
- Download SteamCMD
- Download the necessary files to run a CSGO dedicated server.

Execute this script against your Ubuntu instance via SSM, and once complete, move on to the next step.

### Configure the CS:GO Server

To do this, we will use the script in this repository `ssm-csgo-configure.yml`.

This will:
- Require a password to be provided to use for the RCON password when connecting through console. 
- This password will be set in the appropriate config files.

Execute this script against your Ubuntu instance via SSM.

### Install Sourcemod + Metamod (Optional)

If you plan to use custom mods on your server (which I highly recommend), then you will need Sourcemod installing with Metamod. This can be a little tricky to do for people who don't understand so we may use a script also to complete this step.

This will:
- Download Metamod
- Download Sourcemod
- Install them both
- Configure your server to use Sourcemod on launch.

Once run, Sourcemod will be ready to go.

## Further Steps

Once you've completed these steps, you may still want to do the following:
- Add yourself to the Sourcemod admins list (new script TODO)
- Add further mods to your server (new script TODO)
- Customise the name and tags for your server (new script TODO)

There's some really good information on this here - https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers

To do this, you will need to SSH to your instance and configure it using the command-line.

## Launching the Server!

Once you've completed your config and have added all the mods you can dream of, run the server with the `launch-server.sh` script.

Please modify the top of the script to suit your needs:
```bash
SERVERLOGINTOKEN="" # YOUR GSLT
GAMETYPE="1" # 0 / 1
GAMEMODE="" # 0 / 1 / 2 
STARTING_MAP="de_dust2" # starting map
MAX_PLAYERS=32
```
The combinations of gametype and gamemode are described here - https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers#Starting_the_Server

