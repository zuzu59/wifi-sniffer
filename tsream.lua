#!/usr/bin/lua
-- Test la lecture du stream d'un pip dans un script shell du style: tcpdump | tstream.lua
-- christian@zufferey.com, zf150701.2314

--Listes des fonctions







--main program
print('\nStart...')


local i = 0

while true do
    local line = io.read()
    if not line then break end    
--    local p1, p2 = string.find(line,"google")
--    if p1 then
    	print(i..", From pipe: '" .. line .. "'")
--    end
	i = i + 1
end




os.exit()



