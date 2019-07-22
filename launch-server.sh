SERVERLOGINTOKEN="" # YOUR GSLT
GAMETYPE="1" # 0 / 1
GAMEMODE="" # 0 / 1 / 2 
STARTING_MAP="de_dust2" # starting map
MAX_PLAYERS=32

# RUN THE SERVER
/Steam/csgo-ds/srcds_run -game csgo -console -usercon +game_type $GAMETYPE +game_mode $GAMEMODE +mapgroup mg_allclassic +map $STARTING_MAP maxplayers_override $MAX_PLAYERS +sv_setsteamaccount $SERVERLOGINTOKEN