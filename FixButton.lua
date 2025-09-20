-- script should be in StartGUI > Textbutton > LocalScript

script.Parent.MouseButton1Down:Connect(function()
    print('Attempting to restart API requests.')
    game.ReplicatedStorage.RestartAPIRequests:FireServer()
end)
