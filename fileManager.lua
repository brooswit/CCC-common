local function localPrint(msg)
  print ("[FileManager] " .. msg)
end

function load(fileName)
  localPrint ("Loading  " .. fileName)
  local file = fs.open(fileName, "r")
  if file == nil then
    localPrint ("Failed to load. file is nil.")
    return nil
  end
  local payload = file.readAll()
  file.close()
  return payload
end

function save(fileName, payload)
  localPrint ("Saving  " .. fileName)
  local file = fs.open(fileName, "w")
  if file == nil then
    localPrint ("Failed to save. file is nil.")
    return
  end
  file.write(payload)
  file.close()
end
