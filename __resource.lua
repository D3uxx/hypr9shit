resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "hypr9shit"

dependency "vrp"

client_scripts{ 
  "Proxy.lua",
  "parar-anim.lua",
  "desguace-client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "desguace-server.lua"
}
