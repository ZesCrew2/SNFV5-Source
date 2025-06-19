composer = "Walikon" -- This goes for each song, you have to adjust the names.
charter = "Herox" -- This goes for each song, you have to adjust the names.
artist = "muganimate, ZesCrew2" -- This goes for each song, you have to adjust the names.
animator = "muganimate, ZesCrew2" -- This goes for each song, you have to adjust the names.
va = "muganimate, yungtron" -- This goes for each song, you have to adjust the names.
-- bpm = "127" -- Please make sure to change the bpms for each song, because I don't know how to get the chart bpms correctly. (way before Herox figured it out as I don't need that one)
---------------------------------------------------------------------------------------------
-- Okay so, I figured it out that in the source code about FunkinLua.hx, there IS a bpm selection automatically. So might as well make a custom one for SNF devs who want to do that instead!! :3 (- Herox, as of May 2nd, 2025)
isCustomBPMName = false
customBPMName = "yes, you can put the custom text here!"

function onCreate()
if songName == "Re-Rocked" then
makeLuaSprite('blackBars', 'plate', -1000, -150);
elseif songName == "Blasted Hedgehog" then
makeLuaSprite('blackBars', 'plate', -1000, -150);
elseif songName == "Dithering Dingbots" then
makeLuaSprite('blackBars', 'plate', -1000, -150);
elseif songName == "robotnik-ii" then
makeLuaSprite('blackBars', 'plate', -1000, -150);
else
makeLuaSprite('blackBars', 'plate', -1000, -25);
end
addLuaSprite('blackBars', false);
setProperty('blackBars.alpha', 0.8)
scaleObject('blackBars', 0.8, 0.8)
setObjectCamera('blackBars', 'camHUD');

	if songName == "Re-Rocked" then
	makeLuaText('songCredits', songName, 0, -1000, 100-25);
	
	elseif songName == "Blasted Hedgehog" then
	makeLuaText('songCredits', songName, 0, -1000, 100-25);
	
	elseif songName == "Dithering Dingbots" then
	makeLuaText('songCredits', songName, 0, -1000, 100-25);
	
	elseif songName == "robotnik-ii" then
	makeLuaText('songCredits', songName, 0, -1000, 100-25);
	
	else
	makeLuaText('songCredits', songName, 0, -1000, 225-25);
	end
setTextSize('songCredits', 50);
setTextAlignment('songCredits', 'left')
setTextWidth('songCredits', '1280')
addLuaText('songCredits');
setObjectCamera('songCredits', 'camHUD');

	if songName == "Re-Rocked" then
		if isCustomBPMName == false then
		makeLuaText('songCreditsRest', composer.." (Composer)\n"..charter.." (Charter)\nBPM: "..bpm, 0, -1000, 100+25);
		else
		makeLuaText('songCreditsRest', composer.." (Composer)\n"..charter.." (Charter)\nBPM: "..customBPMName, 0, -1000, 100+25);
		end
	
	elseif songName == "Blasted Hedgehog" then
		if isCustomBPMName == false then
		makeLuaText('songCreditsRest', composer.." (Composer)\n"..charter.." (Charter)\nBPM: "..bpm, 0, -1000, 100+25);
		else
		makeLuaText('songCreditsRest', composer.." (Composer)\n"..charter.." (Charter)\nBPM: "..customBPMName, 0, -1000, 100+25);
		end
	
	elseif songName == "Dithering Dingbots" then
		if isCustomBPMName == false then
		makeLuaText('songCreditsRest', composer.." (Composer)\n"..charter.." (Charter)\nBPM: "..bpm, 0, -1000, 100+25);
		else
		makeLuaText('songCreditsRest', composer.." (Composer)\n"..charter.." (Charter)\nBPM: "..customBPMName, 0, -1000, 100+25);
		end
	
	elseif songName == "robotnik-ii" then
		if isCustomBPMName == false then
		makeLuaText('songCreditsRest', composer.." (Composer)\n"..charter.." (Charter)\nBPM: "..bpm, 0, -1000, 100+50);
		else
		makeLuaText('songCreditsRest', composer.." (Composer)\n"..charter.." (Charter)\nBPM: "..customBPMName, 0, -1000, 100+25);
		end
	
	else
		if isCustomBPMName == false then
		makeLuaText('songCreditsRest', composer.." (Composer)\n"..charter.." (Charter, Events)\nBPM: "..bpm, 0, -1000, 255);
		else
		makeLuaText('songCreditsRest', composer.." (Composer)\n"..charter.." (Charter)\nBPM: "..customBPMName, 0, -1000, 255);
		end
	end
setTextSize('songCreditsRest', 30);
setTextAlignment('songCreditsRest', 'left')
setTextWidth('songCreditsRest', '1280')
addLuaText('songCreditsRest');
setObjectCamera('songCreditsRest', 'camHUD');

	if songName == "Re-Rocked" then
	makeLuaText('songCreditsRest2', artist.." (Artist)\n"..animator.." (Animator)\n"..va.." (VA)\nHerox (Card Info Coder)", 0, -1000, 100+200);
	setTextSize('songCreditsRest2', 30);
	
	elseif songName == "Blasted Hedgehog" then
	makeLuaText('songCreditsRest2', artist.." (Artist)\n"..animator.." (Animator)\n"..va.." (VA)\nHerox (Card Info Coder)", 0, -1000, 100+200);
	setTextSize('songCreditsRest2', 30);
	
	elseif songName == "Dithering Dingbots" then
	makeLuaText('songCreditsRest2', artist.." (Artist)\n"..animator.." (Animator)\n"..va.." (VA)\nHerox (Card Info Coder)", 0, -1000, 100+200);
	setTextSize('songCreditsRest2', 30);
		
	elseif songName == "robotnik-ii" then
	makeLuaText('songCreditsRest2', artist.." (Artist)\n"..animator.." (Animator)\n"..va.." (VA)\nHerox (Card Info Coder)", 0, -1000, 100+200);
	setTextSize('songCreditsRest2', 30);
	
	else
	makeLuaText('songCreditsRest2', artist.." (Artist)\n"..animator.." (Animator)\n"..va.." (VA)\nHerox (Card Info Coder)", 0, -1000, 255+175);
	setTextSize('songCreditsRest2', 25);
	end
setTextAlignment('songCreditsRest2', 'left')
setTextWidth('songCreditsRest2', '1280')
addLuaText('songCreditsRest2');
setObjectCamera('songCreditsRest2', 'camHUD');
end

function onSongStart()
	doTweenX("no way wow it's the credits itself!!", 'songCredits', 25, 1, 'sineInOut')
	doTweenX("no way wow it's the credits itself 0!!", 'songCreditsRest', 25, 1, 'sineInOut')
		if songName == "Re-Rocked" then
		doTweenX("no way wow it's the credits itself 1!!", 'songCreditsRest2', -25, 1, 'sineInOut')
		elseif songName == "Blasted Hedgehog" then
		doTweenX("no way wow it's the credits itself 1!!", 'songCreditsRest2', -25, 1, 'sineInOut')
		elseif songName == "Dithering Dingbots" then
		doTweenX("no way wow it's the credits itself 1!!", 'songCreditsRest2', -25, 1, 'sineInOut')
		elseif songName == "robotnik-ii" then
		doTweenX("no way wow it's the credits itself 1!!", 'songCreditsRest2', -25, 1, 'sineInOut')
		else
		doTweenX("no way wow it's the credits itself 1!!", 'songCreditsRest2', 25, 1, 'sineInOut')
		end
	doTweenX("no way wow it's the credits itself 2!!", 'blackBars', -50, 1, 'sineInOut')
	runTimer('bye credits', 6)
end

function onTimerCompleted(tag)
	if tag == 'bye credits' then
	doTweenX("no way wow it's the credits itself!!", 'songCredits', -1000, 1, 'quartIn')
	doTweenX("no way wow it's the credits itself 0!!", 'songCreditsRest', -1000, 1, 'quartIn')
	doTweenX("no way wow it's the credits itself 1!!", 'songCreditsRest2', -1000, 1, 'quartIn')
	doTweenX("no way wow it's the credits itself 2!!", 'blackBars', -1000, 1, 'quartIn')
	end
end
