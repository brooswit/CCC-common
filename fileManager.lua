function save(fileName, payload)
  local file = fs.open(fileName, "w")
  if file == nil then
    return
  end
  file.write(payload)
  file.close()
end

function load(fileName)
  local file = fs.open(fileName, "r")
  if file == nil then
    return nil
  end
  local payload = file.readAll()
  file.close()
  return payload
end
