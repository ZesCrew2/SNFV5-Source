function onCountdownTick(swagCounter)

if swagCounter == 0 then  -- 3

--playSound('Intro3', 2)

makeLuaSprite('3', 'ha1-pixel', screenWidth / 1.7 - 369, screenHeight / 1.8 - 185);

setObjectCamera('3', 'camHUD');

scaleObject('3', 1, 1);

doTweenAlpha('elpepe', '3', 0, crochet / 1000, 'cubeInOut');

setProperty('countdown3.visible', false);

addLuaSprite('3', true);

end

if swagCounter == 1 then  -- Ready

--playSound('Intro2', 2)

makeLuaSprite('ready', 'ha2-pixel', screenWidth / 1.7 - 369, screenHeight / 1.8 - 185);

setObjectCamera('ready', 'camHUD');

scaleObject('ready', 1, 1);

doTweenAlpha('elpepe', 'ready', 0, crochet / 1000, 'cubeInOut');

setProperty('countdownReady.visible', false);

addLuaSprite('ready', true);

end

if swagCounter == 2 then -- Set

--playSound('Intro1', 2)

makeLuaSprite('set', 'ha3-pixel', screenWidth / 1.7 - 369, screenHeight / 1.8 - 185);

setObjectCamera('set', 'camHUD');

scaleObject('set', 1, 1);

doTweenAlpha('elpepe', 'set', 0, crochet / 1000, 'cubeInOut');

setProperty('countdownSet.visible', false);

addLuaSprite('set', true);

end

if swagCounter == 3 then -- GO

--playSound('IntroGo', 2)

makeLuaSprite('GO', 'one-pixel', screenWidth / 1.5 - 569, screenHeight / 1.8 - 185);

setObjectCamera('GO', 'camHUD');

scaleObject('GO', 1, 1);

doTweenAlpha('elpepe', 'GO', 0, crochet / 1000, 'cubeInOut');

setProperty('countdownGo.visible', false);

addLuaSprite('GO', true);

end

end
