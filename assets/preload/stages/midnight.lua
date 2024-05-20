function onCreate()

    
    makeLuaSprite('midnightbg', 'bgmidnight', '0', '0')
    scaleObject('midnightbg', 1.5, 1.5)
    addLuaSprite('midnightbg', false)
    setProperty('midnightbg.antialiasing', false)
    makeLuaSprite('vig', 'vig', '0', '0')
    setObjectCamera('vig', 'camHud')
    scaleObject('vig', 1.5, 1.2)
    addLuaSprite('vig', true)
    --overlay stuff :/
    makeLuaSprite('mid', 'mid', 0, 0)
    scaleObject('mid', 2.5, 1.5)
    setBlendMode('mid', 'hardlight')
    setProperty('mid.alpha', '0.4')
end

function onCountdownStarted()

    setProperty('camGame.visible', false)
    
end

function onStepHit()
if curStep == 16 then
    setProperty('camGame.visible', true)
end
if curStep == 399 then
    setProperty('defaultCamZoom', 1.1)
end
if curStep == 656 then
    addLuaSprite('mid', true)
    doTweenAlpha('bgsome', 'midnightbg', 0.2, 1.2, 'quartIn')
    cameraFlash('camGame', 'FFFFFF', 0.6)
end
if curStep == 895 then
   doTweenAlpha('bgvolta', 'midnightbg', 1, 1.2, 'quartIn')
   doTweenAlpha('byeoverlay', 'mid', 0, 1.2, 'quartIn')
end

if curStep == 905 then
    setProperty('camGame.visible', false)
end
    
if curStep == 912 then
    setProperty('camGame.visible', true)
end
-- events i added some time later :3
if curStep == 443 then
    cameraSetTarget('dad')
end
if curStep == 452 then
    cameraSetTarget('bf')
end
if curStep == 492 then
    cameraSetTarget('bf')
end
if curStep == 508 then
    cameraSetTarget('dad')
end
if curStep == 586 then
    cameraSetTarget('dad')
end
if curStep == 604 then
    cameraSetTarget('bf')
end
if curStep == 636 then
    cameraSetTarget('dad')
end
if curStep == 1051 then
    setProperty('camGame.visible', 'false')
end
end