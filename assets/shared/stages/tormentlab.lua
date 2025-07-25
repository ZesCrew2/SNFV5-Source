function onCreate()
	-- background shit
	makeLuaSprite('tormentlab', 'tormentlab', -600, -100);
	setLuaSpriteScrollFactor('stagefront', 0.9, 0.9);

	addLuaSprite('tormentlab', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end