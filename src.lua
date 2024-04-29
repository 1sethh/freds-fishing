-- // Auto Fish Farm PS99
-- // @s8th.
-- // v2.2 ; Fixed all bugs + Optimized Code

if getgenv().__ENABLED then return; end; getgenv().__ENABLED = true;
local tick_ = tick();

local function FireRemote(RemoteName)
    if game:GetService("ReplicatedStorage"):WaitForChild("Network"):FindFirstChild(RemoteName) then
        return game:GetService("ReplicatedStorage"):WaitForChild("Network")[RemoteName];
    end;
end;
local function ConvertToDHMS(Seconds)
    local Minutes = (Seconds - Seconds % 60) / 60;
    Seconds = Seconds - Minutes * 60;
    local Hours = (Minutes - Minutes % 60) / 60;
    Minutes = Minutes - Hours * 60;
    local Days = (Hours - Hours % 24) / 24;
    Hours = Hours - Days * 60;
    return string.format("%02i", Days) .. ":" .. string.format("%02i", Hours) .. ":" .. string.format("%02i", Minutes) .. ":" .. string.format("%02i", Seconds);
end;

for i, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
    v:Disable();
end;
task.spawn(function() -- such a shit way to bypass ps99 anti afk teleport but does the job
    while task.wait(120) do
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(577, 265, 0, true, game, 1);
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(577, 265, 0, false, game, 1);
    end;
end);

if config.FishingArea == 1 then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(795, 19, 1135); game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name]:WaitForChild("Model"):WaitForChild("Rod"); game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1113, 80, -3444);
    task.spawn(function()
        while task.wait() do
            if not game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name].Model.Rod:FindFirstChild("FishingLine") then
                FireRemote("Instancing_FireCustomFromClient"):FireServer("Fishing", "RequestCast", Vector3.new(1139, 75, -3445));
            else
                FireRemote("Instancing_FireCustomFromClient"):FireServer("Fishing", "RequestReel");
            end;
            FireRemote("Instancing_InvokeCustomFromClient"):InvokeServer("Fishing", "Clicked");
        end;
    end);
elseif config.FishingArea == 2 then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-184, 124, 5170); game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name]:WaitForChild("Model"):WaitForChild("Rod"); game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1449, 65, -4449);
    task.spawn(function()
        while task.wait() do
            if not game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name].Model.Rod:FindFirstChild("FishingLine") then
                if require(game:GetService("ReplicatedStorage").Library.Client.MasteryCmds).GetLevel("Fishing") >= 30 and game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active.AdvancedFishing.Interactable:FindFirstChild("DeepPool") then
                    FireRemote("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing", "RequestCast", game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active.AdvancedFishing.Interactable.DeepPool.Position);
                else
                    FireRemote("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing", "RequestCast", Vector3.new(1460, 61, -4442));
                end;
            end;
            FireRemote("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing", "RequestReel");
            FireRemote("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing", "Clicked");
        end;
    end);
end;

for i, v in next, game:GetDescendants() do
    if v:IsA("MeshPart") then
        v.MeshId = "";
    end;
    if v:IsA("BasePart") or v:IsA("MeshPart") then
        v.Transparency = 1;
    end;
    if v:IsA("Texture") or v:IsA("Decal") then
        v.Texture = "";
    end;
    if v:IsA("ParticleEmitter") then
        v.Lifetime = NumberRange.new(0);
        v.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0)});
        v.Enabled = false;
    end;
    if v:IsA("BillboardGui") or v:IsA("SurfaceGui") or v:IsA("Trail") or v:IsA("Beam") then
        v.Enabled = false;
    end;
    if v:IsA("Highlight") then
        v.OutlineTransparency = 1;
        v.FillTransparency = 1;
    end;
end;
for i, v in next, game:GetService("Players"):GetPlayers() do
    if v.Name ~= game:GetService("Players").LocalPlayer.Name then
        game:GetService("Workspace"):FindFirstChild(v.Name):Destroy();
    end;
end;
game:GetService("Players").PlayerAdded:Connect(function(Player)
    game:GetService("Workspace"):WaitForChild(Player.Name):Destroy();
end);
game:GetService("RunService"):Set3dRenderingEnabled(false);
local ScreenGui = Instance.new("ScreenGui");local Frame = Instance.new("Frame");local TextLabel = Instance.new("TextLabel");local Time = Instance.new("TextLabel");ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;ScreenGui.Parent = game:GetService("CoreGui");Frame.Size = UDim2.new(1.7095088958740234, 0, 1.9278595447540283, 0);Frame.BorderColor3 = Color3.fromRGB(0, 0, 0);Frame.Position = UDim2.new(-0.445141077041626, 0, -0.46497583389282227, 0);Frame.BorderSizePixel = 0;Frame.BackgroundColor3 = Color3.fromRGB(27, 27, 27);Frame.Parent = ScreenGui;TextLabel.BorderSizePixel = 0;TextLabel.RichText = true;TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);TextLabel.Size = UDim2.new(0.20062695443630219, 0, 0.13768115639686584, 0);TextLabel.TextSize = 30;TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0);TextLabel.Text = "Fred\'s Fishing v2";TextLabel.TextColor3 = Color3.fromRGB(95, 95, 95);TextLabel.Font = Enum.Font.GothamBold;TextLabel.Position = UDim2.new(0.3996865153312683, 0, 0.4311593770980835, 0);TextLabel.BackgroundTransparency = 1;TextLabel.Parent = ScreenGui;Time.Name = "Time";Time.BorderSizePixel = 0;Time.RichText = true;Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255);Time.Size = UDim2.new(0.20062695443630219, 0, 0.13768115639686584, 0);Time.TextSize = 30;Time.BorderColor3 = Color3.fromRGB(0, 0, 0);Time.Text = "00:00:00:00";Time.TextColor3 = Color3.fromRGB(95, 95, 95);Time.Font = Enum.Font.GothamBold;Time.Position = UDim2.new(0.3996865153312683, 0, 0.49275362491607666, 0);Time.BackgroundTransparency = 1;Time.Parent = ScreenGui;
task.spawn(function()
    while task.wait() do
        Time.Text = ConvertToDHMS(tick() - tick_);
    end;
end);
