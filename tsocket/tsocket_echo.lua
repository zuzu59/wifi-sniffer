#!/usr/bin/lua
-- Fait un echo avec utilisant les socket TCPIP
-- christian@zufferey.com, zf150704.2300

--Listes des fonctions







--main program
print('\nStart...')


local socket = require("socket")
-- create a TCP socket and bind it to the local host, at any port
local server = socket.try(socket.bind("*", 2218))

-- find out which port the OS chose for us
local ip, port = server:getsockname()

-- print a message informing what's up
print("Please telnet to "..ip.." on port " .. port)
print("After connecting, you have 60s to enter a line to be echoed")

-- loop forever waiting for clients
while 1 do
  -- wait for a conection from any client
  local client = server:accept()
  -- make sure we don't block waiting for this client's line
  client:settimeout(60)
  -- receive the line
  local line, err = client:receive()
  -- if there was no error, send it back to the client
  if not err then client:send("Vous avez envoyé: "..line .. "\n") end
  -- done with client, close the object
  client:close()
end




os.exit()



