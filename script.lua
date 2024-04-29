getgenv().config = {
    ["FishingArea"] = 1; -- 1 = Area 27, 2 = Area 92, 3 = Area 92 + Deep Pool
    ["CPUReducer"] = true;
    ["FPS"] = 10;
};

loadstring(game:HttpGet("https://raw.githubusercontent.com/1sethh/freds-fishing/main/src.lua", true))();
