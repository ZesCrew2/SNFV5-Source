PressingRPrevention = false

if songName == 'Muckle' then
startGameOverOn = "puppet"
retryOn = "puppet"
isBattleblock = true
elseif songName == 'Big Chicken' then
startGameOverOn = "puppet"
retryOn = "puppet"
isBattleblock = true
elseif songName == 'Gem Collector' then
startGameOverOn = "puppet"
retryOn = "puppet"
isBattleblock = true
-- I'm not sure why stamps was added there but okay.
else
startGameOverOn = "general" -- "general" for the rest of the songs, "puppet" for Battleblock Theater
retryOn = "general"
isBattleblock = false
end
finishedGameOverLine = true

gameOverRetry = false
allSongs = { -- ADD THE SONGS HERE IN CASE IF IT GETS ADDED!!!! (- Herox/Arie Temps, as of June 12th, 2025. 10:49 PM)
'2am',
'a-fun-time-old',
'a-fun-time',
'abnormal-night',
'big-chicken',
'blasted-hedgehog',
'cube',
'disagreement-snf-mix',
'dithering-dingbots',
'dudebro',
'false-mirror',
'festival',
'final-demo',
'first-american',
'fuckleknuckle',
'funk-mastery',
'funkster',
'gamla',
'gangstache',
'gem-collector',
'hillside',
'i-can-haz-torrentz',
'joke-song',
'knights-trouble-afoot',
'knuckleheaded',
'lilypad',
'mental-fire',
'mental-fire-old',
'midnight-muffle',
'muckle',
'netlore',
'p1r4cy',
'peak-hill',
'predecessor',
're-rocked',
'rhythm-helper',
'robotnik-rock',
'robotnik_ii',
'sandopolis',
'sans',
'something-awful',
'spooky-fight',
'stained-mask',
'stamps',
'susiivo',
'suspicious-activity',
'throwback',
'vote-this',
'mama-coco-night-funkin-v5',
}

function onCreate()
addCharacterToList('bf-dead', 'boyfriend')
addCharacterToList('oldrestartmonitor', 'boyfriend')
end

function onUpdate()
--[[
if keyboardJustPressed('P') then
restartSong()
end
]]

	if PressingRPrevention == false then
		if startGameOverOn == "general" then
			if getHealth() <= 0.0001 and (practice) then
			
			elseif getHealth() <= 0.0001 then
			setProperty('health', 0.001)
			for _,v in ipairs(allSongs) do
			removeLuaScript("data/"..v.."/oh that must be them.lua")
			end
			stopSong = true
			canPause = false
			canEnd = false
			runTimer('deathGeneral', 1)
			setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
			setProperty('camHUD.visible', false)
			setProperty('camGame.visible', false)
			setProperty('borderL.visible', false)
			-- setProperty('spamUnhitNotes.visible', false)
			-- setProperty('warningText.visible', false)
			setProperty("inCutscene", true)
			
			setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
			if songName == 'Gamla' then
			triggerEvent('Change Character', 'bf', 'oldrestartmonitor')
			screenCenter('boyfriend')
			else
			triggerEvent('Change Character', 'bf', 'bf-dead')
			setProperty('boyfriend.x', 340)
			setProperty('boyfriend.y', 175)
			end
			triggerEvent('Play Animation', 'firstDeath', 'bf')
			setObjectCamera('boyfriend', 'other')
			playSound('fnf_loss_sfx', 1)
			
			PressingRPrevention = true
			gameOverRetry = true
			
			runHaxeCode([[
			game.KillNotes();
			game.vocals.pause();
			game.vocals.volume = 0;
			game.opponentVocals.pause();
			game.opponentVocals.volume = 0;
			
			game.camGame.setFilters();
			game.camHUD.setFilters();
			game.camOther.setFilters();
			
			FlxG.mouse.unload();
			]])
			end
		
		elseif startGameOverOn == "puppet" then
			if getHealth() <= 0.0001 and (practice) then
			
			elseif getHealth() <= 0.0001 then
			setProperty('health', 0.001)
			for _,v in ipairs(allSongs) do
			removeLuaScript("data/"..v.."/oh that must be them.lua")
			end
			stopSong = true
			canPause = false
			canEnd = false
			runTimer('deathPuppet', 1)
			finishedGameOverLine = false
			setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
			
			setProperty('camHUD.visible', false)
			setProperty('camGame.visible', false)
			setProperty("inCutscene", true)
			
			setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
			triggerEvent('Change Character', 'bf', 'bf-dead')
			triggerEvent('Play Animation', 'firstDeath', 'bf')
			setProperty('boyfriend.x', 340)
			setProperty('boyfriend.y', 175)
			setObjectCamera('boyfriend', 'other')
			playSound('fnf_loss_sfx', 1)
			
			PressingRPrevention = true
			
			runHaxeCode([[
			game.KillNotes();
			game.vocals.pause();
			game.vocals.volume = 0;
			game.opponentVocals.pause();
			game.opponentVocals.volume = 0;
			
			FlxG.mouse.unload();
			]])
			end
		end
	end
	
	if stopSong == true then
	setPropertyFromClass('backend.Conductor', 'songPosition', 00000)
	end
	
	if gameOverRetry == true then
		if retryOn == 'general' then
			if keyboardJustPressed('ENTER') then
			gameOverRetry = false
			playSound('gameOverEnd', 1)
			soundFadeIn('gameOverLoop Tag', 0.0001, 1, 0) -- I got way too annoying with this game over loop while testing this, I'll be real. (- Herox/Arie Temps)
			cancelTimer('the beat hits like hellStart')
			cancelTimer('the beat hits like hellLoop')
			cancelTimer('deathGeneral')
				if songName == 'Gamla' then
				
				else
				setProperty('boyfriend.scale.x', 1.4)
				setProperty('boyfriend.scale.y', 1.4)
				end
			triggerEvent('Play Animation', 'deathConfirm', 'bf')
			runTimer('fadeOut', 1.1)
			
			elseif keyboardJustPressed('ESCAPE') then
			exitSong()
			soundFadeIn('gameOverLoop Tag', 0.0001, 1, 0)
			setProperty('boyfriend.visible', false)
			end
			
		elseif retryOn == 'puppet' then
			if keyboardJustPressed('ENTER') then
			gameOverRetry = false
			playSound('gameOverEnd', 1)
			soundFadeIn('gameOverLoop Tag', 0.0001, 1, 0)
			cancelTimer('the beat hits like hellStart')
			cancelTimer('the beat hits like hellLoop')
			cancelTimer('deathGeneral')
			setProperty('boyfriend.scale.x', 1.4)
			setProperty('boyfriend.scale.y', 1.4)
			triggerEvent('Play Animation', 'deathConfirm', 'bf')
			runTimer('fadeOut', 1.1)
			
			elseif keyboardJustPressed('ESCAPE') then
			exitSong()
			soundFadeIn('gameOverLoop Tag', 0.0001, 1, 0)
			stopSound('he finished talking in death')
			setProperty('boyfriend.visible', false)
			end
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'deathGeneral' then
	--playMusic('gameOver', 1, true) -- as it turns out, you can't mute this as a music so this sucks. Had to switch to sound.
	playSound('gameOver', 1, 'gameOverLoop Tag')
	triggerEvent('Play Animation', 'deathLoop', 'bf')
		if songName == 'Gamla' then
			
		else
		setProperty('boyfriend.scale.x', 1.5)
		setProperty('boyfriend.scale.y', 1.5)
		doTweenX('the loop', 'boyfriend.scale', 1.4, 0.25, 'sineOut')
		doTweenY('the loop2', 'boyfriend.scale', 1.4, 0.25, 'sineOut')
		runTimer('the beat hits like hellStart', 0.6)
		end
	end
	
	if tag == 'the beat hits like hellStart' then
	runTimer('the beat hits like hellLoop', 0.6)
		if songName == 'Gamla' then
			
		else
		setProperty('boyfriend.scale.x', 1.5)
		setProperty('boyfriend.scale.y', 1.5)
		doTweenX('the loop', 'boyfriend.scale', 1.4, 0.25, 'sineOut')
		doTweenY('the loop2', 'boyfriend.scale', 1.4, 0.25, 'sineOut')
		end
	
	elseif tag == 'the beat hits like hellLoop' then
	runTimer('the beat hits like hellStart', 0.6)
		if songName == 'Gamla' then
		
		else
		setProperty('boyfriend.scale.x', 1.5)
		setProperty('boyfriend.scale.y', 1.5)
		doTweenX('the loop', 'boyfriend.scale', 1.4, 0.25, 'sineOut')
		doTweenY('the loop2', 'boyfriend.scale', 1.4, 0.25, 'sineOut')
		end
	end
	
	if tag == 'deathPuppet' then
	--playMusic('gameOver', 1, true) -- as it turns out, you can't mute this as a music so this sucks. Had to switch to sound.
	playSound('gameOver', 0.25, 'gameOverLoop Tag')
	
	randomLine = getRandomInt(1,17)
		if randomLine == 1 then
		randomLine = 'BYEBYE'
		elseif randomLine == 2 then
		randomLine = 'comeONNN'
		elseif randomLine == 3 then
		randomLine = 'DUMDUM'
		elseif randomLine == 4 then
		randomLine = 'EW'
		elseif randomLine == 5 then
		randomLine = 'FF7'
		elseif randomLine == 6 then
		randomLine = 'goodJOB'
		elseif randomLine == 7 then
		randomLine = 'GOODNESSgracious'
		elseif randomLine == 8 then
		randomLine = 'HARD2concentrate'
		elseif randomLine == 9 then
		randomLine = 'iBET'
		elseif randomLine == 10 then
		randomLine = 'messedUP'
		elseif randomLine == 11 then
		randomLine = 'MORGUE'
		elseif randomLine == 12 then
		randomLine = 'MYEH'
		elseif randomLine == 13 then
		randomLine = 'SHEsaid'
		elseif randomLine == 14 then
		randomLine = 'SSSHUTUP'
		elseif randomLine == 15 then
		randomLine = 'WHATEVER'
		elseif randomLine == 16 then
		randomLine = 'whatNOWgenius' -- as a genius I feel offended /j (- Herox/Arie Temps)
		elseif randomLine == 17 then
		randomLine = 'WONDERFUL'
		end
		
	soundName = 'DEATH/DEATH_'..randomLine
	playSound(soundName, 1, 'he finished talking in death')
	
	-- FUCK
	
	triggerEvent('Play Animation', 'deathLoop', 'bf')
	setProperty('boyfriend.scale.x', 1.5)
	setProperty('boyfriend.scale.y', 1.5)
	doTweenX('the loop', 'boyfriend.scale', 1.4, 0.25, 'sineOut')
	doTweenY('the loop2', 'boyfriend.scale', 1.4, 0.25, 'sineOut')
	runTimer('the beat hits like hellStart', 0.6)
	end
	
	if tag == 'fadeOut' then
	doTweenAlpha('adiosRestart', 'boyfriend', 0, 1.5, 'linear')
	end
end

function onTweenCompleted(tag)
	if tag == 'adiosRestart' then
	restartSong()
	end
end

function onSoundFinished(tag)
	if tag == 'gameOverLoop Tag' then
		if not finishedGameOverLine and isBattleblock then
		playSound('gameOver', 0.25, 'gameOverLoop Tag')
		elseif finishedGameOverLine and not isBattleblock then
		playSound('gameOver', 1, 'gameOverLoop Tag')
		end
	end
	
	if tag == 'he finished talking in death' then
	finishedGameOverLine = true
	gameOverRetry = true
	soundFadeIn('gameOverLoop Tag', 0.5, 0.25, 1)
	end
end

function onGameOver()
	return Function_Stop;
end

function onEndSong()
	if canEnd == false then
	return Function_Stop
	end
end

function onPause()
	if canPause == false then
	return Function_Stop
	end
end
