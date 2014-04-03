package;

import flash.display.Bitmap;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import openfl.Assets;
import flash.geom.Rectangle;
import flash.net.SharedObject;
import flixel.group.FlxGroup;

import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.util.FlxPath;
import flixel.util.FlxSave;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxObject;
import flixel.util.FlxMath;
import flash.Lib;
import flash.events.KeyboardEvent;

class PauseState extends FlxState
{
	var Jeu:PlayState;
	
	public function new(Jeu:PlayState)
	{
		this.Jeu = Jeu;
		super();
	}
	
	override public function create ():Void
	{
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();												// Show the mouse (in case it hasn't been disabled)
		#end
		
		var menu_pause:FlxSprite = new FlxSprite();
		var reprendre:FlxButton = new FlxButton((640 - 80) / 2, (480 - 20) / 2, "REPRENDRE", reprendre_jeu);
		var recommencer:FlxButton = new FlxButton((640 - 80) / 2, (480 - 20) / 2 - 20, "RECOMMENCER", recommencer_jeu);
		var option:FlxButton = new FlxButton(640 / 2, 480 / 2 - 50, "OPTION", option_jeu);
		menu_pause.loadGraphic("assets/space3.png");
		
		add(menu_pause);
		add(reprendre);
		add(recommencer);
	}
	
	function reprendre_jeu()
	{
		FlxG.switchState(Jeu);
	}
	
	function recommencer_jeu()
	{
		FlxG.switchState(new PlayState());
	}
	
	function option_jeu()
	{
		
	}
}