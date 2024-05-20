function onCreate()
    makeLuaSprite('ofcourse', 'of', 430, 100)
    setProperty('ofcourse.antialiasing', false)
    addLuaSprite('ofcourse', false)
    scaleObject('ofcourse', 1.8, 1.8)
    makeLuaSprite('flamengo', 'flamengo', 430, 100)
    scaleObject('flamengo', 0.5, 0.5)
    doTweenAlpha('flamengoalpha1', 'flamengo', 0, 0.01, 'quartIn')

end

function onStepHit()
    if curStep == 887 then
        doTweenAlpha('flamengoalpha2', 'flamengo', 1, 0.4, 'quartIn')
    end
end