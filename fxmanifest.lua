fx_version 'cerulean'
description 'Remove rain in ymaps'
author 'Avilchiis'
version '1.0.0'
lua54 'yes'
games {
  'gta5'
}

shared_scripts {
  '@ox_lib/init.lua',
}

client_scripts {
 'config.lua',
 'client.lua',
}

dependencies {
  'av_weather',
  'ox_lib'
}