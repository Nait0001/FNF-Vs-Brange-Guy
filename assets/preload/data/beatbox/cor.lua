function onCreate()
    makeLuaSprite('color2', 'color2', '0', '0')
    scaleObject('color2', 1, 1)    
    setObjectCamera('color2', 'camHud')
end

function onStepHit()
    if curStep == 142 then
        startCountdown()
    end
    if curStep == 152 then
        addLuaSprite('color2', true)
    end
    if curStep == 280 then
        removeLuaSprite('color2', true)
    end
end