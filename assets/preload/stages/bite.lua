function onCreate()
    makeLuaSprite('Bedroom', 'Bedroom', '300', '-200')
    scaleObject('Bedroom', 3, 3)
    addLuaSprite('Bedroom', false)
    makeLuaSprite('color', 'shadenightmare', 390, 0)
    scaleObject('color', 1.5, 1.5)
    doTweenAlpha('color2', 'color', 0.6, 0.01, 'linear')
    makeLuaSprite('shade', 'foxyC', 0, 0)
    setObjectCamera('shade', 'camHud')
    makeAnimatedLuaSprite('jump1', 'jumpscares/jump1', 0, 0)
    addAnimationByPrefix('jump1', 'idle', 'jump1', '26', true)
    makeAnimatedLuaSprite('jump2', 'jumpscares/jump2', 0, 0)
    addAnimationByPrefix('jump2', 'idle', 'jump2', '26', true)
    makeAnimatedLuaSprite('jump3', 'jumpscares/jump3', 0, 0)
    addAnimationByPrefix('jump3', 'idle', 'jump3', '26', true)
    makeAnimatedLuaSprite('jump4', 'jumpscares/jump4', 0, 0)
    addAnimationByPrefix('jump4', 'idle', 'jump4', '26', true)
    makeLuaSprite('jump5', 'jumpscares/jump5', 00, -100)
    scaleObject('jump5', 7.5,7.5)
    makeLuaSprite('vig', 'vig', '0', '0')
    setObjectCamera('vig', 'camHud')
    scaleObject('vig', 1.5, 1.2)
    scaleObject('jump1', 1.5, 1.5, true)
    scaleObject('jump2', 4.5, 4.5, true)
    scaleObject('jump3', 2, 2, true)
    scaleObject('jump4', 2,2)
    setObjectCamera('jump1', 'camHud')
    setObjectCamera('jump2', 'camHud')
    setObjectCamera('jump3', 'camHud')
    setObjectCamera('jump4', 'camHud')
    setObjectCamera('jump5', 'camHud')
end

function onCountdownStarted()
doTweenAlpha('bonnievisible', 'dad', '0', '0.01', 'linear')
setProperty('camGame.visible', false)
end

function onStepHit()
if curStep == 1 then
    setProperty('camGame.visible', true)
    doTweenX('felps1', 'gf', defaultGirlfriendX - 600, 0.01, 'linear')
    doTweenX('cell1', 'boyfriend', defaultBoyfriendX + 100, 0.01, 'linear')
end
if curStep == 3 then
    doTweenX('felps2', 'gf.scale', -1, 0.01, 'linear')
end
if curStep == 6 then
    doTweenX('cell2', 'boyfriend.scale', -1, 0.01, 'linear')
end
if curStep == 18 then
    doTweenX('cell3', 'boyfriend.scale', 1, 0.01, 'linear')
end
if curStep == 70 then
    doTweenX('felps3', 'gf.scale', 1, 1, 'linear')
end
if curStep == 70 then
    doTweenX('felps4', 'gf', defaultGirlfriendX - 400, 0.5, 'quartIn')
end
if curStep == 134 then
    doTweenX('cell4', 'boyfriend.scale', 1, 0.01, 'linear')
end
if curStep == 151 then
    doTweenX('cell5', 'boyfriend', defaultGirlfriendX - 370, 0.4, 'expoIn')
end
if curStep == 134 then
    doTweenX('cell6', 'boyfriend', defaultBoyfriendX, 0.4, 'expoIn')
end
if curStep == 160 then
    doTweenX('cell7', 'boyfriend', defaultBoyfriendX, 0.4, 'expoIn')
    doTweenX('felps9', 'gf', defaultGirlfriendX + 100, 1.2, 'expoIn')
end
if curStep == 170 then
    doTweenX('felps10', 'gf', -1, 0.01, 'linear')
end
if curStep == 184 then
    doTweenX('cell8', 'boyfriend', defaultBoyfriendX + 250, 3, 'expoIn')
    doTweenX('cell9', 'boyfriend.scale', -1, 0.01, 'linear')
end
if curStep == 134 then
    doTweenX('cell10', 'boyfriend.scale', 1, 0.01, 'linear')
end
if curStep == 216 then
    doTweenX('cell11', 'boyfriend.scale', -1, 0.01, 'linear')
end
if curStep == 231 then
    doTweenX('cell12', 'boyfriend.scale', 1, 0.01, 'linear')
end
if curStep == 224 then
    doTweenX('cell12', 'boyfriend', defaultBoyfriendX, '0.4', 'expoIn')
end
if curStep == 312 then
    doTweenAlpha('bonnievisible2', 'dad', '1', '0.7', 'quart')
end
if curStep == 327 then
    addLuaSprite('jump1', true)
    setObjectOrder('jump1', 2)
end
if curStep == 336 then
    removeLuaSprite('jump1', false)
end
if curStep == 392 then
    addLuaSprite('jump1', true)
    setObjectOrder('jump1', 2)
end
if curStep == 399 then
    removeLuaSprite('jump1', false)
end
if curStep == 487 then
    addLuaSprite('jump1', true)
    setObjectOrder('jump1', 2)
end
if curStep == 496 then
    removeLuaSprite('jump1', false)
end
if curStep == 512 then
    addLuaSprite('jump1', true)
    setObjectOrder('jump1', 2)
end
if curStep == 516 then
    removeLuaSprite('jump1', false)
end
if curStep == 912 then
    addLuaSprite('jump1', true)
    setObjectOrder('jump1', 2)
end
if curStep == 915 then
    removeLuaSprite('jump1', false)
end
if curStep == 1424 then
    addLuaSprite('jump2', true)
    setObjectOrder('jump2', 2)
end
if curStep == 1430 then
    removeLuaSprite('jump2', false)
    doTweenAlpha('Foxyfezquenemmeupai', 'dad', 0, 1, 'quartIn')
    doTweenX('FoxyX2', 'dad', defaultOpponentX - 50, '1', 'quartIn')
end
if curStep == 1543 then
    addLuaSprite('jump2', true)
    setObjectOrder('jump2', 2)
end
if curStep == 1559 then
    removeLuaSprite('jump2', false)
end
if curStep == 1680 then
    addLuaSprite('jump3', true)
    setObjectOrder('jump3', 2)
end
if curStep == 1687 then
    removeLuaSprite('jump3', false)
end
if curStep == 912 then
    doTweenAlpha('bonnievisible3', 'dad', '0', '0.7', 'linear')
    doTweenX('bonnieup', 'dad', defaultOpponentX - 50, '0.7', 'quartIn')
end
if curStep == 1032 then
    doTweenAlpha('foxyvisible', 'dad', '1', '0.01', 'linear')
    doTweenX('FoxyX', 'dad', defaultOpponentX, '0.01', 'quartIn')
end
if curStep == 1308 then
    addLuaSprite('shade', true)
    setObjectOrder('shade', 2)
end
if curStep == 1680 then
    doTweenAlpha('fedyvisible', 'dad', '1', '0.01', 'linear')
    doTweenX('FedyX', 'dad', defaultOpponentX, '0.01', 'quartIn')
end
if curStep == 1544 then
    setProperty('camGame.visible', false)
    removeLuaSprite('shade', true)
end
if curStep == 1566 then
    setProperty('camGame.visible', true)
end
if curStep == 2072 then
    doTweenAlpha('byefedy', 'dad', 0, 6, 'expoIn')
end
if curStep == 2216 then
    doTweenAlpha('hifedy', 'dad', 1, 0.01, 'expoIn')
end
if curStep == 2728 then
    addLuaSprite('jump4', true)
    setObjectOrder('jump4', 2)
end
if curStep == 2744 then
    removeLuaSprite('jump4', true)
    addLuaSprite('color', true)
    addLuaSprite('vig', true)
    addLuaScript('nightmareshake', false)
end
if curStep == 3127 then
    addLuaSprite('jump5', true)
    setObjectOrder('jump5', 2)
end
if curStep == 3132 then
    removeLuaSprite('jump5', false)
end
if curStep == 3191 then
    addLuaSprite('jump5', true)
    setObjectOrder('jump5', 2)
end
if curStep == 3197 then
    removeLuaSprite('jump5', false)
end
if curStep == 3272 then
    doTweenAlpha('tchaunightmare', 'dad', 0, 1.6, 'quartIn')
    doTweenAlpha('tchautchauuu', 'boyfriend', 0, 0.01, 'linear')
end
if curStep == 3400 then
    setProperty('camGame.visible', false)
end
end