os.loadAPI('fileManager.lua')
os.loadAPI('json.lua')

local function localPrint(msg)
    print ("[ConfigManager] " .. msg)
end
function load(configName)
    localPrint ("Loading  " .. configName)
    json.decode(fileManager.load(configName .. '.json'))
end

function save(configName, payload)
    localPrint ("Saving  " .. configName)
    fileManager.save(configName .. '.json', json.decode(payload))
end