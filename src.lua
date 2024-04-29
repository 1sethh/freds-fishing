-- // Auto Fish Farm PS99
-- // @s8th.
-- // v2.1 ; Added Timer (Updates every 2 minutes to minimze lag)

if getgenv().__ENABLED then return; end; getgenv().__ENABLED = true;

local init = loadstring(game:HttpGet("https://raw.githubusercontent.com/1sethh/freds-fisher/main/init.lua"))();

if config.FishingArea == 1 then
    init:Teleport(795, 19, 1135); game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name]:WaitForChild("Model"):WaitForChild("Rod"); init:Teleport(1113, 80, -3444);
    task.spawn(function()
        while task.wait() do
            if not game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name].Model.Rod:FindFirstChild("FishingLine") then
                init:FireRemote("Instancing_FireCustomFromClient"):FireServer("Fishing", "RequestCast", Vector3.new(1139, 75, -3445));
            else
                init:FireRemote("Instancing_FireCustomFromClient"):FireServer("Fishing", "RequestReel");
            end;
            init:FireRemote("Instancing_InvokeCustomFromClient"):InvokeServer("Fishing", "Clicked");
        end;
    end);
elseif config.FishingArea == 2 then
    init:Teleport(-184, 124, 5170); game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name]:WaitForChild("Model"):WaitForChild("Rod"); init:Teleport(1449, 65, -4449);
    task.spawn(function()
        while task.wait() do
            if not game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name].Model.Rod:FindFirstChild("FishingLine") then
                init:FireRemote("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing", "RequestCast", Vector3.new(1460, 61, -4442));
            else
                init:FireRemote("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing", "RequestReel");
            end;
            init:FireRemote("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing", "Clicked");
        end;
    end);
elseif config.FishingArea == 3 then
    init:Teleport(-184, 124, 5170); game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name]:WaitForChild("Model"):WaitForChild("Rod"); init:Teleport(1449, 65, -4449);
    task.spawn(function()
        while task.wait() do
            if not game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name].Model.Rod:FindFirstChild("FishingLine") then
                if game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active.AdvancedFishing.Interactable:FindFirstChild("DeepPool") then
                    init:FireRemote("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing", "RequestCast", game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active.AdvancedFishing.Interactable.DeepPool.Position);
                else
                    init:FireRemote("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing", "RequestCast", Vector3.new(1460, 61, -4442));
                end;
            else
                init:FireRemote("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing", "RequestReel");
            end;
            init:FireRemote("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing", "Clicked");
        end;
    end);
end;

init:AntiAFK(true);
init:CPUReducer(config.CPUReducer);
setfpscap(config.FPS);
