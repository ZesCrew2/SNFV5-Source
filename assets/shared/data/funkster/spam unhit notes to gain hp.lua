ghostTappingEnabled = true

function onCreate()
    for i = 0, (getProperty("unspawnNotes.length")-1) do
	setPropertyFromGroup("unspawnNotes", i, "hitHealth", "0")
	end
	
	makeLuaSprite('spamUnhitNotes', 'SPAMNOWNOWNOW', 0, 250);
	scaleObject('spamUnhitNotes', 0.8, 0.8)
	setObjectCamera('spamUnhitNotes', 'camHUD')
	screenCenter('spamUnhitNotes', 'X')
	addLuaSprite('spamUnhitNotes', false);
	setProperty('spamUnhitNotes.alpha', 0)
	
	makeLuaText('warningText', "Only when there's no notes left and on idle!", screenWidth, 0, getProperty('spamUnhitNotes.y')+150)
	setTextSize('warningText', 20, 20)
	setProperty('warningText.alpha', 0)
	addLuaText('warningText')
	setObjectCamera('warningText', 'camHUD')
end

function goodNoteHit(id, direction, noteType, isSustainNote)
ghostTappingEnabled = false
end

function onGhostTap() -- I could've sworn I saw this exact function before. But couldn't find it anywhere, so I did that! (- Herox/Arie Temps)
	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
    ghostTappingEnabled = true -- the note hit animation lua script though, come on.
    end
	
	if ghostTappingEnabled == true then
	setProperty('health', getProperty('health')+0.03)
	end
end

function onEvent(name, v1, v2)
	if name == '' then -- THE CHART EDITOR SHOWS THAT THIS EXACT EVENT NAME IS SELECTED BY DEFAULT WHEN YOU OPEN THE CHART EDITOR! (- Herox/Arie Temps)
		if v1 == 'show warning' then
			if v2 == 'true' then -- do you want to show this?
			doTweenAlpha('showed', 'spamUnhitNotes', 1, 0.5, 'linear')
			doTweenAlpha('showed2', 'warningText', 1, 0.5, 'linear')
			elseif v2 == 'false' then
			doTweenAlpha('showed', 'spamUnhitNotes', 0, 0.5, 'linear')
			doTweenAlpha('showed2', 'warningText', 0, 0.5, 'linear')
			end
		end
	end
end
