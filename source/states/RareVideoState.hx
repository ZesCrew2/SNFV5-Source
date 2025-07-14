package states;

import flixel.util.typeLimit.OneOfTwo;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import openfl.Assets;
import haxe.xml.Access;
import hxvlc.flixel.FlxVideoSprite;

class RareVideoState extends MusicBeatState
{
	public var videoCutscene:FlxVideoSprite;
	var canSkip:Bool = false;
	var textShit:FlxText;
    var loadShit:String = "creds" + FlxG.random.int(1, 2, 3);
	override function create():Void
	{
		FlxG.mouse.visible = true;
		// fuck that mouse just move on load shit graphic :sob:
        startVideo(loadShit); // hai
		super.create();
	}

   	public function startVideo(name:String)
	{
		videoCutscene = new FlxVideoSprite(0, 0);
		add(videoCutscene);
		videoCutscene.load(Paths.video(name));
		videoCutscene.play();
		videoCutscene.alpha = 1;
		videoCutscene.visible = true;
		FlxG.sound.music.stop();
		videoCutscene.bitmap.onEndReached.add(function()
		{
				trace("Start Going 'CreditsState'");
				MusicBeatState.switchState(new states.CreditsState());
		});
	}
	
	override function update(elapsed:Float):Void
	{
		if(!canSkip){
			//nothing else
		}else{
			if(FlxG.keys.justPressed.ENTER){
				videoCutscene.pause();
				trace(":3");
				MusicBeatState.switchState(new states.CreditsState());
				}
				}
		super.update(elapsed);
	}
}