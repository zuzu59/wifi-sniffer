#!/usr/bin/lua
-- Test la lecture et l'écriture d'une table dans un fichier
-- christian@zufferey.com, zf150625.2242

--Listes des fonctions





--[[
This is a simplified Lua script to read and write CSV files. It assumes the separator character does not exist in one of the values.
http://nocurve.com/simple-csv-read-and-write-using-lua/
© 2014 Maslow's Hammer and Occam's Razor
christian@zufferey.com, zf150625.2308

-- Example use:
file csv1.txt:

1.23,70,hello
there,9.81,102
8,1.243,test

Save the following as test.lua to test this module:
-------------------------------------
local csvfile = require "simplecsv"
local m = csvfile.read('./csv1.txt') -- read file csv1.txt to matrix m
print(m[2][3])                       -- display element in row 2 column 3 (102)
m[1][3] = 'changed'                  -- change element in row 1 column 3
m[2][3] = 123.45                     -- change element in row 2 column 3
csvfile.write('./csv2.txt', m)       -- write matrix to file csv2.txt
-------------------------------------
]]










--main program
print('\nStart...')

local csvfile = require "lualibz/simplecsv"
local m = csvfile.read('./csv1.txt') -- read file csv1.txt to matrix m
print(m[1][3])
print(m[2][3])                       -- display element in row 2 column 3 (102)
m[1][3] = 'changed'                  -- change element in row 1 column 3
m[2][3] = 123.45                     -- change element in row 2 column 3
csvfile.write('./csv2.txt', m)       -- write matrix to file csv2.txt



os.exit()



a=''
for i, v in ipairs(arg) do a = a..' '..v end
a = string.sub(a,2,string.len(a))
--print('.'..a..'.')


