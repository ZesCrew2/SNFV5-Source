canPause = true

function onCreatePost()
    callOnHScript('create')
    callOnHScript('preload_video')
end


function onBeatHit()
    if curBeat == 352 then
        callOnHScript('create_video')
    end
end
function onPause()
    callOnHScript('pause')
end

function onResume()
    callOnHScript('resume')
end

function onGameOverStart()
    canPause = false
end

