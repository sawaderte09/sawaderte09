if not game:IsLoaded() then game.Loaded:Wait() end

local plr = game.Players.LocalPlayer
local pgui = plr:WaitForChild("PlayerGui")
local cam = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local screen = Instance.new("ScreenGui")
screen.Name = "NeverloseMenu"
screen.IgnoreGuiInset = true
screen.ResetOnSpawn = false
screen.Parent = pgui

-- Neverlose стиль меню с синим акцентом
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 500, 0, 400)
main.Position = UDim2.new(0.5, -250, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
main.BackgroundTransparency = 0.1
main.BorderSizePixel = 0
main.Visible = false
main.Parent = screen

-- Заголовок Neverlose с синим акцентом
local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 40)
top.Position = UDim2.new(0, 0, 0, 0)
top.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
top.BorderSizePixel = 0
top.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "neverlose.cc"
title.TextColor3 = Color3.fromRGB(0, 150, 255) -- Синий акцент
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.Parent = top

-- Боковая панель
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 120, 1, -80) -- Уменьшили высоту для кнопки Panic
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
sidebar.BorderSizePixel = 0
sidebar.Parent = main

-- Кнопки Neverlose стиль с синим акцентом
local b1 = Instance.new("TextButton")
b1.Position = UDim2.new(0, 10, 0, 15)
b1.Size = UDim2.new(1, -20, 0, 35)
b1.Text = "RAGE"
b1.TextColor3 = Color3.new(1, 1, 1)
b1.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
b1.BorderSizePixel = 0
b1.TextSize = 12
b1.Font = Enum.Font.Gotham
b1.Parent = sidebar

local b2 = Instance.new("TextButton")
b2.Position = UDim2.new(0, 10, 0, 60)
b2.Size = UDim2.new(1, -20, 0, 35)
b2.Text = "LEGIT"
b2.TextColor3 = Color3.new(1, 1, 1)
b2.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
b2.BorderSizePixel = 0
b2.TextSize = 12
b2.Font = Enum.Font.Gotham
b2.Parent = sidebar

local b3 = Instance.new("TextButton")
b3.Position = UDim2.new(0, 10, 0, 105)
b3.Size = UDim2.new(1, -20, 0, 35)
b3.Text = "VISUALS"
b3.TextColor3 = Color3.new(1, 1, 1)
b3.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
b3.BorderSizePixel = 0
b3.TextSize = 12
b3.Font = Enum.Font.Gotham
b3.Parent = sidebar

-- Кнопка Panic внизу
local panicButton = Instance.new("TextButton")
panicButton.Position = UDim2.new(0, 10, 1, -45)
panicButton.Size = UDim2.new(1, -20, 0, 35)
panicButton.Text = "PANIC"
panicButton.TextColor3 = Color3.new(1, 1, 1)
panicButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50) -- Красный цвет для паники
panicButton.BorderSizePixel = 0
panicButton.TextSize = 12
panicButton.Font = Enum.Font.GothamBold
panicButton.Parent = sidebar

-- Основная область контента
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -120, 1, -40)
content.Position = UDim2.new(0, 120, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
content.BorderSizePixel = 0
content.Parent = main

-- RAGE вкладка
local rageFrame = Instance.new("Frame")
rageFrame.Size = UDim2.new(1, 0, 1, 0)
rageFrame.BackgroundTransparency = 1
rageFrame.Visible = false
rageFrame.Parent = content

-- LEGIT вкладка
local legitFrame = Instance.new("Frame")
legitFrame.Size = UDim2.new(1, 0, 1, 0)
legitFrame.BackgroundTransparency = 1
legitFrame.Visible = false
legitFrame.Parent = content

-- VISUALS вкладка
local visualsFrame = Instance.new("Frame")
visualsFrame.Size = UDim2.new(1, 0, 1, 0)
visualsFrame.BackgroundTransparency = 1
visualsFrame.Visible = false
visualsFrame.Parent = content

-- Функция для создания Neverlose чекбокса с синим акцентом
local function createNeverloseCheckbox(name, position, parent)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 0, 25)
    container.Position = position
    container.BackgroundTransparency = 1
    container.Parent = parent
    
    local checkbox = Instance.new("TextButton")
    checkbox.Size = UDim2.new(0, 20, 0, 20)
    checkbox.Position = UDim2.new(0, 0, 0, 0)
    checkbox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    checkbox.BorderSizePixel = 0
    checkbox.Text = ""
    checkbox.Parent = container
    
    local checkmark = Instance.new("TextLabel")
    checkmark.Size = UDim2.new(1, 0, 1, 0)
    checkmark.BackgroundTransparency = 1
    checkmark.Text = "✓"
    checkmark.TextColor3 = Color3.fromRGB(0, 150, 255) -- Синий акцент
    checkmark.TextSize = 14
    checkmark.Visible = false
    checkmark.Parent = checkbox
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -30, 1, 0)
    label.Position = UDim2.new(0, 25, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.Gotham
    label.Parent = container
    
    return checkbox, checkmark
end

-- RAGE элементы
local speedCheckbox, speedMark = createNeverloseCheckbox("Speed Hack", UDim2.new(0, 10, 0, 20), rageFrame)
local antiaimCheckbox, antiaimMark = createNeverloseCheckbox("Anti-Aim", UDim2.new(0, 10, 0, 55), rageFrame)
local rageCheckbox, rageMark = createNeverloseCheckbox("Rage Bot", UDim2.new(0, 10, 0, 90), rageFrame)
local noclipCheckbox, noclipMark = createNeverloseCheckbox("NoClip", UDim2.new(0, 10, 0, 125), rageFrame)
local flightCheckbox, flightMark = createNeverloseCheckbox("Flight", UDim2.new(0, 10, 0, 160), rageFrame)
local teleportCheckbox, teleportMark = createNeverloseCheckbox("Teleport", UDim2.new(0, 10, 0, 195), rageFrame)
local targetCheckbox, targetMark = createNeverloseCheckbox("Target Lock", UDim2.new(0, 10, 0, 230), rageFrame)

-- LEGIT элементы
local triggerCheckbox, triggerMark = createNeverloseCheckbox("Trigger Bot", UDim2.new(0, 10, 0, 20), legitFrame)

-- VISUALS элементы
local hudCheckbox, hudMark = createNeverloseCheckbox("HUD", UDim2.new(0, 10, 0, 20), visualsFrame)
local espCheckbox, espMark = createNeverloseCheckbox("Skeleton ESP", UDim2.new(0, 10, 0, 55), visualsFrame)

-- Настройки HUD в VISUALS
local hudSettingsFrame = Instance.new("Frame")
hudSettingsFrame.Size = UDim2.new(1, -20, 0, 180)
hudSettingsFrame.Position = UDim2.new(0, 10, 0, 90)
hudSettingsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
hudSettingsFrame.BorderSizePixel = 0
hudSettingsFrame.Visible = false
hudSettingsFrame.Parent = visualsFrame

local hudSettingsTitle = Instance.new("TextLabel")
hudSettingsTitle.Size = UDim2.new(1, 0, 0, 25)
hudSettingsTitle.BackgroundTransparency = 1
hudSettingsTitle.Text = "HUD Settings"
hudSettingsTitle.TextColor3 = Color3.fromRGB(0, 150, 255)
hudSettingsTitle.TextSize = 14
hudSettingsTitle.Font = Enum.Font.GothamBold
hudSettingsTitle.Parent = hudSettingsFrame

-- Цвет HUD
local hudColorText = Instance.new("TextLabel")
hudColorText.Position = UDim2.new(0, 10, 0, 30)
hudColorText.Size = UDim2.new(0, 80, 0, 20)
hudColorText.BackgroundTransparency = 1
hudColorText.Text = "Color:"
hudColorText.TextColor3 = Color3.new(1, 1, 1)
hudColorText.TextSize = 12
hudColorText.TextXAlignment = Enum.TextXAlignment.Left
hudColorText.Font = Enum.Font.Gotham
hudColorText.Parent = hudSettingsFrame

local hudColorBox = Instance.new("TextButton")
hudColorBox.Position = UDim2.new(0, 100, 0, 30)
hudColorBox.Size = UDim2.new(0, 60, 0, 20)
hudColorBox.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
hudColorBox.BorderSizePixel = 0
hudColorBox.Text = "Change"
hudColorBox.TextColor3 = Color3.new(1, 1, 1)
hudColorBox.TextSize = 11
hudColorBox.Font = Enum.Font.Gotham
hudColorBox.Parent = hudSettingsFrame

-- Позиция HUD
local hudPosText = Instance.new("TextLabel")
hudPosText.Position = UDim2.new(0, 10, 0, 60)
hudPosText.Size = UDim2.new(0, 80, 0, 20)
hudPosText.BackgroundTransparency = 1
hudPosText.Text = "Position:"
hudPosText.TextColor3 = Color3.new(1, 1, 1)
hudPosText.TextSize = 12
hudPosText.TextXAlignment = Enum.TextXAlignment.Left
hudPosText.Font = Enum.Font.Gotham
hudPosText.Parent = hudSettingsFrame

local hudPosDropdown = Instance.new("TextButton")
hudPosDropdown.Position = UDim2.new(0, 100, 0, 60)
hudPosDropdown.Size = UDim2.new(0, 80, 0, 20)
hudPosDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
hudPosDropdown.BorderSizePixel = 0
hudPosDropdown.Text = "Top-Right ▼"
hudPosDropdown.TextColor3 = Color3.new(1, 1, 1)
hudPosDropdown.TextSize = 11
hudPosDropdown.Font = Enum.Font.Gotham
hudPosDropdown.Parent = hudSettingsFrame

-- Размер текста HUD
local hudSizeText = Instance.new("TextLabel")
hudSizeText.Position = UDim2.new(0, 10, 0, 90)
hudSizeText.Size = UDim2.new(0, 80, 0, 20)
hudSizeText.BackgroundTransparency = 1
hudSizeText.Text = "Text Size:"
hudSizeText.TextColor3 = Color3.new(1, 1, 1)
hudSizeText.TextSize = 12
hudSizeText.TextXAlignment = Enum.TextXAlignment.Left
hudSizeText.Font = Enum.Font.Gotham
hudSizeText.Parent = hudSettingsFrame

local hudSizeSlider = Instance.new("TextButton")
hudSizeSlider.Position = UDim2.new(0, 100, 0, 90)
hudSizeSlider.Size = UDim2.new(0, 80, 0, 20)
hudSizeSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
hudSizeSlider.BorderSizePixel = 0
hudSizeSlider.Text = "14"
hudSizeSlider.TextColor3 = Color3.new(1, 1, 1)
hudSizeSlider.TextSize = 11
hudSizeSlider.Font = Enum.Font.Gotham
hudSizeSlider.Parent = hudSettingsFrame

-- Прозрачность HUD
local hudTransparencyText = Instance.new("TextLabel")
hudTransparencyText.Position = UDim2.new(0, 10, 0, 120)
hudTransparencyText.Size = UDim2.new(0, 80, 0, 20)
hudTransparencyText.BackgroundTransparency = 1
hudTransparencyText.Text = "Transparency:"
hudTransparencyText.TextColor3 = Color3.new(1, 1, 1)
hudTransparencyText.TextSize = 12
hudTransparencyText.TextXAlignment = Enum.TextXAlignment.Left
hudTransparencyText.Font = Enum.Font.Gotham
hudTransparencyText.Parent = hudSettingsFrame

local hudTransparencySlider = Instance.new("TextButton")
hudTransparencySlider.Position = UDim2.new(0, 100, 0, 120)
hudTransparencySlider.Size = UDim2.new(0, 80, 0, 20)
hudTransparencySlider.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
hudTransparencySlider.BorderSizePixel = 0
hudTransparencySlider.Text = "0.4"
hudTransparencySlider.TextColor3 = Color3.new(1, 1, 1)
hudTransparencySlider.TextSize = 11
hudTransparencySlider.Font = Enum.Font.Gotham
hudTransparencySlider.Parent = hudSettingsFrame

-- Кнопка Apply Settings
local applyHudSettings = Instance.new("TextButton")
applyHudSettings.Position = UDim2.new(0, 10, 0, 150)
applyHudSettings.Size = UDim2.new(1, -20, 0, 25)
applyHudSettings.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
applyHudSettings.BorderSizePixel = 0
applyHudSettings.Text = "APPLY SETTINGS"
applyHudSettings.TextColor3 = Color3.new(1, 1, 1)
applyHudSettings.TextSize = 12
applyHudSettings.Font = Enum.Font.GothamBold
applyHudSettings.Parent = hudSettingsFrame

-- HUD (Watermark) с расширенной информацией
local watermarkBG = Instance.new("Frame")
watermarkBG.Size = UDim2.new(0, 400, 0, 22)
watermarkBG.Position = UDim2.new(1, -410, 0, 6)
watermarkBG.BackgroundColor3 = Color3.fromRGB(10, 25, 40)
watermarkBG.BackgroundTransparency = 0.4
watermarkBG.Visible = false
watermarkBG.Parent = screen

local watermarkText = Instance.new("TextLabel", watermarkBG)
watermarkText.Size = UDim2.new(1, -12, 1, 0) 
watermarkText.Position = UDim2.new(0, 8, 0, 0)
watermarkText.BackgroundTransparency = 1
watermarkText.Text = '<font color="rgb(255,255,255)"><b>NL</b></font> | beta | lifetime | FPS: 60 | Speed: 16 | Target: None'
watermarkText.RichText = true 
watermarkText.Font = Enum.Font.Code 
watermarkText.TextSize = 14
watermarkText.TextColor3 = Color3.new(1,1,1)

-- === НАСТРОЙКИ HUD ===
local hudSettings = {
    textColor = Color3.fromRGB(0, 150, 255), -- Синий акцент
    position = "Top-Right",
    textSize = 14,
    transparency = 0.4
}

local positionOptions = {"Top-Right", "Top-Left", "Bottom-Right", "Bottom-Left", "Center-Top"}
local currentPositionIndex = 1

-- Переменные для FPS и скорости
local lastTime = tick()
local frameCount = 0
local currentFPS = 60
local currentSpeed = 16

-- === ФУНКЦИОНАЛ ===
local ESP_ENABLED = false
local ESP_TABLE = {}
local FLIGHT_ENABLED = false
local flightConnection
local originalGravity
local NOCLIP_ENABLED = false
local noclipConnection
local SPEEDHACK_ENABLED = false
local originalWalkSpeed = 16
local TRIGGERBOT_ENABLED = false
local shotPlayers = {}
local ANTI_AIM_ENABLED = false
local antiAimConnection
local jitterTime = 0
local RAGEBOT_ENABLED = false
local TELEPORT_ENABLED = false
local teleportTarget = nil
local hudEnabled = false
local TARGET_LOCK_ENABLED = false
local targetLockPlayer = nil
local targetLockConnection = nil
local targetLockSpeed = 80 -- Скорость полета за целью

-- Функция для обновления FPS и скорости
local function updateHUDInfo()
    frameCount = frameCount + 1
    local currentTime = tick()
    
    if currentTime - lastTime >= 1 then
        currentFPS = math.floor(frameCount / (currentTime - lastTime))
        frameCount = 0
        lastTime = currentTime
    end
    
    -- Получаем текущую скорость игрока
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        currentSpeed = math.floor(plr.Character.Humanoid.WalkSpeed)
    end
    
    -- Получаем имя цели для Target Lock
    local targetName = "None"
    if TARGET_LOCK_ENABLED and targetLockPlayer then
        targetName = targetLockPlayer.Name
    end
    
    -- Обновляем текст HUD
    if hudEnabled then
        watermarkText.Text = string.format('<font color="rgb(255,255,255)"><b>NL</b></font> | beta | lifetime | FPS: %d | Speed: %d | Target: %s', 
            currentFPS, currentSpeed, targetName)
    end
end

-- Запускаем обновление информации HUD
RunService.RenderStepped:Connect(updateHUDInfo)

-- Функция для выбора цвета
local function openColorPicker()
    local colorPicker = Instance.new("Frame")
    colorPicker.Size = UDim2.new(0, 200, 0, 150)
    colorPicker.Position = UDim2.new(0.5, -100, 0.5, -75)
    colorPicker.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    colorPicker.BorderSizePixel = 0
    colorPicker.Parent = screen
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.Text = "Select Text Color"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 16
    title.Parent = colorPicker
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 25, 0, 25)
    closeBtn.Position = UDim2.new(1, -30, 0, 5)
    closeBtn.BackgroundColor3 = Color3.new(1, 0, 0)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.new(1, 1, 1)
    closeBtn.Parent = colorPicker
    closeBtn.MouseButton1Click:Connect(function()
        colorPicker:Destroy()
    end)
    
    -- Цвета с синим акцентом
    local colors = {
        {Color3.fromRGB(0, 150, 255), "Blue"},
        {Color3.fromRGB(0, 255, 100), "Green"},
        {Color3.fromRGB(255, 50, 50), "Red"},
        {Color3.fromRGB(255, 255, 0), "Yellow"},
        {Color3.fromRGB(255, 150, 0), "Orange"},
        {Color3.fromRGB(200, 0, 255), "Purple"},
        {Color3.fromRGB(255, 255, 255), "White"}
    }
    
    for i, colorData in ipairs(colors) do
        local colorBtn = Instance.new("TextButton")
        colorBtn.Size = UDim2.new(0, 80, 0, 25)
        colorBtn.Position = UDim2.new(0, 10 + ((i-1) % 2) * 90, 0, 35 + math.floor((i-1)/2) * 30)
        colorBtn.BackgroundColor3 = colorData[1]
        colorBtn.Text = colorData[2]
        colorBtn.TextColor3 = Color3.new(0, 0, 0)
        colorBtn.TextSize = 11
        colorBtn.Parent = colorPicker
        
        colorBtn.MouseButton1Click:Connect(function()
            hudSettings.textColor = colorData[1]
            hudColorBox.BackgroundColor3 = colorData[1]
            colorPicker:Destroy()
            print("HUD Color changed to: " .. colorData[2])
        end)
    end
end

-- Функция для смены позиции
local function cyclePosition()
    currentPositionIndex = currentPositionIndex + 1
    if currentPositionIndex > #positionOptions then
        currentPositionIndex = 1
    end
    hudSettings.position = positionOptions[currentPositionIndex]
    hudPosDropdown.Text = positionOptions[currentPositionIndex] .. " ▼"
    print("HUD Position: " .. hudSettings.position)
end

-- Функция для изменения размера текста
local function changeTextSize()
    local newSize = hudSettings.textSize + 2
    if newSize > 20 then
        newSize = 10
    end
    hudSettings.textSize = newSize
    hudSizeSlider.Text = tostring(newSize)
    print("HUD Text Size: " .. newSize)
end

-- Функция для изменения прозрачности
local function changeTransparency()
    local newTransparency = hudSettings.transparency + 0.2
    if newTransparency > 1 then
        newTransparency = 0
    end
    hudSettings.transparency = newTransparency
    hudTransparencySlider.Text = string.format("%.1f", newTransparency)
    print("HUD Transparency: " .. newTransparency)
end

-- Функция применения настроек HUD
local function applyHudSettingsFunc()
    -- Применяем цвет текста (только для NL текста)
    watermarkText.Text = string.format('<font color="rgb(%d,%d,%d)"><b>NL</b></font> | beta | lifetime | FPS: %d | Speed: %d', 
        math.floor(hudSettings.textColor.R * 255),
        math.floor(hudSettings.textColor.G * 255),
        math.floor(hudSettings.textColor.B * 255),
        currentFPS,
        currentSpeed)
    
    -- Применяем позицию
    local positions = {
        ["Top-Right"] = UDim2.new(1, -410, 0, 6),
        ["Top-Left"] = UDim2.new(0, 10, 0, 6),
        ["Bottom-Right"] = UDim2.new(1, -410, 1, -28),
        ["Bottom-Left"] = UDim2.new(0, 10, 1, -28),
        ["Center-Top"] = UDim2.new(0.5, -200, 0, 6)
    }
    
    if positions[hudSettings.position] then
        watermarkBG.Position = positions[hudSettings.position]
    end
    
    -- Применяем размер текста
    watermarkText.TextSize = hudSettings.textSize
    
    -- Применяем прозрачность
    watermarkBG.BackgroundTransparency = hudSettings.transparency
    
    print("HUD Settings Applied!")
end

-- Функция Panic - полное отключение софта
local function panicMode()
    print("PANIC MODE ACTIVATED! Removing all features...")
    
    -- Отключаем все функции
    ESP_ENABLED = false
    FLIGHT_ENABLED = false
    NOCLIP_ENABLED = false
    SPEEDHACK_ENABLED = false
    TRIGGERBOT_ENABLED = false
    ANTI_AIM_ENABLED = false
    RAGEBOT_ENABLED = false
    TELEPORT_ENABLED = false
    hudEnabled = false
    TARGET_LOCK_ENABLED = false
    
    -- Закрываем все соединения
    if flightConnection then
        flightConnection:Disconnect()
        flightConnection = nil
    end
    
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    
    if antiAimConnection then
        antiAimConnection:Disconnect()
        antiAimConnection = nil
    end
    
    if targetLockConnection then
        targetLockConnection:Disconnect()
        targetLockConnection = nil
    end
    
    -- Восстанавливаем оригинальные настройки
    if plr.Character then
        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = originalWalkSpeed or 16
        end
        
        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local bv = rootPart:FindFirstChild("BodyVelocity")
            if bv then
                bv:Destroy()
            end
        end
    end
    
    if originalGravity then
        workspace.Gravity = originalGravity
    end
    
    -- Очищаем ESP
    for p, espData in pairs(ESP_TABLE) do
        clearESP(p)
    end
    ESP_TABLE = {}
    
    -- Скрываем все GUI элементы
    main.Visible = false
    watermarkBG.Visible = false
    
    -- Удаляем основной скрин GUI
    screen:Destroy()
    
    print("All features disabled. Software terminated.")
end

-- === TARGET LOCK ФУНКЦИИ ===

-- Функция для безопасного удаления Drawing объектов
local function safeRemoveDrawing(obj)
    if obj and obj.Remove then
        pcall(function() obj:Remove() end)
    end
end

local function clearESP(p)
    if ESP_TABLE[p] then
        for _, obj in pairs(ESP_TABLE[p]) do
            safeRemoveDrawing(obj)
        end
        ESP_TABLE[p] = nil
    end
end

-- Skeleton ESP функция с синим цветом
local function createSkeletonESP(p)
    if p == plr then return end
    clearESP(p)

    local drawings = {}
    
    local skeletonLines = {}
    for i = 1, 15 do
        local line = Drawing.new("Line")
        line.Thickness = 1.5
        line.Color = Color3.fromRGB(0, 150, 255) -- Синий акцент
        line.Visible = false
        table.insert(skeletonLines, line)
    end
    
    local name = Drawing.new("Text")
    name.Text = p.Name
    name.Color = Color3.fromRGB(0, 150, 255) -- Синий акцент
    name.Size = 14
    name.Center = true
    name.Outline = true
    name.Visible = false
    
    drawings.lines = skeletonLines
    drawings.name = name
    ESP_TABLE[p] = drawings

    local function updateSkeleton()
        if not ESP_ENABLED or not p.Character then
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            name.Visible = false
            return
        end

        local character = p.Character
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if not humanoid or humanoid.Health <= 0 then
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            name.Visible = false
            return
        end

        local parts = {
            Head = character:FindFirstChild("Head"),
            HumanoidRootPart = character:FindFirstChild("HumanoidRootPart"),
            LeftUpperArm = character:FindFirstChild("LeftUpperArm"),
            LeftLowerArm = character:FindFirstChild("LeftLowerArm"),
            LeftHand = character:FindFirstChild("LeftHand"),
            RightUpperArm = character:FindFirstChild("RightUpperArm"),
            RightLowerArm = character:FindFirstChild("RightLowerArm"),
            RightHand = character:FindFirstChild("RightHand"),
            LeftUpperLeg = character:FindFirstChild("LeftUpperLeg"),
            LeftLowerLeg = character:FindFirstChild("LeftLowerLeg"),
            LeftFoot = character:FindFirstChild("LeftFoot"),
            RightUpperLeg = character:FindFirstChild("RightUpperLeg"),
            RightLowerLeg = character:FindFirstChild("RightLowerLeg"),
            RightFoot = character:FindFirstChild("RightFoot")
        }

        for partName, part in pairs(parts) do
            if not part then
                for _, line in pairs(skeletonLines) do
                    line.Visible = false
                end
                name.Visible = false
                return
            end
        end

        local screenPositions = {}
        for partName, part in pairs(parts) do
            local success, screenPos = pcall(function()
                return cam:WorldToViewportPoint(part.Position)
            end)
            if success and screenPos.Z > 0 then
                screenPositions[partName] = Vector2.new(screenPos.X, screenPos.Y)
            else
                for _, line in pairs(skeletonLines) do
                    line.Visible = false
                end
                name.Visible = false
                return
            end
        end

        local lines = {
            {screenPositions.Head, screenPositions.HumanoidRootPart},
            {screenPositions.HumanoidRootPart, screenPositions.LeftUpperArm},
            {screenPositions.LeftUpperArm, screenPositions.LeftLowerArm},
            {screenPositions.LeftLowerArm, screenPositions.LeftHand},
            {screenPositions.HumanoidRootPart, screenPositions.RightUpperArm},
            {screenPositions.RightUpperArm, screenPositions.RightLowerArm},
            {screenPositions.RightLowerArm, screenPositions.RightHand},
            {screenPositions.HumanoidRootPart, screenPositions.LeftUpperLeg},
            {screenPositions.LeftUpperLeg, screenPositions.LeftLowerLeg},
            {screenPositions.LeftLowerLeg, screenPositions.LeftFoot},
            {screenPositions.HumanoidRootPart, screenPositions.RightUpperLeg},
            {screenPositions.RightUpperLeg, screenPositions.RightLowerLeg},
            {screenPositions.RightLowerLeg, screenPositions.RightFoot},
            {screenPositions.Head, screenPositions.HumanoidRootPart}
        }

        for i, lineData in ipairs(lines) do
            if skeletonLines[i] then
                skeletonLines[i].From = lineData[1]
                skeletonLines[i].To = lineData[2]
                skeletonLines[i].Visible = ESP_ENABLED
            end
        end

        name.Position = Vector2.new(screenPositions.Head.X, screenPositions.Head.Y - 30)
        name.Visible = ESP_ENABLED
    end

    local conn = RunService.RenderStepped:Connect(function()
        pcall(updateSkeleton)
    end)

    drawings.connection = conn

    p.CharacterAdded:Connect(function()
        task.wait(1)
        clearESP(p)
        createSkeletonESP(p)
    end)

    p.CharacterRemoving:Connect(function()
        clearESP(p)
    end)
end

-- Инициализация ESP
for _, p in ipairs(game.Players:GetPlayers()) do
    if p ~= plr then
        p.CharacterAdded:Connect(function()
            task.wait(1)
            createSkeletonESP(p)
        end)
        if p.Character then
            createSkeletonESP(p)
        end
    end
end

game.Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        task.wait(1)
        createSkeletonESP(p)
    end)
end)

game.Players.PlayerRemoving:Connect(function(p)
    clearESP(p)
end)

-- Flight система
local function enableFlight()
    if not plr.Character then return end
    
    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and rootPart then
        originalGravity = workspace.Gravity
        workspace.Gravity = 0
        humanoid.PlatformStand = true
        
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.MaxForce = Vector3.new(100000, 100000, 100000)
        bv.Parent = rootPart
        
        flightConnection = RunService.Heartbeat:Connect(function()
            if not FLIGHT_ENABLED or not plr.Character then 
                if flightConnection then
                    flightConnection:Disconnect()
                end
                return 
            end
            
            local root = plr.Character:FindFirstChild("HumanoidRootPart")
            if root and bv then
                local direction = Vector3.new(0, 0, 0)
                
                if UIS:IsKeyDown(Enum.KeyCode.W) then
                    direction = direction + cam.CFrame.LookVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.S) then
                    direction = direction - cam.CFrame.LookVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.A) then
                    direction = direction - cam.CFrame.RightVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.D) then
                    direction = direction + cam.CFrame.RightVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then
                    direction = direction + Vector3.new(0, 1, 0)
                end
                if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
                    direction = direction + Vector3.new(0, -1, 0)
                end
                
                if direction.Magnitude > 0 then
                    direction = direction.Unit * 50
                end
                
                bv.Velocity = direction
            end
        end)
        
        print("Flight: ON")
    end
end

local function disableFlight()
    if flightConnection then
        flightConnection:Disconnect()
        flightConnection = nil
    end
    
    if plr.Character then
        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
        local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
        
        if humanoid then
            humanoid.PlatformStand = false
        end
        
        if rootPart then
            local bv = rootPart:FindFirstChild("BodyVelocity")
            if bv then
                bv:Destroy()
            end
        end
    end
    
    if originalGravity then
        workspace.Gravity = originalGravity
    end
    
    print("Flight: OFF")
end

-- NoClip система
local function noclipLoop()
	if NOCLIP_ENABLED and plr.Character then
		for _, part in pairs(plr.Character:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide then
				part.CanCollide = false
			end
		end
	end
end

local function toggleNoClip()
	if NOCLIP_ENABLED then
		if not noclipConnection then
			noclipConnection = RunService.Stepped:Connect(noclipLoop)
		end
	else
		if noclipConnection then
			noclipConnection:Disconnect()
			noclipConnection = nil
		end
		if plr.Character then
			for _, part in pairs(plr.Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = true
				end
			end
		end
	end
end

plr.CharacterAdded:Connect(function(character)
	if NOCLIP_ENABLED then
		task.wait(1)
		toggleNoClip()
	end
end)

-- SpeedHack система
local function applySpeedHack()
	if not plr.Character then return end
	
	local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		if SPEEDHACK_ENABLED then
			humanoid.WalkSpeed = 80
		else
			humanoid.WalkSpeed = originalWalkSpeed
		end
	end
end

plr.CharacterAdded:Connect(function(character)
	character:WaitForChild("Humanoid")
	originalWalkSpeed = character.Humanoid.WalkSpeed
	applySpeedHack()
end)

-- Trigger Bot система
local function checkTarget()
	if not TRIGGERBOT_ENABLED or not plr.Character then return false end
	
	local mouse = plr:GetMouse()
	local target = mouse.Target
	
	if target and target.Parent then
		local player = game.Players:GetPlayerFromCharacter(target.Parent)
		if player and player ~= plr and player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.Health > 0 then
			if not shotPlayers[player] then
				shotPlayers[player] = true
				return true
			end
		end
		
		local humanoid = target.Parent:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.Health > 0 then
			local isPlayer = game.Players:GetPlayerFromCharacter(target.Parent)
			if not isPlayer then
				return true
			end
		end
	end
	
	return false
end

local function triggerShoot()
	if checkTarget() then
		game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, false)
		task.wait(0.1)
		game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, false)
		return true
	end
	return false
end

RunService.RenderStepped:Connect(function()
	if TRIGGERBOT_ENABLED then
		triggerShoot()
	end
end)

-- Anti-Aim система
local function applyAntiAim()
    if not ANTI_AIM_ENABLED or not plr.Character then
        return
    end
    
    local character = plr.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and rootPart then
        jitterTime = jitterTime + 0.2
        
        local jitterX = math.sin(jitterTime * 25) * 15
        local jitterY = math.cos(jitterTime * 20) * 12
        local jitterZ = math.sin(jitterTime * 30) * 10
        
        local randomJitterX = math.random(-20, 20)
        local randomJitterY = math.random(-15, 15)
        local randomJitterZ = math.random(-18, 18)
        
        local totalJitterX = jitterX + randomJitterX
        local totalJitterY = jitterY + randomJitterY
        local totalJitterZ = jitterZ + randomJitterZ
        
        local currentCFrame = rootPart.CFrame
        local jitterOffset = Vector3.new(totalJitterX, totalJitterY, totalJitterZ) * 0.02
        
        local jitterCFrame = currentCFrame * CFrame.Angles(
            math.rad(totalJitterX * 2),
            math.rad(totalJitterY * 1.5),
            math.rad(totalJitterZ * 1.8)
        )
        
        rootPart.CFrame = jitterCFrame + jitterOffset
        
        if humanoid then
            humanoid.WalkSpeed = 16 + math.sin(jitterTime * 10) * 8
        end
    end
end

local function toggleAntiAim()
    if ANTI_AIM_ENABLED then
        jitterTime = 0
        
        if not antiAimConnection then
            antiAimConnection = RunService.Heartbeat:Connect(function()
                pcall(applyAntiAim)
            end)
        end
        print("Anti-Aim: ON")
    else
        if antiAimConnection then
            antiAimConnection:Disconnect()
            antiAimConnection = nil
        end
        
        if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = 16
        end
        
        print("Anti-Aim: OFF")
    end
end

plr.CharacterAdded:Connect(function(character)
    if ANTI_AIM_ENABLED then
        task.wait(1)
        toggleAntiAim()
    end
end)

-- RageBot система
local function findClosestEnemy()
	if not plr.Character then return nil end
	
	local closestPlayer = nil
	local closestDistance = math.huge
	local myHead = plr.Character:FindFirstChild("Head")
	
	if not myHead then return nil end
	
	for _, player in ipairs(game.Players:GetPlayers()) do
		if player ~= plr and player.Character then
			local enemyHead = player.Character:FindFirstChild("Head")
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
			
			if enemyHead and humanoid and humanoid.Health > 0 then
				local raycastParams = RaycastParams.new()
				raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
				raycastParams.FilterDescendantsInstances = {plr.Character}
				
				local raycastResult = workspace:Raycast(
					myHead.Position,
					(enemyHead.Position - myHead.Position),
					raycastParams
				)
				
				if raycastResult and raycastResult.Instance:IsDescendantOf(player.Character) then
					local distance = (myHead.Position - enemyHead.Position).Magnitude
					if distance < closestDistance then
						closestDistance = distance
						closestPlayer = player
					end
				end
			end
		end
	end
	
	return closestPlayer
end

local function rageShoot()
	if not RAGEBOT_ENABLED or not plr.Character then return end
	
	local closestEnemy = findClosestEnemy()
	if closestEnemy and closestEnemy.Character then
		local enemyHead = closestEnemy.Character:FindFirstChild("Head")
		if enemyHead then
			game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, false)
			task.wait(0.05)
			game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, false)
		end
	end
end

RunService.RenderStepped:Connect(function()
	if RAGEBOT_ENABLED then
		rageShoot()
	end
end)

-- Teleport система
local function showPlayerList()
    local teleportWindow = Instance.new("Frame")
    teleportWindow.Size = UDim2.new(0, 300, 0, 400)
    teleportWindow.Position = UDim2.new(0.5, -150, 0.5, -200)
    teleportWindow.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    teleportWindow.BackgroundTransparency = 0.1
    teleportWindow.BorderSizePixel = 0
    teleportWindow.Parent = screen
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundTransparency = 1
    title.Text = "Select Player to Teleport"
    title.TextColor3 = Color3.fromRGB(0, 150, 255)
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.Parent = teleportWindow
    
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 25, 0, 25)
    closeButton.Position = UDim2.new(1, -30, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.new(1, 1, 1)
    closeButton.Parent = teleportWindow
    closeButton.MouseButton1Click:Connect(function()
        teleportWindow:Destroy()
    end)
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -10, 1, -50)
    scrollFrame.Position = UDim2.new(0, 5, 0, 45)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.Parent = teleportWindow
    
    local playerCount = 0
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= plr and player.Character then
            playerCount = playerCount + 1
            
            local playerButton = Instance.new("TextButton")
            playerButton.Size = UDim2.new(1, -10, 0, 30)
            playerButton.Position = UDim2.new(0, 5, 0, (playerCount-1)*35)
            playerButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            playerButton.Text = player.Name
            playerButton.TextColor3 = Color3.new(1, 1, 1)
            playerButton.Parent = scrollFrame
            
            playerButton.MouseButton1Click:Connect(function()
                teleportTarget = player
                teleportWindow:Destroy()
                print("Teleport: Selected " .. player.Name)
                
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local targetRoot = teleportTarget.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        plr.Character.HumanoidRootPart.CFrame = targetRoot.CFrame
                        print("Teleport: Successfully teleported to " .. teleportTarget.Name)
                    end
                end
            end)
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, playerCount*35)
end

-- === TARGET LOCK СИСТЕМА ===

-- Добавляем переменную для скорости полета за целью
local TARGET_LOCK_SPEED = 150

-- Функция для отображения меню выбора цели
local function showTargetLockMenu()
    local targetWindow = Instance.new("Frame")
    targetWindow.Size = UDim2.new(0, 300, 0, 400)
    targetWindow.Position = UDim2.new(0.5, -150, 0.5, -200)
    targetWindow.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    targetWindow.BackgroundTransparency = 0.1
    targetWindow.BorderSizePixel = 0
    targetWindow.Parent = screen
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundTransparency = 1
    title.Text = "Select Target Player"
    title.TextColor3 = Color3.fromRGB(0, 150, 255)
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.Parent = targetWindow
    
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 25, 0, 25)
    closeButton.Position = UDim2.new(1, -30, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.new(1, 1, 1)
    closeButton.Parent = targetWindow
    closeButton.MouseButton1Click:Connect(function()
        targetWindow:Destroy()
    end)
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -10, 1, -50)
    scrollFrame.Position = UDim2.new(0, 5, 0, 45)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.Parent = targetWindow
    
    local playerCount = 0
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= plr and player.Character then
            playerCount = playerCount + 1
            
            local playerButton = Instance.new("TextButton")
            playerButton.Size = UDim2.new(1, -10, 0, 30)
            playerButton.Position = UDim2.new(0, 5, 0, (playerCount-1)*35)
            playerButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            playerButton.Text = player.Name
            playerButton.TextColor3 = Color3.new(1, 1, 1)
            playerButton.Parent = scrollFrame
            
            playerButton.MouseButton1Click:Connect(function()
                targetLockPlayer = player
                targetWindow:Destroy()
                print("Target Lock: Selected " .. player.Name)
                
                -- Телепортируемся к цели
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local targetRoot = targetLockPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        -- Телепортируемся рядом с целью
                        local offset = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5))
                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(targetRoot.Position + offset)
                        print("Target Lock: Teleported to " .. targetLockPlayer.Name)
                    end
                end
                
                -- Включаем Target Lock
                TARGET_LOCK_ENABLED = true
                targetMark.Visible = true
                targetCheckbox.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                
                -- Останавливаем обычный полет если он был активен
                if flightConnection then
                    flightConnection:Disconnect()
                    flightConnection = nil
                end
                
                -- Запускаем Target Lock систему
                startTargetLock()
            end)
        end
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, playerCount*35)
end

-- Функция для полета за целью (отдельная система полета)
local function followTarget()
    if not TARGET_LOCK_ENABLED or not targetLockPlayer or not plr.Character then
        return
    end
    
    local targetCharacter = targetLockPlayer.Character
    if not targetCharacter then
        print("Target character not found")
        TARGET_LOCK_ENABLED = false
        if targetCheckbox then
            targetMark.Visible = false
            targetCheckbox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        end
        stopTargetLock()
        return
    end
    
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    
    if not targetRoot or not targetHumanoid then
        return
    end
    
    if targetHumanoid.Health <= 0 then
        print("Target is dead")
        TARGET_LOCK_ENABLED = false
        if targetCheckbox then
            targetMark.Visible = false
            targetCheckbox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        end
        stopTargetLock()
        return
    end
    
    local myCharacter = plr.Character
    local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
    local myHumanoid = myCharacter:FindFirstChildOfClass("Humanoid")
    
    if not myRoot or not myHumanoid then
        return
    end
    
    -- Настраиваем систему полета для Target Lock
    if not originalGravity then
        originalGravity = workspace.Gravity
    end
    
    workspace.Gravity = 0
    myHumanoid.PlatformStand = true
    
    -- Включаем NoClip для плавного движения
    for _, part in pairs(myCharacter:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
    
    -- Создаем или получаем BodyVelocity для Target Lock
    local bv = myRoot:FindFirstChild("TargetLockVelocity")
    if not bv then
        bv = Instance.new("BodyVelocity")
        bv.Name = "TargetLockVelocity"
        bv.MaxForce = Vector3.new(100000, 100000, 100000)
        bv.P = 10000
        bv.Parent = myRoot
    end
    
    -- Вычисляем направление к цели
    local targetPosition = targetRoot.Position
    local myPosition = myRoot.Position
    local direction = (targetPosition - myPosition).Unit
    
    -- Рассчитываем идеальную дистанцию (немного дальше для стрельбы)
    local distance = (targetPosition - myPosition).Magnitude
    local idealDistance = 15 -- Идеальная дистанция для стрельбы
    
    -- Рассчитываем скорость
    local speed = TARGET_LOCK_SPEED
    
    -- Если слишком далеко, увеличиваем скорость
    if distance > 50 then
        speed = TARGET_LOCK_SPEED * 1.5
    elseif distance < 10 then
        -- Если слишком близко, отлетаем назад
        speed = -TARGET_LOCK_SPEED * 0.5
        direction = -direction
    end
    
    -- Плавное приближение/отдаление
    local velocity = direction * speed
    
    -- Добавляем небольшую высоту
    velocity = velocity + Vector3.new(0, 2, 0)
    
    -- Применяем движение
    bv.Velocity = velocity
    
    -- Поворачиваемся к цели
    myRoot.CFrame = CFrame.new(myPosition, targetPosition)
    
    -- Автоматическая стрельба при правильной дистанции
    if distance > 8 and distance < 25 then
        -- Нажимаем левую кнопку мыши
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, false)
        task.wait(0.05)
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, false)
    end
    
    -- Обновляем HUD
    if hudEnabled then
        watermarkText.Text = string.format('<font color="rgb(255,255,255)"><b>NL</b></font> | beta | lifetime | FPS: %d | Speed: %d | Target: %s (%.1f studs)', 
            currentFPS, currentSpeed, targetLockPlayer.Name, distance)
    end
end

-- Функция запуска Target Lock
local function startTargetLock()
    if targetLockConnection then
        targetLockConnection:Disconnect()
    end
    
    if TARGET_LOCK_ENABLED and targetLockPlayer then
        targetLockConnection = RunService.Heartbeat:Connect(function()
            pcall(followTarget)
        end)
        print("Target Lock: Started following " .. targetLockPlayer.Name)
        print("Target Lock Speed: " .. TARGET_LOCK_SPEED)
    end
end

-- Функция остановки Target Lock
local function stopTargetLock()
    if targetLockConnection then
        targetLockConnection:Disconnect()
        targetLockConnection = nil
    end
    
    -- Восстанавливаем гравитацию и настройки
    if plr.Character then
        local myRoot = plr.Character:FindFirstChild("HumanoidRootPart")
        if myRoot then
            -- Удаляем BodyVelocity Target Lock
            local bv = myRoot:FindFirstChild("TargetLockVelocity")
            if bv then
                bv:Destroy()
            end
        end
        
        local myHumanoid = plr.Character:FindFirstChildOfClass("Humanoid")
        if myHumanoid then
            myHumanoid.PlatformStand = false
        end
        
        -- Восстанавливаем коллизию
        for _, part in pairs(plr.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
    
    -- Восстанавливаем гравитацию
    if originalGravity then
        workspace.Gravity = originalGravity
    end
    
    targetLockPlayer = nil
    print("Target Lock: Stopped")
end

-- Обработчик чекбокса Target Lock
targetCheckbox.MouseButton1Click:Connect(function()
    if not TARGET_LOCK_ENABLED then
        -- Показываем меню выбора цели
        showTargetLockMenu()
    else
        -- Отключаем Target Lock
        TARGET_LOCK_ENABLED = false
        targetMark.Visible = false
        targetCheckbox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        stopTargetLock()
        
        -- Включаем обычный полет обратно если он был включен
        if FLIGHT_ENABLED then
            enableFlight()
        end
    end
end)

-- Обработчик чекбокса Target Lock
targetCheckbox.MouseButton1Click:Connect(function()
    if not TARGET_LOCK_ENABLED then
        -- Показываем меню выбора цели
        showTargetLockMenu()
    else
        -- Отключаем Target Lock
        TARGET_LOCK_ENABLED = false
        targetMark.Visible = false
        targetCheckbox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        stopTargetLock()
    end
end)

-- Управление меню
UIS.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed then
		if input.KeyCode == Enum.KeyCode.Insert then
			main.Visible = not main.Visible
		end
	end
end)

-- Обработчики чекбоксов
hudCheckbox.MouseButton1Click:Connect(function()
	hudEnabled = not hudEnabled
	hudMark.Visible = hudEnabled
	hudCheckbox.BackgroundColor3 = hudEnabled and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(50, 50, 60)
	watermarkBG.Visible = hudEnabled
    hudSettingsFrame.Visible = hudEnabled
end)

espCheckbox.MouseButton1Click:Connect(function()
    ESP_ENABLED = not ESP_ENABLED
    espMark.Visible = ESP_ENABLED
    espCheckbox.BackgroundColor3 = ESP_ENABLED and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(50, 50, 60)
    
    for _, espData in pairs(ESP_TABLE) do
        if espData.lines then
            for _, line in ipairs(espData.lines) do
                line.Visible = ESP_ENABLED
            end
        end
        if espData.name then
            espData.name.Visible = ESP_ENABLED
        end
    end
end)

speedCheckbox.MouseButton1Click:Connect(function()
	SPEEDHACK_ENABLED = not SPEEDHACK_ENABLED
	speedMark.Visible = SPEEDHACK_ENABLED
	speedCheckbox.BackgroundColor3 = SPEEDHACK_ENABLED and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(50, 50, 60)
	applySpeedHack()
end)

antiaimCheckbox.MouseButton1Click:Connect(function()
    ANTI_AIM_ENABLED = not ANTI_AIM_ENABLED
    antiaimMark.Visible = ANTI_AIM_ENABLED
    antiaimCheckbox.BackgroundColor3 = ANTI_AIM_ENABLED and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(50, 50, 60)
    toggleAntiAim()
end)

rageCheckbox.MouseButton1Click:Connect(function()
	RAGEBOT_ENABLED = not RAGEBOT_ENABLED
	rageMark.Visible = RAGEBOT_ENABLED
	rageCheckbox.BackgroundColor3 = RAGEBOT_ENABLED and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(50, 50, 60)
end)

noclipCheckbox.MouseButton1Click:Connect(function()
	NOCLIP_ENABLED = not NOCLIP_ENABLED
	noclipMark.Visible = NOCLIP_ENABLED
	noclipCheckbox.BackgroundColor3 = NOCLIP_ENABLED and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(50, 50, 60)
	toggleNoClip()
end)

flightCheckbox.MouseButton1Click:Connect(function()
    FLIGHT_ENABLED = not FLIGHT_ENABLED
    flightMark.Visible = FLIGHT_ENABLED
    flightCheckbox.BackgroundColor3 = FLIGHT_ENABLED and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(50, 50, 60)
    
    if FLIGHT_ENABLED then
        enableFlight()
    else
        disableFlight()
    end
end)

teleportCheckbox.MouseButton1Click:Connect(function()
    TELEPORT_ENABLED = not TELEPORT_ENABLED
    teleportMark.Visible = TELEPORT_ENABLED
    teleportCheckbox.BackgroundColor3 = TELEPORT_ENABLED and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(50, 50, 60)
    
    if TELEPORT_ENABLED then
        showPlayerList()
    end
end)

triggerCheckbox.MouseButton1Click:Connect(function()
	TRIGGERBOT_ENABLED = not TRIGGERBOT_ENABLED
	triggerMark.Visible = TRIGGERBOT_ENABLED
	triggerCheckbox.BackgroundColor3 = TRIGGERBOT_ENABLED and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(50, 50, 60)
	
	if not TRIGGERBOT_ENABLED then
		shotPlayers = {}
	end
end)

-- Обработчики настроек HUD
hudColorBox.MouseButton1Click:Connect(openColorPicker)
hudPosDropdown.MouseButton1Click:Connect(cyclePosition)
hudSizeSlider.MouseButton1Click:Connect(changeTextSize)
hudTransparencySlider.MouseButton1Click:Connect(changeTransparency)
applyHudSettings.MouseButton1Click:Connect(applyHudSettingsFunc)

-- Обработчик кнопки Panic
panicButton.MouseButton1Click:Connect(panicMode)

-- Управление вкладками
local function showTab(tab)
    rageFrame.Visible = false
    legitFrame.Visible = false
    visualsFrame.Visible = false
    tab.Visible = true
end

b1.MouseButton1Click:Connect(function()
    showTab(rageFrame)
    b1.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    b2.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    b3.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
end)

b2.MouseButton1Click:Connect(function()
    showTab(legitFrame)
    b1.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    b2.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    b3.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
end)

b3.MouseButton1Click:Connect(function()
    showTab(visualsFrame)
    b1.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    b2.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    b3.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
end)

-- Инициализация
if plr.Character then
	local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		originalWalkSpeed = humanoid.WalkSpeed
	end
end

-- Показываем RAGE вкладку по умолчанию
showTab(rageFrame)
b1.BackgroundColor3 = Color3.fromRGB(0, 150, 255)

print("neverlose.cc menu loaded successfully!")
print("Target Lock function added - press Target Lock checkbox to select player and automatically follow them!")