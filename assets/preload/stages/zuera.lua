function onCreate()

    makeLuaSprite('zuerabg', 'zuerabg', '200', '70')
    scaleObject('zuerabg', 1.3, 1.3)
    addLuaSprite('zuerabg', false)
    setProperty('zuerabg.antialiasing', false)
    scaleObject('dad', 1.5)
end
function onStepHit()
    if curStep == 768 then
    setProperty('camGame.visible', false)
end
    if curStep == 778 then
    setProperty('camGame.visible', true)
end
end