os.loadAPI('fileManager.lua')
os.loadAPI('json.lua')

local function localPrint(msg)
    print ("[ConfigManager] " .. msg)
end

local function buildConfigFileName(configName)
    return configName .. '.json'
end

local function printJSONError(error)
    localPrint('JSON error: ' .. json.encode(error))
end

local function printAction(action, subject)
    localPrint (action .. ' config "' .. subject .. '".')
end

function load(configName)
    printAction('Loading', configName)

    local configFileName = buildConfigFileName(configName)
    local diskConfigPath = 'disk/' .. configFileName
    local localConfigPath = configFileName
    local configPaths = { diskConfigPath, localConfigPath }

    for configPath in configPaths do
        local configExists = fs.exists(configPath)
        if configExists then
            local configContents = fileManager.load(configPath)
            local config = pcall(json.decode, configContents)
            if config ~= nil then
                return config
            end
        end
    end

    return {}
end

function save(configName, config)
    printAction('Saving', configName)

    local configText, jsonError = pcall(json.encode, config)
    if jsonError then configText = "{}" end

    local configFileName = buildConfigFileName(configName)
    local diskConfigPath = 'disk/' .. configFileName
    local localConfigPath = configFileName
    local configPaths = { diskConfigPath, localConfigPath }

    for configPath in configPaths do
        fileManager.save(configPath, configText)
    end
end
