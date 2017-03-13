#!/usr/bin/lua
-- Test l'utilisation d'une table avec multi value pour une key
-- christian@zufferey.com, zf150705.1646

--Listes des fonctions







--main program
print('\nStart...')


ztbl = {}

ztbl["toto"] = {"tutu", "123"}
--ztbl = {"titi","tata", "456"}


print(ztbl["toto"][1])
print(ztbl["toto"][2])



--ztbl["titi"] = "tata"

--for zkey1, zvalue1 in pairs(ztbl) do
--	for zkey2, zvalue2 in pairs(ztbl[zkey1]) do
--		print(zkey2,zvalue2)
--	end
--	print(zkey,zvalue)
--end




os.exit()



