function save(fileName, payload)
  local file = fs.open(fileName, "w")
  file.write(payload)
  file.close()
end

function load(fileName)
  local file = fs.open(fileName, "r")
  local payload = file.readAll()
  file.close()
  return payload
end
