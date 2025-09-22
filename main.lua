-- Script should be in Replicated Storage!

local HttpsService = game.HttpService
local MarketPlaceService = game:GetService('MarketplaceService')
local Players = game:GetService('Players')
 
local WaitTime = 0.5
 
Players.PlayerAdded:Connect(function(Plr)
    if MarketPlaceService:UserOwnsGamePassAsync(Plr.UserId, '831031969') then
        local WaitTime = 0.15
    end
end)
 
local JSONData = HttpsService:GetAsync('http://api.open-notify.org/iss-now.json')
local Data = HttpsService:JSONDecode(JSONData)
if Data.message ~= 'success' then
    error('API Request failed. Message: '.. Data.message)
else
    print('API Request success.')
end
 
while task.wait(WaitTime) do
    local JSONData = HttpsService:GetAsync('http://api.open-notify.org/iss-now.json')
    local Data = HttpsService:JSONDecode(JSONData)
    game.Lighting.GeographicLatitude = Data['iss_position'].latitude
    print(Data['iss_position'].latitude)
    print(Data.message)
end
 
game.ReplicatedStorage.RestartAPIRequests.OnServerEvent:Connect(function(Plr)
    print(Plr.Name.. " Restarted the API request's.")
    while task.wait(WaitTime) do
        local JSONData = HttpsService:GetAsync('http://api.open-notify.org/iss-now.json')
        local Data = HttpsService:JSONDecode(JSONData)
        game.Lighting.GeographicLatitude = Data['iss_position'].latitude
        print(Data['iss_position'].latitude)
        print(Data.message)
    end
end)
