math.randomseed(os.time())

-- Generate a random string of 36 alphanumeric characters
function random_string(length)
    local charset = {}
    for c = 48, 57 do table.insert(charset, string.char(c)) end -- 0-9
    for c = 65, 90 do table.insert(charset, string.char(c)) end -- A-Z
    for c = 97, 122 do table.insert(charset, string.char(c)) end -- a-z

    if length <= 0 then return '' end
    return random_string(length - 1) .. charset[math.random(1, #charset)]
end

-- Setup request
request = function()
    local path = "/" .. random_string(36)
    return wrk.format("GET", path)
end
