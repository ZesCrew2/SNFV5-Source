local allowCountdown = false
function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('credits')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end
