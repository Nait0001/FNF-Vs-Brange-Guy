function onCreate()

    makeLuaSprite('bgguy', 'guy', '330', '200')
    scaleObject('bgguy', 2.2, 2.2)
    addLuaSprite('bgguy', false)
    setProperty('bgguy.antialiasing', false)
    makeLuaSprite('color', 'color', '330', '200')
    scaleObject('color', 1.5, 1.5)
end

function onStepHit()
    if curStep == 1282 then
        
        addLuaScript('nota', true)
        addLuaSprite('color', true)

end
    if curStep == 1664 then
        removeLuaSprite('color', true)
end

    if curStep == 1812 then
        setProperty('camGame.visible', false)
        setProperty('camHUD.visible', false)
end
end

