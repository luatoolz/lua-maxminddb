local mm = require 'maxminddb'
local db = mm.open('/usr/share/GeoIP/GeoLite2-City.mmdb')

local ip = arg[1] or '89.160.20.112'
local res = db:lookup(ip)
print(ip, res:get("country", "iso_code"))
