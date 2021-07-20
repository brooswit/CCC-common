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
    localPrint (action .. ' "' .. subject .. '".')
end

function load(configName)
    printAction('Loading config', configName)

    local configFileName = buildConfigFileName(configName)

    local fileContents = fileManager.load(configFileName)

    local config, err = pcall(json.decode(fileContents))
    if err then
        printJSONErrorMessage(err)
        config = {}
    end

    return config
end

function save(configName, config)
    printAction('Saving config', configName)

    local configFileName = buildConfigFileName(configName)

    local configText, err = pcall(json.decode(config))
    if err then
        printJSONErrorMessage(err)
        configText = "{}"
    end

    fileManager.save(configFileName, configText)
end
