#!/usr/bin/env lua

--[[
	fyaml.lua - the Flukso configuration loader in UCI style

	Copyright (C) 2019 Bart Van Der Meerssche <bart@flukso.net>

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]--

local lyaml = require "lyaml"

local M = {
	path = "flukso.yaml",
}

M.set_path = function(self, path)
	self.path = path
end

M.load = function(self)
	local f = io.open(self.path)
	local y = f:read("*all")
	f:close()
	return lyaml.load(y)
end

M.get_all = function(self, section)
	conf = self:load()
	return conf[section]
end

M.get = function(self, section, option)
	return self:get_all(section)[option]
end

return M

