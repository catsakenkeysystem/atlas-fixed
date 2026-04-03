local servers = {}
local req = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
local body = game:GetService("HttpService"):JSONDecode(req)

if body and body.data then
  for i, v in next, body.data do
    if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
      table.insert(servers, 1, v.id)
    end
  end
end

if #servers > 0 then
  game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game:GetService("Players").LocalPlayer)
else
  return warn("Couldn't find a server.")
end
