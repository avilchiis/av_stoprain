local points = {}
local alreadyClose = false
local close = false

for k, v in pairs(Config.YmapLocations) do
    points[#points+1] = lib.points.new({
        coords = v['coords'],
        distance = v['radius'],
    })
end

for k, v in pairs(points) do
    function v:onExit()
        if Config.Debug then
            print('sync rain')
        end
        exports['av_weather']:setRain(true)
        close = false
        alreadyClose = false
    end
    
    function v:nearby()
        if self.currentDistance <= self.distance then
            close = true
            if not alreadyClose then
                if Config.Debug then
                    print('remove rain')
                end
                exports['av_weather']:setRain(false)
            end
        end
        if close and not alreadyClose then
            alreadyClose = true
        end
        if not close and alreadyClose then
            alreadyClose = false
        end
    end
end