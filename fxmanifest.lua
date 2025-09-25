fx_version 'cerulean'
game 'gta5'

author 'xBandoz'
description 'advanced weapon system'
version '1.0.0'


shared_scripts {
    'shared/functions.lua',
    '@ox_lib/init.lua'
}

client_script 'cl_main.lua'
server_script 'sv_update.lua'
file 'shared/config.lua'

dependencies {
    'ox_lib',
    'ox_inventory'
}

lua54 'yes'
