#!/usr/bin/lua
-- Petite base de donnée minimaliste style noSQL en Lua
-- En fait cela lit et écrit dans une table via des sockets, cela permet d'avoir des données persistentes pour des scripts en Lua
-- christian@zufferey.com, zf150705.1510

--w imac_maman 192.168.0.12 123456.789
--w maman 192.168.0.120 123456.789
--r maman
--d

--Listes des fonctions
function zget_word(line,p1)
	local word
	local p2 = string.find(line, " ", p1)
	if p2 then word = string.sub(line, p1, p2-1) else word = "zerror" ; p2 = p1	end
	return word,p2
end


--main program
print('\nStart...')

local socket = require("socket")
local host = "*"
local port = 3318
local zdb_table = {}

zdb_table["maman"] = "192.168.0.10"
zdb_table["papa"] = "192.168.0.11"
zdb_table["meli"] = "192.168.0.12"

local server = socket.try(socket.bind(host, port))
print("Please telnet to localhost on port " .. port)

while 1 do
	local client = server:accept()
	local line, err = client:receive()
	if not err then 
		client:send("Vous avez envoyé: "..line .. "\n") 
		if string.sub(line,-1) ~= " " then line = line.." " end
		local zcmd = string.sub(line, 1, 1)
		print("."..zcmd..".")
		if zcmd == "w" then
			print("C'est une écriture d'un champ...")
			p1 = 2
			zname,p1 = zget_word(line,p1+1)
			zip,p1 = zget_word(line,p1+1)
			ztime,p1 =  zget_word(line,p1+1)
			print("."..zname..".")
			print("."..zip..".")
			print("."..ztime..".")
		
			zdb_table[zname] = zip
			print (zdb_table[zname])
			for zkey, zvalue in pairs(zdb_table) do
				print(zkey,zvalue)
				client:send(zkey.." "..zvalue.. "\n")
			end
		
		elseif zcmd == "r" then
			print("C'est une lecture d'une champ...")
			p1 = 2
			zname,p1 = zget_word(line,p1+1)
			print("."..(zdb_table[zname])..".")
			client:send((zdb_table[zname]).. "\n")

		elseif zcmd == "d" then
			print("C'est une lecture de toute la table...")
			for zkey, zvalue in pairs(zdb_table) do
				print(zkey,zvalue)
				client:send(zkey.." "..zvalue.. "\n")
			end
		elseif zcmd == "c" then
			print("C'est un effacement d'un champ...")
			p1 = 2
			zname,p1 = zget_word(line,p1+1)
			zdb_table[zname] = nil
			for zkey, zvalue in pairs(zdb_table) do
				print(zkey,zvalue)
				client:send(zkey.." "..zvalue.. "\n")
			end
		
		
		
		
		end
	end
	client:close()
end




os.exit()



