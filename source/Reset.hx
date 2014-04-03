package;

import flash.display.Bitmap;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import openfl.Assets;
import flash.geom.Rectangle;
import flash.net.SharedObject;
import flixel.group.FlxGroup;
import flixel.addons.text.FlxBitmapFont;

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

class Reset extends FlxState
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
		FlxG.mouse.visible=true;												// Show the mouse (in case it hasn't been disabled)
		#end
		
		var menu_reset:FlxSprite = new FlxSprite();
		var reprendre:FlxButton = new FlxButton((640 - 80) / 2, (480 - 20) / 2, "OUI",oui);
		var recommencer:FlxButton = new FlxButton((640 - 80) / 2, (480 - 20) / 2 - 20, "NON", non);
		menu_reset.loadGraphic("assets/reset.png");
		
		add(menu_reset);
		//add(oui);
		//add(non);
	}
	
	function non()
	{
		FlxG.switchState(Jeu);
	}
	
	function oui()
	{
		FlxG.switchState(new MenuState());
	}
}