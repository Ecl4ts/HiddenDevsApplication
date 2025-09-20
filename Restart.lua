-- Script Should be in RepStorage

local HttpsService = game.HttpService
 
while task.wait(5 * 60) do
    local JSONData = HttpsService:GetAsync('http://api.open-notify.org/iss-now.json')
    local Data = HttpsService:JSONDecode(JSONData)
    if Data.message ~= 'success' then
        HttpsService.HttpEnabled = true
        game.ReplicatedStorage.RestartAPIRequests:FireServer()
        error('API Request failed. Message: '.. Data.message)
    else
        print('API Request success.')
    end
end
