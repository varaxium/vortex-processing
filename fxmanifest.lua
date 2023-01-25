fx_version 'cerulean'

author 'varaxium#4950'

description 'Simple meth packaging script by varaxium#4950'

game 'gta5'

shared_script {
    'config.lua',
}
server_script {
    'server/*.lua',
}

client_script {
    'client/*.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
}

lua54 'yes'