return function(Title, Content, Token)
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local request = http_request or syn and syn.request or request or HttpPost
    local url = Token

    local userId = LocalPlayer.UserId
    local username = LocalPlayer.Name
    local displayName = LocalPlayer.DisplayName
    local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"

    local data = {
        ["username"] = displayName .. " [" .. username .. "]",
        ["avatar_url"] = avatarUrl,
        ["embeds"] = {{
            ["title"] = Title,
            ["description"] = Content,
            ["type"] = "rich",
            ["color"] = 0x3498db,
            ["footer"] = {
                ["text"] = "Sent by: " .. displayName .. " [" .. username .. "] | " .. os.date("%Y-%m-%d %H:%M:%S")
            }
        }}
    }

    local body = HttpService:JSONEncode(data)

    request({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = body
    })
end
