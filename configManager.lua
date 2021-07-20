os.loadAPI('fileManager.lua')
os.loadAPI('json.lua')

local function localPrint(msg)
    print ("[ConfigManager] " .. msg)
end

local function buildConfigFileName(configName)
    return configName .. '.json'
end

local function printJSONError(error)
    localPrint('JSON error: ' .. json.decode(error))
end

local function printAction(action, subject)
    localPrint (action .. ' config "' .. subject .. '".')
end

function load(configName)
    printAction('Loading', configName)

    local configFileName = buildConfigFileName(configName)

    local fileContents = fileManager.load(configFileName)

    local config, jsonError = pcall(json.decode, fileContents)
    if jsonError then
        printJSONError(jsonError)
        config = {}
    end

    return config
end

function save(configName, config)
    printAction('Saving', configName)

    local configFileName = buildConfigFileName(configName)

    local configText, jsonError = pcall(json.decode, config)
    if jsonError then
        printJSONError(jsonError)
        configText = "{}"
    end

    fileManager.save(configFileName, configText)
end
