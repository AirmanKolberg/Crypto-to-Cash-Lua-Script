-- see if the file exists
function fileExists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function getLines(file)

  -- Check if file exists, first
  if not fileExists(file) then return {} end

  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end

function sleep(seconds)
  os.execute("sleep " .. seconds)
end

function getNeededADA(adaValue)
  return 2700 / adaValue
end

adaGoal = 750

while true do

  -- Run the Cryptocompare API Python script
  os.execute("python3 get_ada_price.py")

  -- Read the latest ADA value
  local file = 'ADAvalue.txt'
  local lines = getLines(file)

  -- print all line numbers and their contents
  for k, v in pairs(lines) do
    adaValue = tonumber(v)
  end

  local adaNeeded = getNeededADA(adaValue)

  print("ADA needed: " .. adaNeeded)

  if adaNeeded < adaGoal then
    os.execute("python3 notify.py")
    break
  end 

  -- Try again in a minute
  sleep(60)

end
