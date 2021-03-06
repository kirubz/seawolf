local random, floor, ceil = require [[random]], math.floor, math.ceil
local time = os.time

local _M = {}

MT_RAND_GENERATOR = random.new(time())

-- Generate a better random value
function _M.mt_rand()
  return floor(MT_RAND_GENERATOR() * _M.mt_getrandmax())
end

-- Show largest possible random value
function _M.mt_getrandmax()
  -- return 2*2*2*2*2*
         -- 2*2*2*2*2*
         -- 2*2*2*2*2*
         -- 2*2*2*2*2*
         -- 2*2*2*2*2*
         -- 2*2*2*2*2*
         -- 2 - 1
  return 2147483647 -- Same as the PHP hardcoded one in ext/standard/php_rand.h
end


-- Rounds a float
-- Copied from http://lua-users.org/wiki/SimpleRound
function _M.round(num, idp)
  local mult = 10^(idp or 0)
  if num >= 0 then return floor(num * mult + 0.5) / mult
  else return ceil(num * mult - 0.5) / mult end
end

return _M
