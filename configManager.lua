os.loadAPI('fileManager.lua')
os.loadAPI('json.lua')

local function localPrint(msg)
    print ("[ConfigManager] " .. msg)
end

local function buildConfigFileName(configName)
    return configName .. '.json'
end

local function printJSONErrorMessage(errorMessage)
    localPrint('JSON error: ' .. errorMessage)
end

local function printAction(action, subject)
    localPrint (action .. ' config "' .. subject .. '".')
end

function load(configName)
    printAction('Loading', configName)

    local configFileName = buildConfigFileName(configName)

    local fileContents = fileManager.load(configFileName)

    local config, jsonErrorMessage = pcall(json.decode, fileContents)
    if jsonErrorMessage then
        printJSONErrorMessage(jsonErrorMessage)
        config = {}
    end

    return config
end

function save(configName, config)
    printAction('Saving', configName)

    local configFileName = buildConfigFileName(configName)

    local configText, jsonErrorMessage = pcall(json.decode, config)
    if jsonErrorMessage then
        printJSONErrorMessage(jsonErrorMessage)
        configText = "{}"
    end

    fileManager.save(configFileName, configText)
end
