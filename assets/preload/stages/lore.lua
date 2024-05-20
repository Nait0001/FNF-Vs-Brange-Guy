function onCreate()
    -- o bg em si
    makeLuaSprite('lore', 'lore/717', '-100', '-100')
    scaleObject('lore', 1.1, 1.1)
    makeLuaSprite('mesa', 'lore/1514', 750, 400)
    scaleObject('mesa', 0.6, 0.6)
    addLuaSprite('lore', false)
    addLuaSprite('mesa', false)
    
    --eventos e tals
    makeLuaSprite('color2', 'color3', '400', '200')
    scaleObject('color2', 1.4, 1.4)    
    setBlendMode('color2', 'shader')
end
    function onStepHit()
    if curStep == 1280 then
    doTweenAlpha('fade', 'gf', 0, 6, 'quart')  
    doTweenAlpha('fade2', 'lore', 0, 6, 'quart') 
    doTweenAlpha('fade6', 'mesa', 0, 6, 'quart') 
    addLuaSprite('color2', true)
end
    if curStep == 1728 then
    doTweenAlpha('fade3', 'gf', 1, 5, 'quart')  
    doTweenAlpha('fade4', 'lore', 1, 5, 'quart') 
    doTweenAlpha('fade7', 'mesa', 1, 5, 'quart') 
    doTweenAlpha('fade5', 'color2', 0, 5, 'quart')
end
    if curStep == 1984 then
    triggerEvent('Flash Camera', '0.4', '')    
    addLuaSprite('black', true)  
end
end