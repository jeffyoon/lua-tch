--[[
Copyright (c) 2016 Technicolor Delivery Technologies, SAS

The source code form of this lua-tch component is subject
to the terms of the Clear BSD license.

You can redistribute it and/or modify it under the terms of the
Clear BSD License (http://directory.fsf.org/wiki/License:ClearBSD)

See LICENSE file for more details.
]]


---
-- Common IP address functions.
--
-- @module tch.inet

local posix = require("tch.posix")

local AF_INET = posix.AF_INET
local AF_INET6 = posix.AF_INET6
local inet_pton = posix.inet_pton
local match, format = string.match, string.format
local tonumber, type = tonumber, type

local M = {}

--- Check if the given address is a valid IPv4 address.
-- @tparam string ip The IP address string to test.
-- @treturn boolean True if it is a valid IPv4 address.
-- @error Error message.
function M.isValidIPv4(ip)
  local r, err = inet_pton(AF_INET, ip)
  if r then
    return true
  end
  return nil, err
end

--- Check if the given address is a valid IPv6 address.
-- @tparam string ip The IP address string to test.
-- @treturn boolean True if it is a valid IPv6 address.
-- @error Error message.
function M.isValidIPv6(ip)
  local r, err = inet_pton(AF_INET6, ip)
  if r then
    return true
  end
  return nil, err
end

--- Convert the given hexadecimal IPv4 address string to
-- dotted decimal notation. The string may have leading or
-- trailing whitespace.
-- @tparam string hexip The hexadecimal IPv4 address to be converted.
-- @treturn string The IPv4 address in dotted decimal notation.
-- @error Error message.
function M.hexIPv4ToString(hexip)
  if type(hexip) ~= "string" then
    return nil, "argument not a string"
  end
  local x1, x2, x3, x4 = match(hexip, "^%s*(%x%x)(%x%x)(%x%x)(%x%x)%s*$")
  if not x1 then
    return nil, "string is not a valid IPv4 address in hexadecimal notation"
  end
  x1, x2, x3, x4 = tonumber(x1, 16), tonumber(x2, 16), tonumber(x3, 16), tonumber(x4, 16)
  return format("%d.%d.%d.%d", x1, x2, x3, x4)
end

return M
