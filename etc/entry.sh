#!/bin/bash
bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
                                +force_install_dir "${STEAMAPPDIR}" \
                                +app_update "${STEAMAPPID}" \
                                +quit

# Link configuration files from volume
ln -s -f /cfg "${STEAMAPPDIR}/${STEAMAPP}/cfg"

bash "${STEAMAPPDIR}/srcds_run" -game "${STEAMAPP}" -console -autoupdate \
                        -steam_dir "${STEAMCMDDIR}" \
                        -steamcmd_script "${STEAMAPPDIR}/${STEAMAPP}_update.txt" \
                        -usercon \
                        +fps_max "${SRCDS_FPSMAX}" \
                        -tickrate "${SRCDS_TICKRATE}" \
                        -port "${SRCDS_PORT}" \
                        +tv_port "${SRCDS_TV_PORT}" \
                        +clientport "${SRCDS_CLIENT_PORT}" \
                        +maxplayers "${SRCDS_MAXPLAYERS}" \
                        +map "${SRCDS_STARTMAP}" \
                        +sv_setsteamaccount "${SRCDS_TOKEN}" \
                        +rcon_password "${SRCDS_RCONPW}" \
                        +sv_password "${SRCDS_PW}" \
                        +sv_region "${SRCDS_REGION}" \
                        +net_public_adr "${SRCDS_NET_PUBLIC_ADDRESS}" \
                        -ip "${SRCDS_IP}" \
                        +host_workshop_collection "${SRCDS_HOST_WORKSHOP_COLLECTION}" \
                        +workshop_start_map "${SRCDS_WORKSHOP_START_MAP}" \
                        -authkey "${SRCDS_WORKSHOP_AUTHKEY}"
