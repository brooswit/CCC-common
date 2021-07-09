os.loadAPI('fileManager')
os.loadAPI('json')

function load(configName)
    json.decode(fileManager.load(configName .. '.json'))
end

function save(configName, payload)
    fileManager.save(configName .. '.json', json.decode(payload))
end