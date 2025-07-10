--events coded by @monoaether

function opponentNoteHit()
       health = getProperty('health')
    if getProperty('health') > 0.1 then
       setProperty('health', health- 0.015);
	end
end

function goodNoteHit()
   health = getProperty('health')
   setProperty('health', health + 0.01);
end

function onCreate()
   setProperty('defaultCamZoom', 2.0)

   makeLuaSprite('black', '', 0, 0)
   makeGraphic('black', screenWidth, screenHeight, '000000')
   setObjectCamera('black', 'other')
   addLuaSprite('black', true)

   makeLuaSprite('white', '', 0, 0)
   makeGraphic('white', screenWidth, screenHeight, 'FFFFFF')
   setObjectCamera('white', 'other')
   setProperty('white.alpha', 0)
   setObjectOrder('white', 15)
   addLuaSprite('white', true)

   makeLuaSprite('blackbg', '', -800, 0)
   makeGraphic('blackbg', 3000, 3000, '000000')
   setObjectOrder('blackbg', 3)
   setProperty('blackbg.alpha', 0)
   addLuaSprite('blackbg', true)

   makeLuaSprite('SpbarringUp', 'bar', -110, -850)
	setObjectCamera('SpbarringUp', 'HUD')
	addLuaSprite('SpbarringUp', true)
   setObjectOrder('SpbarringUp', 0)

   makeLuaSprite('SpbarringDown', 'bar', -110, 720)
	setObjectCamera('SpbarringDown', 'HUD')
	addLuaSprite('SpbarringDown', true)
   setObjectOrder('SpbarringDown', 0)

   makeLuaSprite('ransom', 'ransom_screen', 0, 0)
   setObjectCamera('ransom', 'hud')
   setObjectOrder('ransom', 0)
   setProperty('ransom.alpha', 0)
   addLuaSprite('ransom', true)

   makeLuaSprite('vingette', 'funkborder', 0, 0)
   setObjectCamera('vingette', 'hud')
   addLuaSprite('vingette', true)
   scaleLuaSprite('vingette', 0.55, 0.52)
   setProperty('vingette.alpha', 0)

   makeLuaSprite('blueblend', '', 0, 0)
   makeGraphic('blueblend', 2000, 2000, '0000FF')
   setObjectCamera('blueblend', 'hud')
   setBlendMode('blueblend', 'multiply')
   setProperty('blueblend.alpha', 0)
   setObjectOrder('blueblend', 700)
   addLuaSprite('blueblend', true)
end

function onSongStart()
   startTween('blackgone', 'black', {alpha = 0}, 2, {ease = 'quintOut'})
end

function onBeatHit()
   if curBeat == 62 then
      setProperty('ransom.alpha', 1)
   end
   if curBeat == 64 then
      startTween('bar1', 'SpbarringUp', {y = getProperty('SpbarringUp.y') + 90}, 2, {ease = 'quintOut'})
      startTween('bar2', 'SpbarringDown', {y = getProperty('SpbarringDown.y') - 90}, 2, {ease = 'quintOut'})
      setProperty('white.alpha', 1)
      setProperty('ransom.alpha', 0)
      startTween('flash', 'white', {alpha = 0}, 2, {ease = 'linear'})
   end
   if curBeat == 175 then
      startTween('bar1', 'SpbarringUp', {y = getProperty('SpbarringUp.y') + 30}, 0.000001, {ease = 'quintOut'})
      startTween('bar2', 'SpbarringDown', {y = getProperty('SpbarringDown.y') - 30}, 0.000001, {ease = 'quintOut'})
      startTween('blackbg', 'blackbg', {alpha = 0.5}, 0.000001, {ease = 'quintOut'})
      setProperty('blueblend.alpha', 1)
      startTween('vingetteappear', 'vingette', {alpha = 0.8}, 0.000001, {ease = 'quintOut'})
   end
   if curBeat == 176 then
      startTween('blendingfiltergone', 'blueblend', {alpha = 0}, 1.5, {ease = 'quintOut'})
      startTween('bar1', 'SpbarringUp', {y = getProperty('SpbarringUp.y') - 30}, 2, {ease = 'quintOut'})
      startTween('bar2', 'SpbarringDown', {y = getProperty('SpbarringDown.y') + 30}, 2, {ease = 'quintOut'})
      startTween('blackbggone', 'blackbg', {alpha = 0}, 1.5, {ease = 'quintOut'})
      startTween('vingettegone', 'vingette', {alpha = 0}, 1.5, {ease = 'quintOut'})
   end
   if curBeat == 216 then
      startTween('blendingfilterappear', 'blueblend', {alpha = 1}, 0.8, {ease = 'quintOut'})
      startTween('bar1', 'SpbarringUp', {y = getProperty('SpbarringUp.y') + 40}, 0.8, {ease = 'quintOut'})
      startTween('bar2', 'SpbarringDown', {y = getProperty('SpbarringDown.y') - 40}, 0.8, {ease = 'quintOut'})
   end
   if curBeat == 220 then
      startTween('blendingfiltergone', 'blueblend', {alpha = 0}, 1.5, {ease = 'quintOut'})
      startTween('bar1', 'SpbarringUp', {y = getProperty('SpbarringUp.y') - 40}, 1.5, {ease = 'quintOut'})
      startTween('bar2', 'SpbarringDown', {y = getProperty('SpbarringDown.y') + 40}, 1.5, {ease = 'quintOut'})
   end
   if curBeat == 272 then
      startTween('blendingfilterappear', 'blueblend', {alpha = 0.7}, 2, {ease = 'quintOut'})
      startTween('bar1', 'SpbarringUp', {y = getProperty('SpbarringUp.y') - 90}, 2, {ease = 'quintOut'})
      startTween('bar2', 'SpbarringDown', {y = getProperty('SpbarringDown.y') + 90}, 2, {ease = 'quintOut'})
   end
   if curBeat == 304 then
      startTween('blendingfilterappearstrong', 'blueblend', {alpha = 1}, 0.5, {ease = 'quintOut'})
      setProperty('cameraSpeed', 5)
   end
   if curBeat == 336 then
      setProperty('black.alpha', 1)
   end
end

function onStepHit()
   if curStep == 432 or curStep == 496 then
      setProperty('vingette.alpha', 0.3)
      setProperty('blueblend.alpha', 0.3)
   end
   if curStep == 434 or curStep == 498 then
      setProperty('vingette.alpha', 0.6)
      setProperty('blueblend.alpha', 0.6)
   end
   if curStep == 436 or curStep == 500 then
      setProperty('vingette.alpha', 1.0)
      setProperty('blueblend.alpha', 1.0)
   end
   if curStep == 438 or curStep == 502 then
      startTween('vingettegone', 'vingette', {alpha = 0}, 1.5, {ease = 'quintOut'})
      startTween('blendingfiltergone', 'blueblend', {alpha = 0}, 1.5, {ease = 'quintOut'})
   end
   if curStep == 699 then
      setProperty('cameraSpeed',  80)
   end
   if curStep == 704 then
      setProperty('cameraSpeed',  1)
   end
end