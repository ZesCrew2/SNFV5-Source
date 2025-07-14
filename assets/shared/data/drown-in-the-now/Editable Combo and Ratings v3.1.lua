-- Settings (Player) --
    local visible = true  -- Show it?

    --local unholyStyle = https://gamebanana.com/tools/10174  please

    local show = { -- Set an item to false to hide it from view
        rating     = true, -- Rating that shows every note hit
        nums       = true, -- Combo that shows every note hit
        combo      = true, -- "Unused" combo sprite that shows every note hit
        missSprite = true, -- "Rating" that shows every note miss (and ghost miss)
        missNums   = true  -- "Combo" that will show a "000" on a combo break
    }

    local msTxt        = false     -- Show your hit milliseconds next to the rating
    local foreverCount = false     -- Shows combo one by one, like forever engine 
    local countMisses  = false     -- If show.missNums is true, then show the total misses each miss (Like Forever Engine)

    -- path to images, for both ratings and numbers | Will be used for all proceeding images
    local path = {
        ratings = '', -- starts in images/
        nums = ''
    }
    
    local ratingGrab = {'sickdint', 'gooddint', 'baddint', 'shitdint'} -- What it'll grab
    local numPrefix  = 'num'               
    local numSuffix  = ''

    local combType   = 'combo'        -- For swappin with pixel 'n such
    local missType   = 'missdint'

    local constantGameCam =  false    -- Keeps things hooked onto characters

    local ratingPos = {
        game   = {x = nil, y = nil},  -- camGame position
        cam    = {x = 450, y = 280},  -- HUD and Other position | DEFAULT: {450, 280}
        offset = {x = 405, y = 230}}  -- onPlayerCombo offsets

    local numPos = {
        game   = {x = nil, y = nil},
        cam    = {x = 400, y = 400},
        offset = {x = 360, y = 385}}

    local comboPos = {
        game   = {x = nil, y = nil},  -- will be dependant on the number and rating postion if left nil
        cam    = {x = nil, y = nil}, 
        offset = {x = 360, y = 390}}

    local scales = { -- DEFAULT: rating = 0.69, num = 0.5, combo = 0.58, miss = 0.69 | IF messed with, be sure to adjust it's spacing down below as they might overlap
        rating = 0.69, num = 0.5,   
        combo  = 0.58, miss = 0.69
    } 

    local onPlayerCombo = true  -- If tied to the HUD, It'll show on where the player has the ratings offsets

    local camSet = 'game'       -- Should it be on the Hud or Game or Other? hud | game | other  
    -- (NOTICE: for game cam, I have its default set to rely on bfs/opponents position)

    local add5thRating = false -- cosmetic-ish
    local customRating = {
        image = 'marvelous', -- DEFAULT: 'marvelous'
        color = 'ff00ff',    -- DEFAULT: 'ff00ff'
        score = 500,         -- DEFAULT: 500 | Points added on hit
        hitWindow = 22.5,    -- DEFAULT: 22.5 | Amount of time you have to hit in ms (Has to be less than the 'sick' window)
        total = 0            -- For counting total amount hit, don't touch
    }

-- Settings (Opponent) --
    local visibleOp = false   -- Show it?

    local foreverCountOp = false

    local showRatingOp = true -- not a table cuz fuck you!!!
    local showNumsOp   = true

    local pathOp  = {
        ratings = '',
        nums = ''
    }

    local ratingGrabOp = {'sick', 'good', 'bad', 'shit'}
    local numPrefixOp  = 'num'
    local numSuffixOp  = ''

    local ratingPosOp = {
        game   = {x = nil, y = nil}, 
        cam    = {x = 350, y = 440},   -- Default: 350, 440 | Positions it'll use
        offset = {x = 405, y = 230}}

    local numPosOp = {
        game   = {x = nil, y = nil}, 
        cam    = {x = 300, y = 535},   -- Default: 380, 535
        offset = {x = 360, y = 385}}
        
    local scalesOp = { -- DEFAULT: rating = 0.69, num = 0.5
        rating = 0.69, num = 0.5
    }

    local onPlayerComboOp = false

    local camSetOp = 'hud'  -- hud | game | other

    -- Chances for other ratings to appear | Set to 0 to disable
    local ratingChance = {['good'] = 0, ['bad'] = 0, ['shit'] = 0}  

local MODES = {
    PLAYER = {
        stacking       = true, -- Only 1 set of numbers and ratings are shown at a time | Helps prevent lag

        stationary     = false, -- Prevent the Rating hop | recommended with no stacking

        colorRatings   = false, -- Color the ratings based on which you get, Sick is blue, good is green, etc | NEEDS TO BE ON FOR THESE OTHER RATING COLOR SETTINGS TO WORK
        colorSyncing   = false, -- Rating takes color of direction pressed | Overwrites colorRatings and fcColorRating
        fcColorRating  = false, -- Colors Ratings based of FC level, like andromeda!!!
        colorFade      = false, -- Fades color back to normal

        colorNumbers   = false, -- Same as above, but for numbers
        colorSyncNums  = false,
        fcColorNums    = false,
        colorFadeNums  = false,

        comboColor      = false,
        comboColorFade  = false,

        randomColor    = false, -- Randomized 'sick' color | Only 'colorRatings' or 'colorNumbers' should be on
        COLORSWAP_rate = false, -- Colorswap your sick ratin (and combo sprite) | 6.1 and above
        COLORSWAP_num  = false  -- Colorswap your combo nums | 6.1 and above
    },
    OPPONENT = {
        stacking       = false,

        stationary     = false, 

        colorRatings   = false,  -- Colors based on which rating you get
        colorSyncing   = false,  -- Rating takes color of direction pressed 
        colorFade      = false,  -- Fade back to normal

        colorNumbers   = false, -- Same as above, but for numbers
        colorSyncNums  = false,
        colorFadeNums  = false
    }
}

-- Colors --
    local ratingColors   = {'68fafc', '48f048', 'fffecb', 'ffffff'} 
    local colorSync      = {'c24b99', '68fafc', '12fa05', 'f9393f'} 

    -- Opponent --
    local ratingColorsOp = {'68fafc', '48f048', 'fffecb', 'ffffff'}
    local colorSyncOp    = {'c24b99', '68fafc', '12fa05', 'f9393f'} 

    -- Pixel -- | These will replace the normal ones on pixel stages
    local pixelColors    = {'3dcaff', '71e300'} -- only 2, but you can add up to 4
    local pixelColorSync = {'e276ff', '3dcaff', '71e300', 'ff884e'}

-- Random vars you don't really need to touch
    local pixel = false          -- Pixel check | Set to true for pixel ratings everywhere
    local eh = 0                 -- Make the sprites load in the way it does
    local isCFC = true           -- Is custom FC (for fifth rating)
    ---
    local pixelOp = false
    local fakeCombo, ehOp = 0, 0
    --
    local brokeCombo = nil
    local mainOffset = {}
    local isEarly = ''
    -- For the combo sprite
    local wasNil = false
    local isThousand = false
    local totNums = 0
    local initCombOff = 0

-- Dumb Quotes --
    -- you angered him. | Swords 8/24/2022
    -- Everyone makes bad scripts | Unholy 1/10/2023 | Shaggy 1/10/2023

    -- 💣 | Mark_Zer0 1/10/23
    -- 🥚 | Maru 1/10/23
    -- 🏺 | Betopia 1/10/23
    -- yes. | Gank 1/10/23
    -- no 😠 | Canndiez 1/10/23
    -- I definetly didnt already ask to add my quote to be put here | Definetly Not Shaggy believe me (this is a joke)
    -- toilet waters yummy in my tummy | stupid guy 1/10/23
    -- i pissed my ass 😭 | Saltyboii 1/10/23
    -- Look a stupid kid! That's me btw. | Rodney 1/10/23
    -- bombastic side eye, criminal offensive side eye | me | Cherry 3/1/23
    -- im going to jail | plank 3/1/23
    -- im in insanity | raltyro 3/1/23
    -- 🪀 yo yo. | Tiny Games 3/1/23
    -- Hi guys I'm sanster but without the music part | popcat 3/1/23
    -- i'm a definition of a heart candy to her ❤️ | 🇵🇷TPRS🇵🇷 3/1/23

--------------------------------------------------------------------------|The Code Shit|---------------------------------------------------------------------------------------------
-----------------------------------------------------------------------|By Unholywanderer04|------------------------------------------------------------------------------------------

function onCreatePost()
    mainOffset = getPropertyFromClass('backend.ClientPrefs', 'data.comboOffset') -- rating offsets 
    -- ( [1] Rating X | [2] Rating Y | [3] Number X | [4] Number Y ) 

    makeLuaText('msTxt', '', 200, 0, 0)
    addLuaText('msTxt')
    setTextAlignment('msTxt', 'center')
    setTextFont('msTxt', 'font.ttf')

    pixel   = pixel and true or getPropertyFromClass('states.PlayState', 'isPixelStage') -- if it's already true, then use that
    pixelOp = pixelOp and true or getPropertyFromClass('states.PlayState', 'isPixelStage')
    wasNil  = comboPos.cam.x == nil

    local bfDefault = { -- default camGame rating position IF left nil
        x = getMidpointX('boyfriend') - (getProperty('boyfriend.width') / 2) - 120, 
        y = ((getMidpointY('boyfriend') - (getProperty('boyfriend.height') / 1.7)) / (pixel and 1.5 or 1))
    }
    local dadDefault = {
        x = getMidpointX('dad') + (getProperty('dad.width') / (2 * (pixelOp and -5 or 1))),
        y = getMidpointY('dad') - (getProperty('dad.height') / (pixelOp and 2 or 4))
    }

    -- Pixel shit --
    if pixel then 
        path.ratings = 'pixelUI/'
        path.nums = 'pixelUI/'

        for i = 1, #ratingGrab do
            ratingGrab[i] = ratingGrab[i]..'-pixel' end
        
        customRating.image = customRating.image..'-pixel'
        scales.rating = 5

        numSuffix = '-pixel'
        scales.num = 5.5

        comboPos.offset.x = 480

        combType = 'combo-pixel'
        missType = 'miss-pixel'
        scales.combo = 4
        
        colorSync = pixelColorSync

        for i = 1, #pixelColors do
            ratingColors[math.min(i, 4)] = pixelColors[math.min(i, 4)]
        end
    end
    
    if pixelOp then
        pathOp.ratings = 'pixelUI/'
        pathOp.nums = 'pixelUI/'

        for i = 1, #ratingGrabOp do
            ratingGrabOp[i] = ratingGrabOp[i]..'-pixel' end      
            
        scalesOp.rating = 5

        numSuffixOp = '-pixel'
        scalesOp.num = 5.5
        
        colorSyncOp = pixelColorSync

        for i = 1, #pixelColors do
            ratingColorsOp[math.min(i, 4)] = pixelColors[math.min(i, 4)]
        end
    end

    for thing, lePath in pairs(path) do
        if lePath:sub(1, 7) == 'images/' then
            debugPrint(thing.." = \""..lePath.."\" path already starts in \"images/\"")  -- just a lil warning
        end
    end

    -- PLAYER nil checks!!!! --
    ratingPos.game.x = (ratingPos.game.x or bfDefault.x)
    ratingPos.game.y = (ratingPos.game.y or bfDefault.y)
         
    numPos.game.x = (numPos.game.x or ratingPos.game.x - 40)
    numPos.game.y = (numPos.game.y or ratingPos.game.y + 100)

    comboPos.cam.x = (comboPos.cam.x or numPos.cam.x + 110)
    comboPos.cam.y = (comboPos.cam.y or numPos.cam.y)
    
    comboPos.game.x = (comboPos.game.x or numPos.game.x + 110)
    comboPos.game.y = (comboPos.game.y or numPos.game.y)
    
    -- DAD nil checks!!!! --
    ratingPosOp.game.x = (ratingPosOp.game.x or dadDefault.x)
    ratingPosOp.game.y = (ratingPosOp.game.y or dadDefault.y)
     
    numPosOp.game.x = (numPosOp.game.x or ratingPosOp.game.x - 40)
    numPosOp.game.y = (numPosOp.game.y or ratingPosOp.game.y + 100)        

    initCombOff = comboPos.offset.x
    customFC = customRating.image:upper():sub(1, 1)..'FC'
    createInstance('colorSw', 'shaders.ColorSwap') -- runHaxeCode is funky so we'll just do this
    runHaxeCode([[
        function setShader(spr){        
            var daObj = game.variables.get('colorSw');
        
            spr = game.modchartSprites.get(spr);
            spr.shader = daObj.shader;
        }
    ]])
end

function onUpdatePost(e)
    if not inGameOver then 
        setProperty('showRating', not visible)
        setProperty('showComboNum', not visible)

        eh = (MODES.PLAYER.stacking and getProperty('combo') + misses or 0)
        isThousand = getProperty('combo') >= 999
        setProperty('msTxt.visible', msTxt)

        if constantGameCam then
            if camSet == 'game' and visible then -- no point in doing it if not on game cam
                bf1 = getMidpointX('boyfriend') - (getProperty('boyfriend.width') / 2) - 120
                bf2 = ((getMidpointY('boyfriend') - (getProperty('boyfriend.height') / 1.7)) / (pixel and 1.5 or 1))

                ratingPos.game  = {x = bf1, y = bf2}
                numPos.game     = {x = bf1 - 40, y = bf2 + 100}
                comboPos.game.y = bf2 + 100 -- the x doesnt matter right here
            end

            if camSetOp == 'game' and visibleOp then
                dad1 = getMidpointX('dad') + (getProperty('dad.width') / (2 * (pixelOp and -5 or 1))) -- pico is a motherfucker
                dad2 = getMidpointY('dad') - (getProperty('dad.height') / (pixelOp and 2 or 4))

                ratingPosOp.game = {x = dad1, y = dad2}
                numPosOp.game    = {x = ratingPosOp.game.x - 40, y = ratingPosOp.game.y + 100}
            end
        end

        -- For the combo sprite
        if show.combo then
            totNums = (show.nums and #splitNums(getProperty('combo') + 1, foreverCount) or 3) -- the '+ 1' is just so it's not delayed
            if constantGameCam then comboPos.game.x = numPos.game.x + (40 * totNums) end
            if wasNil then comboPos.cam.x = numPos.cam.x + (40 * totNums) end
            comboPos.offset.x = initCombOff + (40 * totNums)
        end
    
        if msTxt then
            setProperty('msTxt.scrollFactor.x', camSet == 'game' and 1 or 0)
            setProperty('msTxt.scrollFactor.y', camSet == 'game' and 1 or 0)
        end

        if MODES.PLAYER.randomColor then
            ratingColors[1] = rgb_to_hex({getRandomInt(1, 255), getRandomInt(1, 255), getRandomInt(1, 255)})
        end

        if MODES.PLAYER.COLORSWAP_rate or MODES.PLAYER.COLORSWAP_num then
            if getProperty('colorSw.hue') > 0 then add('hue', -(e * playbackRate)) end
            if getProperty('colorSw.saturation') > 0 then add('saturation', -(e * playbackRate)) end
        end
    end
end

function goodNoteHit(id, d, t, isSustainNote)
    if visible then
        if not isSustainNote then
            brokeCombo = false
            
            local swapActive = (MODES.PLAYER.COLORSWAP_rate or MODES.PLAYER.COLORSWAP_num)
            local strumTime = getPropertyFromGroup('notes', id, 'strumTime')
            isEarly = strumTime < getSongPosition() and '' or '-'

            -- nah bro this getRating shit has been rewritten like twice it aint from the whitty mod no more
            local curRating = getRating((strumTime - getSongPosition() + getPropertyFromClass('backend.ClientPrefs', 'data.ratingOffset')) / playbackRate, true)

            local ratingNumbers = {['sick'] = 1, ['good'] = 2, ['bad'] = 3, ['shit'] = 4, [customRating.image] = 5}
            local ratiNum = ratingNumbers[curRating]
            local canSwap = swapActive and (ratiNum == 1 or ratiNum == 5) -- color swap only the 'sick' and 'custom' rating

            useColor = (ratiNum < 5 and ratingColors[ratiNum] or customRating.color)
            setTextColor('msTxt', useColor)

            -- so colors can get set based on rating, THEN remove it
            if not show.rating then curRating, ratiNum = nil, nil end
            checkCFC()

            local fcs = {['SFC'] = 1, ['GFC'] = 2, ['FC'] = 3}
            local fcColor = 'ffffff'
            if ratingFC:find('FC') then
                fcColor = (isCFC and customRating.color or ratingColors[fcs[ratingFC]])
            end

            ratingUse, numUse, comboUse = 'ffffff', 'ffffff', 'ffffff'

            if MODES.PLAYER.colorRatings then
                ratingUse = useColor
                if MODES.PLAYER.colorSyncing then ratingUse = (curRating ~= 'shit' and colorSync[d+1]) end
                if MODES.PLAYER.fcColorRating then ratingUse = fcColor end
            end
            comboUse = (MODES.PLAYER.comboColor and ratingUse)

            if MODES.PLAYER.colorNumbers then 
                numUse = useColor
                if MODES.PLAYER.colorSyncNums then numUse = colorSync[d+1] end
                if MODES.PLAYER.fcColorNums then numUse = fcColor end
            end

            if swapActive then
                add('hue', (d + 1))
                add('saturation', 0.3)
            end

            setTextSize('msTxt', (camSet == 'game' and 25 or 20))
            setObjectCamera('msTxt', camSet)    

            -------------------------------Ratings---------------------------------------            

            -- This grabs the default Rating images in either assets/shared/images or mods/images depending on if you're using a mod AND if there are Rating images in there.
            -- I recommend making a folder for ratings if you do some wacky things, specifially for ease of access.
            
            local x, y = getXandY(ratingPos, true, true)
            if msTxt then setProperty('msTxt.x', x + 100) setProperty('msTxt.y', y + 70) end
           
            if ratiNum ~= nil then
                local ratingSpr = 'rating'..eh
                local ratingImage = path.ratings..(ratiNum < 5 and ratingGrab[ratiNum] or customRating.image)

                makeSprite({ratingSpr, ratingImage, x, y, camSet}, not pixel, ratingUse)
                scaleObject(ratingSpr, scales.rating, scales.rating)

                if not MODES.PLAYER.stationary then
                    setProperty(ratingSpr..'.acceleration.y', 550 * playbackRate * playbackRate)
                    setVelocity(ratingSpr, getRandomInt(0, 10), getRandomInt(140, 175), true)
                end

                startTween(ratingSpr..'Fade', ratingSpr, {alpha = 0}, 0.2 / playbackRate, {startDelay = (crochet * 0.001) / playbackRate, onComplete = 'itemFade'})

                if canSwap then runHaxeFunction('setShader', {ratingSpr}) end

                if MODES.PLAYER.colorFade then
                    doTweenColor('colorBack'..ratingSpr, ratingSpr, 'ffffff', (0.2 + (crochet * 0.0005)) / playbackRate, 'quartIn')
                end
            end

            if show.combo then
                local comboSpr = 'comboThing'..eh
                local comboImage = path.ratings..combType
                local x, y = getXandY(comboPos, false, true)

                makeSprite({comboSpr, comboImage, x, y, camSet}, not pixel, comboUse)
                scaleObject(comboSpr, scales.combo, scales.combo)

                if not MODES.PLAYER.stationary then
                    setProperty(comboSpr..'.acceleration.y', getRandomInt(400, 600) * playbackRate * playbackRate)
                    setVelocity(comboSpr, -getRandomInt(0,10), getRandomInt(160, 180), true)
                end

                startTween(comboSpr..'Fade', comboSpr, {alpha = 0}, 0.2 / playbackRate, {startDelay = (crochet * 0.0012) / playbackRate, onComplete = 'itemFade'})

                if canSwap then runHaxeFunction('setShader', {comboSpr}) end

                if MODES.PLAYER.comboColorFade then
                    doTweenColor('colorBack'..comboSpr, comboSpr, 'ffffff', (0.2 + (crochet * 0.0008)) / playbackRate, 'quartIn')
                end
            end

            if msTxt then
                if luaSpriteExists('rating'..eh) or luaSpriteExists('comboThing'..eh) then
                    setObjectOrder('msTxt', getObjectOrder(show.combo and 'comboThing'..eh or 'rating'..eh) * 2)
                end
            end

            --------------------------------Numbers----------------------------------------

            if show.nums then
                local loops = 0
                for _,number in pairs(splitNums(getProperty('combo'), foreverCount)) do 
                    local multBy = (43 * loops) -- spacing and spawning

                    local sequence = numPrefix..number..numSuffix  
                    local numSpr = 'num'..eh..loops
                    local numImage = path.nums..sequence
                    local x, y = getXandY(numPos, false, true) 

                    loops = loops + 1
                    
                    makeSprite({numSpr, numImage, x + multBy, y, camSet}, not pixel, numUse)
                    scaleObject(numSpr, scales.num, scales.num)

                    if not MODES.PLAYER.stationary then
                        setProperty(numSpr..'.acceleration.y', getRandomInt(200, 400) * playbackRate * playbackRate)
                        setVelocity(numSpr, getRandomInt(-5, 5), getRandomInt(140, 160), false)
                    end

                    startTween(numSpr..'Fade', numSpr, {alpha = 0}, 0.2 / playbackRate, {startDelay = (crochet * 0.002) / playbackRate, onComplete = 'itemFade'})
            
                    if MODES.PLAYER.COLORSWAP_num then runHaxeFunction('setShader', {numSpr}) end

                    if MODES.PLAYER.colorFadeNums then
                        doTweenColor('colorBack'..numSpr, numSpr, 'ffffff', (0.2 + (crochet * 0.0015)) / playbackRate, 'quartIn')
                    end
                end
            end
        end
    end
end

function noteMiss()
    checkCFC()
    if show.missSprite then
        local missSpr = MODES.PLAYER.stacking and 'missRating'..eh or 'rating0'
        local missImage = path.ratings..missType
        local x, y = getXandY(ratingPos, true, true) 
        
        makeSprite({missSpr, missImage, x, y, camSet}, not pixel, 'ffffff')
        scaleObject(missSpr, scales.miss, scales.miss)

        if not MODES.PLAYER.stationary then
            setProperty(missSpr..'.acceleration.y', 650 * playbackRate * playbackRate)
            setVelocity(missSpr, getRandomInt(0, 10), 100, true)
        end

        startTween(missSpr..'Fade', missSpr, {alpha = 0}, 0.2 / playbackRate, {startDelay = (crochet * 0.001) / playbackRate, onComplete = 'itemFade'})
    end

    if show.missNums then
        local missCount = (countMisses and splitNums(misses, foreverCount) or {0, 0, 0})

        if countMisses then
            table.insert(missCount, 1, 'minus') -- always at the start for consistency
        end
        
        local loops = (countMisses and -1 or 0)
        for _,number in pairs(missCount) do
            local multBy = (43 * loops) -- spacing and spawning

            local isMinus = (countMisses and type(number) ~= 'number')

            local sequence = (isMinus and '' or numPrefix)..number..numSuffix
            local missNum = 'MISSnum'..eh..loops
            local numImage = path.nums..sequence
            loops = loops + 1

            if not brokeCombo or countMisses then
                brokeCombo = true
                local x, y = getXandY(numPos, false, true) 
                
                makeSprite({missNum, numImage, x + multBy, y, camSet}, not pixel, 'bc0000')
                scaleObject(missNum, scales.num, scales.num)

                if not MODES.PLAYER.stationary then
                    setProperty(missNum..'.acceleration.y', 300 * playbackRate * playbackRate)
                    setVelocity(missNum, 0, 100, false)
                end
                startTween(missNum..'Fade', missNum, {alpha = 0}, 0.2 / playbackRate, {startDelay = (crochet * 0.002) / playbackRate, onComplete = 'itemFade'})
            end
        end
    end
end
noteMissPress = noteMiss

---------------------------- Daddy Dearest <3 (Opponent) ---------------------------------

function opponentNoteHit(id, d, t, isSustainNote) 
    if visibleOp then
        if not isSustainNote then

            ehOp = ehOp + 1 -- makes it look right
            if not MODES.OPPONENT.stacking then ehOp = 0 end

            local curRatingOp = getRating(0, false) -- techically there's no need for that strumtime shit, you can use it if you want to though
            
            local ratingNumbers = {['sick'] = 1, ['good'] = 2, ['bad'] = 3, ['shit'] = 4}
            local ratiNumOp = ratingNumbers[curRatingOp]

            if not showRatingOp then curRatingOp = '' ratiNumOp = nil end
            
            ratingCol = ratingColorsOp[(ratiNumOp or 4)]
        
            ratingUseOp, numUseOp = 'ffffff', 'ffffff'

            if MODES.OPPONENT.colorRatings then
                if MODES.OPPONENT.colorSyncing then
                    ratingUseOp = (curRatingOp ~= 'shit' and colorSyncOp[d+1])
                else ratingUseOp = ratingCol end
            end

            if MODES.OPPONENT.colorNumbers then 
                if MODES.OPPONENT.colorSyncNums then 
                    numUseOp = colorSyncOp[d+1]
                else numUseOp = ratingCol end
            end
            -------------------------------Ratings---------------------------------------
            
            if ratiNumOp ~= nil then
                local ratingSpr = 'ratingOp'..ehOp
                local ratingImage = pathOp.ratings..ratingGrabOp[ratiNumOp]
                local x, y = getXandY(ratingPosOp, true, false)

                makeSprite({ratingSpr, ratingImage, x, y, camSetOp}, not pixelOp, ratingUseOp)
                scaleObject(ratingSpr, scalesOp.rating, scalesOp.rating)

                if not MODES.OPPONENT.stationary then
                    setProperty(ratingSpr..'.acceleration.y', 550 * playbackRate * playbackRate)
                    setVelocity(ratingSpr, getRandomInt(0, 10), getRandomInt(140, 175), true)
                end

                startTween(ratingSpr..'Fade', ratingSpr, {alpha = 0}, 0.2 / playbackRate, {startDelay = (crochet * 0.001) / playbackRate, onComplete = 'itemFade'})
            
                if MODES.OPPONENT.colorFade then
                    doTweenColor('opColorBack'..ratingSpr, ratingSpr, 'ffffff', (0.2 + (crochet * 0.0005)) / playbackRate, 'quartIn')
                end     
            end
            --------------------------------Numbers----------------------------------------
            fakeCombo = math.min(fakeCombo + 1, 9999)

            if showNumsOp then  
                local loops = 0                  
                for _, number in pairs(splitNums(fakeCombo, foreverCountOp)) do
                    local multBy = (43 * loops)

                    local sequence = numPrefixOp..number..numSuffixOp
                    local numSpr = 'numOp'..ehOp..loops
                    local numImage = pathOp.nums..sequence
                    local x, y = getXandY(numPosOp, false, false)

                    loops = loops + 1

                    makeSprite({numSpr, numImage, x + multBy, y, camSetOp}, not pixelOp, numUseOp)
                    scaleObject(numSpr, scalesOp.num, scalesOp.num)

                    if not MODES.OPPONENT.stationary then
                        setProperty(numSpr..'.acceleration.y', getRandomInt(200, 400) * playbackRate * playbackRate)
                        setVelocity(numSpr, getRandomInt(-5, 5), getRandomInt(140, 160), false)
                    end

                    startTween(numSpr..'Fade', numSpr, {alpha = 0}, 0.2 / playbackRate, {startDelay = (crochet * 0.002) / playbackRate, onComplete = 'itemFade'})

                    if MODES.OPPONENT.colorFadeNums then
                        doTweenColor('oppColorBack'..numSpr, numSpr, 'ffffff', (0.2 + (crochet * 0.001)) / playbackRate, 'quartIn')
                    end
                end
            end
        end
    end
end

function getRating(diff, isPlayer) -- fused them, cuz they basically did the same thing
    if not isPlayer then
        for rating, chance in pairs(ratingChance) do
            if getRandomBool(chance) then return rating end 
        end
        return 'sick'
    end

	diff = math.abs(diff)

    if msTxt then
        setTextString('msTxt', isEarly..round(diff, 2)..' ms')
        cancelTween('out')
        setProperty('msTxt.alpha', 1)
        doTweenAlpha('out', 'msTxt', 0, (crochet/1000) / playbackRate, 'quartIn')
    end

    local ratings = {'sick', 'good', 'bad'} -- fuck, it wasnt 100% accurate grah so we'll just make it more like base psych
    local windows = {getProperty('ratingsData[0].hitWindow'), getProperty('ratingsData[1].hitWindow'), getProperty('ratingsData[2].hitWindow')}
    
    if add5thRating then 
        table.insert(ratings, 1, customRating.image)
        table.insert(windows, 1, customRating.hitWindow)
    end

    for i = 1, #ratings do
        if diff <= windows[i] then
            if ratings[i] == customRating.image then 
                customRating.total = customRating.total + 1
                addScore((botPlay and 0 or math.abs(customRating.score - 350))) -- hitting a 'sick' already adds 350
                setOnScripts('customHits', customRating.total) -- meh why not i guess
            end
            return ratings[i]
        end
    end
    return 'shit' -- for shits (and giggles)
end

-- sprData = {tag, image, x, y, cam}
function makeSprite(sprData, anti, color)
    local tag = sprData[1]
    makeLuaSprite(tag, sprData[2], sprData[3], sprData[4])
    setProperty(tag..'.color', tonumber(color, 16))
    setProperty(tag..'.antialiasing', anti)
    setObjectCamera(tag, sprData[5])
    if sprData[5]:find('hud') then 
        setObjectOrder(tag, getObjectOrder('strumLineNotes')-1)
    else addLuaSprite(tag, true) end
end

function checkCFC()
    if not add5thRating or not isCFC or ratingName == '?' then return end
    local daTxt = 'Score: '..score..' | Misses: '..misses..' | Rating: '..ratingName..' ('..round(rating * 100, 2)..'%) - '

    isCFC = (ratingFC == 'SFC' and customRating.total == getProperty('ratingsData[0].hits'))
    daTxt = daTxt..(isCFC and customFC or ratingFC) -- its like this so if you mess up a CFC, it will update the text to the normal ratingFC
    setTextString('scoreTxt', daTxt)
end

function rgb_to_hex(rgb) return string.format('%x', (rgb[1] * 0x10000) + (rgb[2] * 0x100) + rgb[3]) end

function add(field, amount) setProperty('colorSw.'..field, getProperty('colorSw.'..field) + amount) end -- only for da shader

function itemFade(tag) removeLuaSprite(tag:gsub('Fade', ''), true) end

function setVelocity(thing, x, y, isRating)
    setProperty(thing..'.velocity.x', (isRating and (getProperty(thing..'.velocity.x') - x) or x) * playbackRate)
    setProperty(thing..'.velocity.y', (getProperty(thing..'.velocity.y') - y) * playbackRate)
end

function round(num, decimals)
    local mult = 10^(decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

function getXandY(positionTable, isRating, isPlayer)
    local off1, off2 = (isRating and 1 or 3), (isRating and 2 or 4)
    local toGrab = isPlayer and {onPlayerCombo, camSet} or {onPlayerComboOp, camSetOp}
    
    if toGrab[1] and toGrab[2] == 'hud' then
        return positionTable.offset.x + mainOffset[off1], positionTable.offset.y - mainOffset[off2]
    elseif toGrab[2] == 'game' then 
        return positionTable.game.x, positionTable.game.y
    end
    return positionTable.cam.x, positionTable.cam.y
end

function splitNums(number, forev)
    local split, len = {}, tostring(number):len()

    for i = 0, math.max(len - 1, 2) do
        if (forev and len > i) or not forev then
            table.insert(split, 1, math.floor(number / 10 ^ i % 10)) -- stole the math from pantszoo
        end
    end

    return split
end