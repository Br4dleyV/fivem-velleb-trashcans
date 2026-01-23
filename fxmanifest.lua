fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Bradley <bradley@velleb.com>'
description 'A trash can system for FiveM QBox'
version '1.0.0'

ox_lib 'locale'

shared_scripts {
	'@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
	'client.lua',
}

server_scripts {
    'server.lua',
}

files {
    'locales/*.json'
}
