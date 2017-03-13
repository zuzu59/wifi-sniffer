#!/usr/bin/lua
-- Tcpdump sniffer WIFI parser
-- christian@zufferey.com, zf150624.1508

--Listes des fonctions
function get_vendor_mac_addrs(mac_addrs)
	local a, output
	a = string.sub(mac_addrs, 1, 8)
    if     a == '20:02:af' then output = 'z Murata Manufactuaring Co.,Ltd.'
    elseif a == '00:24:36' then output = 'z Apple'
    elseif a == '20:62:74' then output = 'z Microsoft Corporation'
    elseif a == '24:ab:81' then output = 'z Apple'
    elseif a == '44:6d:6c' then output = 'z Samsung Elec Co.,Ltd'
    elseif a == '54:e4:3a' then output = 'z Apple, Inc.'
    elseif a == '88:32:9b' then output = 'z Samsung Electro Mechanics co.,LTD.'
    elseif a == 'b4:14:89' then output = 'z CISCO SYSTEMS, INC.'
    elseif a == 'c8:d1:0b' then output = 'z Nokia Corporation'
    elseif a == 'd0:25:98' then output = 'z Apple'
    elseif a == 'e0:3e:44' then output = 'z Broadcom Corporation'
    elseif a == 'f4:4e:05' then output = 'z Cisco'
    elseif a == 'f4:f1:e1' then output = 'z Motorola Mobility LLC'
    elseif a == 'f8:c2:88' then output = 'z Cisco'
    elseif a == 'f0:25:b7' then output = 'z Samsung Electro Mechanics co., LTD.'
    elseif a == '90:a4:de' then output = 'z Wistron Neweb Corp.'
    elseif a == '90:b9:31' then output = 'z Apple, Inc'
    elseif a == 'f2:25:b7' then output = 'z none'
    elseif a == 'b8:e8:56' then output = 'z Apple'
    elseif a == 'xxx' then output = 'z xxx'
    elseif a == 'xxx' then output = 'z xxx'
    elseif a == 'xxx' then output = 'z xxx'
    elseif a == 'xxx' then output = 'z xxx'
    elseif a == 'xxx' then output = 'z xxx'
    elseif a == 'xxx' then output = 'z xxx'
    elseif a == 'xxx' then output = 'z xxx'
    elseif a == 'xxx' then output = 'z xxx'
    elseif a == 'xxx' then output = 'z xxx'
    elseif a == 'xxx' then output = 'z xxx'
    else
		local file = assert(io.popen('curl http://api.macvendors.com/'..mac_addrs..' 2> /dev/null ;echo', 'r'))
		output = file:read()
		file:close()
    end
	return output
end





--main program
--print('\nStart...')

a=''
for i, v in ipairs(arg) do a = a..' '..v end
a = string.sub(a,2,string.len(a))
--print('.'..a..'.')

b1 = string.sub(a, 0, 8)

i , j = string.find(a, "dB")
--print (i,j)
b2 = string.sub(a, i-3, i-1)

i , j = string.find(a, "RA:")
--print (i,j)
j = string.len(a)
b3 = string.sub(a, i+3, j)

b4 = get_vendor_mac_addrs(b3)

print (b1, b2, b3, b4)


