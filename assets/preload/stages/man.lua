function onCreate()

    makeLuaSprite('raluca', 'raluca', '150', '120')
    scaleObject('raluca', 1.8, 1.8)
    addLuaSprite('raluca', false)
    setProperty('raluca.antialiasing', false)
    makeLuaSprite('color', 'color', '150', '120')
    scaleObject('color', 1.5, 1.5)
end
function onStepHit()
if curStep == 14 then
    doTweenZoom('zoom1', 'camGame', 1.1, 0.6, 'quartOut')
end
if curStep == 58 then
    setProperty('defaultCamZoom', 1.3)
end
if curStep == 64 then
    setProperty('defaultCamZoom', 0.85)
    cameraFlash('camGame', 'FFFFFF', 0.5)
end
if curStep == 78 then
    doTweenZoom('zoom2', 'camGame', 1.1, 0.6, 'quartOut')
end
if curStep == 122 then
    setProperty('defaultCamZoom', 1.3)
end
if curStep == 128 then
    setProperty('defaultCamZoom', 0.85)
    cameraFlash('camGame', 'FFFFFF', 0.5)
end
if curStep == 256 then
    setProperty('defaultCamZoom', 1.2)
end
if curStep == 320 then
    setProperty('defaultCamZoom', 1.4)
end
if curStep == 332 then
    cameraSetTarget('dad')
end
if curStep == 336 then
    cameraSetTarget('boyfriend')
end
if curStep == 348 then
    cameraSetTarget('dad')
end
if curStep == 355 then
    cameraSetTarget('boyfriend')
end
if curStep == 364 then
    cameraSetTarget('dad')
end
if curStep == 371 then
    cameraSetTarget('boyfriend')
end
if curStep == 376 then
    setProperty('defaultCamZoom', 1.2)
end
if curStep == 384 then
    setProperty('defaultCamZoom', 1.3)
end
if curStep == 387 then
    setProperty('defaultCamZoom', 0.9)
    cameraFlash('camGame', 'FFFFFF', 0.5)
end
if curStep == 524 then
    doTweenZoom('zoom3', 'camGame', 1.5, 0.7, 'expoOut')
end
if curStep == 1656 then
    cameraSetTarget('dad')
end
end