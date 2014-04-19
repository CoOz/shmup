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

class MenuState extends FlxState
{
	
	override public function create ():Void
	{
		#if !FLX_NO_MOUSE
		FlxG.mouse.visible=true;												// Show the mouse (in case it hasn't been disabled)
		#end
		
		var menu_fond:FlxSprite = new FlxSprite();
		var Jouer:FlxButton = new FlxButton((640 - 80) / 2, 480 / 2, "JOUER", Click_Gauche);
		var option:FlxButton = new FlxButton((640 - 80) / 2, 480 / 2 + 50, "OPTION", option_jeu);
		
		menu_fond.loadGraphic("assets/fond.png");
		add(menu_fond);
		add(Jouer);
		add(option);
	}
	function Click_Gauche()
		{
			FlxG.switchState(new PlayState());
		}
		
	function option_jeu()
	{
		
	}
}
