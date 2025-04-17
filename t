local player = game.Players.LocalPlayer
local moneyLabel = nil
local startTime = tick()
local totalEarned = 0
local lastMoney = player.leaderstats.Money.Value -- Lấy giá trị tiền ban đầu

-- Tạo GUI để hiển thị số tiền và trung bình
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

moneyLabel = Instance.new("TextLabel")
moneyLabel.Parent = screenGui
moneyLabel.Size = UDim2.new(0, 400, 0, 50) -- Kích thước của TextLabel
moneyLabel.Position = UDim2.new(0.5, -200, 0, 50) -- Vị trí hiển thị
moneyLabel.BackgroundTransparency = 1
moneyLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Màu chữ trắng
moneyLabel.TextSize = 24
moneyLabel.Text = "Tiền kiếm được: 0 | Trung bình mỗi giờ: 0"

-- Hàm cập nhật số tiền kiếm được
local function updateMoney()
    local currentMoney = player.leaderstats.Money.Value
    totalEarned = currentMoney - lastMoney
    lastMoney = currentMoney
end

-- Hàm tính số tiền trung bình mỗi giờ
local function calculateHourlyAverage()
    local elapsedTime = tick() - startTime
    local hours = elapsedTime / 3600
    return totalEarned / hours
end

-- Hàm hiển thị thông tin trên màn hình
local function updateDisplay()
    -- Cập nhật số tiền kiếm được
    updateMoney()

    -- Tính số tiền trung bình mỗi giờ
    local avgPerHour = calculateHourlyAverage()

    -- Hiển thị thông tin lên TextLabel
    moneyLabel.Text = "Tiền kiếm được: " .. totalEarned .. " | Trung bình mỗi giờ: " .. math.floor(avgPerHour)
end

-- Cập nhật thông tin mỗi 5 giây
while true do
    wait(5) -- Cập nhật mỗi 5 giây
    updateDisplay()
end
