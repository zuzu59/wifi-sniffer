--[[
lualibz/simplecsv.lua

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

module(..., package.seeall) 

---------------------------------------------------------------------
local function split(str, sep)
    sep = sep or ','
    fields={}
    local matchfunc = string.gmatch(str, "([^"..sep.."]+)")
    if not matchfunc then return {str} end
    for str in matchfunc do
        table.insert(fields, str)
    end
    return fields
end

---------------------------------------------------------------------
function read(path, sep, tonum)
    tonum = tonum or true
    sep = sep or ','
    local csvFile = {}
    local file = assert(io.open(path, "r"))
    for line in file:lines() do
        fields = split(line, sep)
        if tonum then -- convert numeric fields to numbers
            for i=1,#fields do
                fields[i] = tonumber(fields[i]) or fields[i]
            end
        end
        table.insert(csvFile, fields)
    end
    file:close()
    return csvFile
end

---------------------------------------------------------------------
function write(path, data, sep)
    sep = sep or ','
    local file = assert(io.open(path, "w"))
    for i=1,#data do
        for j=1,#data[i] do
            if j>1 then file:write(sep) end
            file:write(data[i][j])
        end
        file:write('\n')
    end
    file:close()
end

---------------------------------------------------------------------