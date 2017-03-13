#!/usr/bin/lua
-- Petite base de donnée minimaliste style noSQL en Lua
-- En fait cela lit et écrit dans une table via des sockets, cela permet d'avoir des données persistentes pour des scripts en Lua
-- christian@zufferey.com, zf150704.2300

--Listes des fonctions


--pitch +100.0 roll -20.0 
--yaw -50.0
--Cette petite démo nous permet d'utiliser une fonction très pratique de la librairie string de LUA: string.gmatch(). Cette fonction nous permet d'analyser le message du client et d'en extraire les angles d'Euler (dans 3 variables globales):

function zget_arguments(command)
  local ok = 0;
 
-- zarg angle_name
-- zvalue angle_value
 
--  for zarg, zvalue in string.gmatch(command, "(%a+) (%p%d+%p%d+)") do
  for zarg, zvalue in string.gmatch(command, "(%a+)%s(%a+)") do

      if zarg=="pitch" then
        zpitch = zvalue
        ok = 1

      elseif zarg=="yaw" then
        zyaw = zvalue
        ok = 1

      elseif zarg=="roll" then
        zroll = zvalue
        ok = 1

      end
    end

  return(ok);
end





--main program
print('\nStart...')

--line = "pitch +100.0 roll -20.0 yaw -50.0"
line = "pitch toto roll tutu yaw titi"

local zok = zget_arguments(line)
print("ok: "..zok)
if zpitch then print("pitch: "..zpitch) end
if zyaw then print("yaw: "..zyaw) end
if zroll then print("roll: "..zroll) end


os.exit()



local socket = require("socket")
local host = "*"
local port = 3318
local server = socket.try(socket.bind(host, port))

print("Please telnet to localhost on port " .. port)

while 1 do
  local client = server:accept()
  local line, err = client:receive()
  if not err then client:send("Vous avez envoyé: "..line .. "\n") end
  client:close()
end




os.exit()



