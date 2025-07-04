isMuted = false
pauseMenuActive = false
helpEnter = false
pauseSelection = 1

-- LEVEL NUMBER HERE!
levelNumber = "S1-03"

--[[

Context as of why I called this as "oh that must be them":
"Angry Mogging" by VibingLeaf

]]

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

function onCreate()
        setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
	runHaxeCode([[
		FlxG.mouse.unload();
		FlxG.log.add("Angry Birds Cursor" + Paths.image("ab_cursor")); // amogusgameALT i'm looking at you 
		FlxG.mouse.load(Paths.image("ab_cursor").bitmap, 1, 0); // you can't hide what you did
	]])
	
	
	-- I have to make multiple lua sprites..............................................
	makeAnimatedLuaSprite('pauseMenuOverlay1', '3lamepausemenu', 0, 0) -- I DON'T GIVE A SHIT THAT IT'S LAME, FILE NAME!!!!!!! /silly (- Herox)
	addAnimationByPrefix('pauseMenuOverlay1', 'overlay_1', 'overlay_1', 0, false)
	addAnimationByPrefix('pauseMenuOverlay1', 'overlay_2', 'overlay_2', 0, false)
	addAnimationByPrefix('pauseMenuOverlay1', 'button_exit', 'button_exit', 0, false)
	addAnimationByPrefix('pauseMenuOverlay1', 'button_help', 'button_help', 0, false)
	addAnimationByPrefix('pauseMenuOverlay1', 'button_mute', 'button_mute', 0, false)
	addAnimationByPrefix('pauseMenuOverlay1', 'button_muted', 'button_muted', 0, false)
	addAnimationByPrefix('pauseMenuOverlay1', 'button_resume', 'button_resume', 0, false)
	addAnimationByPrefix('pauseMenuOverlay1', 'button_retry', 'button_retry', 0, false)
	addAnimationByPrefix('pauseMenuOverlay1', 'button_yuh_huh', 'button_yuh_huh', 0, false)
	addAnimationByPrefix('pauseMenuOverlay1', 'prompt_help', 'prompt_help', 0, false)
	addAnimationByPrefix('pauseMenuOverlay1', 'restart_song', 'restart_song', 0, false)
	objectPlayAnimation('pauseMenuOverlay1', 'overlay_2')
	setObjectCamera('pauseMenuOverlay1', 'other')
	addLuaSprite('pauseMenuOverlay1', true)
	setProperty('pauseMenuOverlay1.alpha', 0)
	
	makeAnimatedLuaSprite('pauseMenuOverlay2', '3lamepausemenu', 0, 0)
	addAnimationByPrefix('pauseMenuOverlay2', 'overlay_1', 'overlay_1', 0, false)
	objectPlayAnimation('pauseMenuOverlay2', 'overlay_1')
	setObjectCamera('pauseMenuOverlay2', 'other')
	addLuaSprite('pauseMenuOverlay2', true)
	setProperty('pauseMenuOverlay2.alpha', 0)
	
	makeAnimatedLuaSprite('pauseMenuResume', '3lamepausemenu', 10, 10)
	addAnimationByPrefix('pauseMenuResume', 'button_resume', 'button_resume', 0, false)
	objectPlayAnimation('pauseMenuResume', 'button_resume')
	scaleObject('pauseMenuResume', 0.9, 0.9)
	setObjectCamera('pauseMenuResume', 'other')
	addLuaSprite('pauseMenuResume', true)
	setProperty('pauseMenuResume.alpha', 0)
	
	makeAnimatedLuaSprite('pauseMenuRetry', '3lamepausemenu', 125, 200+15)
	addAnimationByPrefix('pauseMenuRetry', 'button_retry', 'button_retry', 0, false)
	objectPlayAnimation('pauseMenuRetry', 'button_retry')
	scaleObject('pauseMenuRetry', 0.9, 0.9)
	setObjectCamera('pauseMenuRetry', 'other')
	addLuaSprite('pauseMenuRetry', true)
	setProperty('pauseMenuRetry.alpha', 0)
	
	makeAnimatedLuaSprite('pauseMenuExit', '3lamepausemenu', 125, 400-15)
	addAnimationByPrefix('pauseMenuExit', 'button_exit', 'button_exit', 0, false)
	objectPlayAnimation('pauseMenuExit', 'button_exit')
	scaleObject('pauseMenuExit', 0.9, 0.9)
	setObjectCamera('pauseMenuExit', 'other')
	addLuaSprite('pauseMenuExit', true)
	setProperty('pauseMenuExit.alpha', 0)
	
	makeAnimatedLuaSprite('pauseMenuMute', '3lamepausemenu', 90, 600)
	addAnimationByPrefix('pauseMenuMute', 'button_mute', 'button_mute', 0, false)
	addAnimationByPrefix('pauseMenuMute', 'button_muted', 'button_muted', 0, false)
	objectPlayAnimation('pauseMenuMute', 'button_mute')
	scaleObject('pauseMenuMute', 0.9, 0.9)
	setObjectCamera('pauseMenuMute', 'other')
	addLuaSprite('pauseMenuMute', true)
	setProperty('pauseMenuMute.alpha', 0)
	
	makeAnimatedLuaSprite('pauseMenuHelp', '3lamepausemenu', 190, 600)
	addAnimationByPrefix('pauseMenuHelp', 'button_help', 'button_help', 0, false)
	objectPlayAnimation('pauseMenuHelp', 'button_help')
	scaleObject('pauseMenuHelp', 0.9, 0.9)
	setObjectCamera('pauseMenuHelp', 'other')
	addLuaSprite('pauseMenuHelp', true)
	setProperty('pauseMenuHelp.alpha', 0)
	
	makeAnimatedLuaSprite('pauseMenuPrompt', '3lamepausemenu', 0, 0)
	addAnimationByPrefix('pauseMenuPrompt', 'prompt_help', 'prompt_help', 0, false)
	objectPlayAnimation('pauseMenuPrompt', 'prompt_help')
	setObjectCamera('pauseMenuPrompt', 'other')
	scaleObject('pauseMenuPrompt', 0.75, 0.75)
	screenCenter('pauseMenuPrompt')
	addLuaSprite('pauseMenuPrompt', true)
	setProperty('pauseMenuPrompt.alpha', 0)
	
	makeAnimatedLuaSprite('pauseMenuCheckmark', '3lamepausemenu', 775, 500)
	addAnimationByPrefix('pauseMenuCheckmark', 'button_yuh_huh', 'button_yuh_huh', 0, false)
	objectPlayAnimation('pauseMenuCheckmark', 'button_yuh_huh')
	setObjectCamera('pauseMenuCheckmark', 'other')
	scaleObject('pauseMenuCheckmark', 0.75, 0.75)
	-- screenCenter('pauseMenuCheckmark')
	addLuaSprite('pauseMenuCheckmark', true)
	setProperty('pauseMenuCheckmark.alpha', 0)
	
	makeLuaText('levels', levelNumber, 0, -260, 25) -- 180
	setProperty('levels.antialiasing', false)
	setTextFont('levels', 'angrybirds-regular.ttf')
	setTextSize('levels', 50, 50) -- 80
	addLuaText('levels')
	setTextAlignment('levels', 'center')
	setTextWidth('levels', 1000)
	setObjectCamera('levels', 'other')
	setProperty('levels.alpha', 0)
end

function onCreatePost()
makeLuaSprite('PSYCH YOU SUCK', 'ab_cursor', 0, 0)
setProperty('PSYCH YOU SUCK.antialiasing', false)
scaleObject('PSYCH YOU SUCK', 1, 1)
addLuaSprite('PSYCH YOU SUCK', true)
setObjectCamera('PSYCH YOU SUCK', 'other')
setProperty('PSYCH YOU SUCK.alpha', 0)
end

-- necessary if you want the normal mouse to show up in things like the chart editor
function onDestroy()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
	runHaxeCode('FlxG.mouse.unload();')
end

function onPause()
	openCustomSubstate('pauseState', true);
	-- thisShit = {'Overlay1', 'Overlay2', 'Resume', '', '', '', ''}
	setProperty('pauseMenuOverlay1.alpha', 1)
	setProperty('pauseMenuOverlay2.alpha', 1)
	setProperty('pauseMenuResume.alpha', 1)
	setProperty('pauseMenuRetry.alpha', 1)
	setProperty('pauseMenuExit.alpha', 1)
	setProperty('pauseMenuMute.alpha', 1)
	setProperty('pauseMenuHelp.alpha', 1)
	setProperty('levels.alpha', 1)
	pauseMenuActive = true
	pauseSelection = 1
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
	setProperty('PSYCH YOU SUCK.alpha', 1)
	return Function_Stop;
end

function onUpdate()
	if isMuted == true then
	setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
	runHaxeCode([[
	game.vocals.volume = 0;
	game.opponentVocals.volume = 0;
	]])
	else
		if doubleCheckIfItDoesntSoundLikeOST == true then
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		runHaxeCode([[
		game.vocals.volume = 1;
		game.opponentVocals.volume = 1;
		]])
		doubleCheckIfItDoesntSoundLikeOST = false
		end
	end
end

function onCustomSubstateUpdatePost(name)
    if name == 'pauseState' then
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Q') then
		restartSong()
		end
	
	if pauseMenuActive == true then
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
			pauseSelection = pauseSelection-1
			end
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') then
			pauseSelection = pauseSelection+1
			end
		
			if pauseSelection > 5 then
				pauseSelection = 1
			end
			if pauseSelection < 1 then
				pauseSelection = 5
			end

		if pauseSelection == 1 then
		doTweenX('cursorX', 'PSYCH YOU SUCK', 50, 0.5, 'quartOut')
		doTweenY('cursorY', 'PSYCH YOU SUCK', 50, 0.5, 'quartOut')
		end

		if pauseSelection == 2 then
		doTweenX('cursorX', 'PSYCH YOU SUCK', 190, 0.5, 'quartOut')
		doTweenY('cursorY', 'PSYCH YOU SUCK', 275, 0.5, 'quartOut')
		end
		
		if pauseSelection == 3 then
		doTweenX('cursorX', 'PSYCH YOU SUCK', 190, 0.5, 'quartOut')
		doTweenY('cursorY', 'PSYCH YOU SUCK', 450, 0.5, 'quartOut')
		end
		
		if pauseSelection == 4 then
		doTweenX('cursorX', 'PSYCH YOU SUCK', 125, 0.5, 'quartOut')
		doTweenY('cursorY', 'PSYCH YOU SUCK', 635, 0.5, 'quartOut')
		end
		
		if pauseSelection == 5 then
		doTweenX('cursorX', 'PSYCH YOU SUCK', 225, 0.5, 'quartOut')
		doTweenY('cursorY', 'PSYCH YOU SUCK', 635, 0.5, 'quartOut')
		end

		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and pauseSelection == 1 then
		closeCustomSubstate();
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
		setProperty('pauseMenuOverlay1.alpha', 0)
		setProperty('pauseMenuOverlay2.alpha', 0)
		setProperty('pauseMenuResume.alpha', 0)
		setProperty('pauseMenuRetry.alpha', 0)
		setProperty('pauseMenuExit.alpha', 0)
		setProperty('pauseMenuMute.alpha', 0)
		setProperty('pauseMenuHelp.alpha', 0)
		setProperty('levels.alpha', 0)
		setProperty('PSYCH YOU SUCK.alpha', 0)
		end
		
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and pauseSelection == 2 then
		restartSong()
		end
		
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and pauseSelection == 3 then
		exitSong()
		end
		
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and pauseSelection == 4 then
			if isMuted == false then
			objectPlayAnimation('pauseMenuMute', 'button_muted')
			isMuted = true
			doubleCheckIfItDoesntSoundLikeOST = true
			else
			objectPlayAnimation('pauseMenuMute', 'button_mute')
			isMuted = false
			end
		end
		
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and pauseSelection == 5 then
			setProperty('pauseMenuPrompt.alpha', 1)
			setProperty('pauseMenuCheckmark.alpha', 1)
			setProperty('pauseMenuOverlay2.alpha', 0)
			setProperty('pauseMenuResume.alpha', 0)
			setProperty('pauseMenuRetry.alpha', 0)
			setProperty('pauseMenuExit.alpha', 0)
			setProperty('pauseMenuMute.alpha', 0)
			setProperty('pauseMenuHelp.alpha', 0)
			setProperty('levels.alpha', 0)
			doTweenX('cursorX', 'PSYCH YOU SUCK', 840, 0.5, 'quartOut')
			doTweenY('cursorY', 'PSYCH YOU SUCK', 550, 0.5, 'quartOut')
	
			pauseMenuActive = false
			runTimer('aint', 0.0001)
			end
		end
		
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and helpEnter == true then
		helpEnter = false
		runTimer('aint v2', 0.0001)
		setProperty('pauseMenuPrompt.alpha', 0)
		setProperty('pauseMenuCheckmark.alpha', 0)
		setProperty('pauseMenuOverlay2.alpha', 1)
		setProperty('pauseMenuResume.alpha', 1)
		setProperty('pauseMenuRetry.alpha', 1)
		setProperty('pauseMenuExit.alpha', 1)
		setProperty('pauseMenuMute.alpha', 1)
		setProperty('pauseMenuHelp.alpha', 1)
		setProperty('levels.alpha', 1)
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'resume' then
	restartSong()
	end
	
	if tag == 'aint' then
	helpEnter = true
	
	elseif tag == 'aint v2' then
	pauseMenuActive = true
	end
end