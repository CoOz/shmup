package;

import flash.display.Bitmap;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import openfl.Assets;
import flash.geom.Rectangle;
import flash.net.SharedObject;
import org.flixel.FlxGroup;
import org.flixel.plugin.photonstorm.FlxBitmapFont;

import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxObject;
import org.flixel.util.FlxMath;
import flash.Lib;
import flash.events.KeyboardEvent;

class MenuState extends FlxState
{
	
	override public function create ():Void
	{
		#if !FLX_NO_MOUSE
		FlxG.mouse.show();												// Show the mouse (in case it hasn't been disabled)
		#end
		
		var menu_fond:FlxSprite = new FlxSprite();
		var Jouer:FlxButton = new FlxButton((640 - 80) / 2, (480 - 20) / 2, "Jouer", Click_Gauche);
		
		menu_fond.loadGraphic("assets/fond.png");
		add(menu_fond);
		add(Jouer);
	}
	function Click_Gauche()
		{
			FlxG.switchState(new PlayState());
		}
	
}