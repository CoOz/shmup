package;
//import haxe.io.BytesData.Unsigned_char__;
import haxe.Timer;
import org.flixel.FlxState;
import org.flixel.FlxTypedGroup.FlxTypedGroup;
import org.flixel.util.FlxRect;

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
import org.flixel.FlxText;
import org.flixel.FlxObject;
import org.flixel.util.FlxMath;
import flash.Lib;
import flash.events.KeyboardEvent;

/**
 * ...
 * @author Sylvain
 */
class  PlayState extends FlxState
{

	var skin:FlxSprite;
	var TabTouche:Array<Bool>;							// création d'un tableau qui va contenir la liste des boutons appuyer.
	var Fire:Array<Bool>;
	var ship:FlxSprite;									// création des variables de type FlxSprite
	var plasma:FlxSprite;
	var enemi:FlxSprite;
	
	var BoomM:FlxTypedGroup<FlxSprite>;
	var BoomF:FlxTypedGroup<FlxSprite>;
	
	var zoom:Int = 2;									// Choix de la taille des objets
	
	var missiles:FlxSprite;
	var missile_delai:UInt = 0;
	
	var plasmaM:FlxSprite;

	var mis_fire:FlxSprite;
	var fire_delai:UInt = 0;
	
	var ok:UInt = 0;
	
	var reset:Bool = false;
	var pause:Bool = false;
		
		override public function create():Void
		{
			
			TabTouche = [false, false, false, false];						//on initialise nos tableaux
			Fire = [false, false];
			
			BoomM = new FlxTypedGroup();
			BoomF = new FlxTypedGroup();
			
			enemi = new FlxSprite();
			skin = new FlxSprite();
			ship = new FlxSprite();
			plasma = new FlxSprite();
			plasmaM = new FlxSprite();
			missiles = new FlxSprite();
			mis_fire = new FlxSprite();
			
			skin.loadGraphic("assets/nyancat.png", false, false, 1800, 563, false, null);
			ship.loadGraphic("assets/ship.png", false, false, 16, 16, false, null);		// ship.png, pas d'animation, 16px par 16 px.
			plasma.loadGraphic("assets/plasma.png", true, false, 16, 16, false, null);	// plasma.png, avec animation, 16px par 16 px.
			enemi.loadGraphic("assets/enemi.png",false, false,41 ,52, false, null);
			
			ship.scale.x = ship.scale.y = plasma.scale.x = plasma.scale.y = enemi.scale.x = enemi.scale.y = zoom;
			
			ship.x = 30;
			plasma.y = ship.y = 20;
			plasma.x = ship.x - 30;
			
			enemi.x = (Math.random()* 680)+400;
			enemi.y = (Math.random()* 480);
			
			trace(enemi.x, enemi.y);
			
			ship.maxVelocity.x = ship.maxVelocity.y = plasma.maxVelocity.x = plasma.maxVelocity.y = 200;	// On règle la velocité maximal des objets sur x et sur y
			enemi.maxVelocity.x = enemi.maxVelocity.y = 100;

			plasma.addAnimation("reacteur", [0, 2, 4], 30, true);			// Ajout à 'objet plasma 'animation "réacteur" qui joue les frames 0,2,4 de plasma.png à 60 frames par seconde en boucle.
			plasma.play("reacteur"); 										// Jouer 'animation "réacteur"
			
			add(skin);
			add(ship);														// ajout de 'objet ship sur la fenêtre
			add(plasma);													// ajout de 'objet plasma sur la fenêtre
			add(enemi);
			
			enemi.health = 100;
			
			enemi.acceleration.x = Math.round(Math.random() + 1) * enemi.maxVelocity.x;
			enemi.acceleration.y = Math.round(Math.random() + 1) * enemi.maxVelocity.y;
			
			Lib.current.stage.addEventListener(flash.events.KeyboardEvent.KEY_DOWN,AppuiTouche);
			Lib.current.stage.addEventListener(flash.events.KeyboardEvent.KEY_UP, RelacheTouche);
			
			FlxG.mute = false;
			Musique(0);
			
			FlxG.camera.follow(ship);
			FlxG.camera.deadzone = new FlxRect(200, 100, 240, 280);
			
			super.create();
		}
		
	/*	static function delay(Musique:Void, time_ms:Int):Timer
		{
			
		}
	*/	
		function Musique(ok)
		{
			if (ok == 0)
				FlxG.play("assets/data/intro.mp3", 1, false, true, null);
			else FlxG.play("assets/data/beep2.mp3", 1, true, true, null);
		}
		
		function SupprBoom(Boom:FlxObject, enemi:FlxObject)
		{
		//	FlxG.camera.follow(enemi);
			Boom.kill();
			enemi.kill();
			enemi.hurt(50);
		}
		
		function AppuiTouche(e:KeyboardEvent)
		{
			
			if (e.keyCode == flash.ui.Keyboard.Z || e.keyCode == Keyboard.UP)		// si la touche appuyée est 'Z' ou la fléche haut
				TabTouche[0] = true;												// Mettre la première case du tableau "TabTouche" à vrai
			
			if (e.keyCode == flash.ui.Keyboard.D || e.keyCode == Keyboard.RIGHT)	// si la touche appuyée est 'D' ou la fléche droite
				TabTouche[1] = true;												// Mettre la deuxième case du tableau "TabTouche" à vrai
			
			if (e.keyCode == flash.ui.Keyboard.S || e.keyCode == Keyboard.DOWN)		// si la touche appuyée est 'S' ou la fléche bas
				TabTouche[2] = true;												// Mettre la troisième case du tableau "TabTouche" à vrai
			
			if (e.keyCode == flash.ui.Keyboard.Q || e.keyCode == Keyboard.LEFT)		// si la touche appuyée est 'Q' ou la fléche gauche
				TabTouche[3] = true;												// Mettre la quatrième case du tableau "TabTouche" à vrai
			
			if (e.keyCode == Keyboard.SPACE)								// si la touche appuyée est 'ESPACE'
				Fire[0] = true;												// Mettre la première case du tableau "Fire" à vrai
			
			if (e.keyCode == Keyboard.ENTER)								// si la touche appuyée est 'ENTREE'
				Fire[1] = true;												// Mettre la deuxieme case du tableau "Fire" à vrai
			
			if (e.keyCode == Keyboard.ESCAPE)								// si la touche "ECHAP" est appuyée
				reset = true;												// relancer le jeu
				
			if (e.keyCode == Keyboard.P)									// si la touvhe appuyée est 'P'
				{
					if (pause)
					{
						pause = false;										// retirer la pause
						FlxG.resumeSounds();								// lire la musique
					}
					else
					{
						pause = true;										// mettre en pause
						FlxG.pauseSounds();									// Mettre la musique sur pause
						FlxG.switchState(new PauseState(this));
					}
				}
		}
		
		function RelacheTouche(e:KeyboardEvent)
		{
			
			if (e.keyCode == flash.ui.Keyboard.Z || e.keyCode == Keyboard.UP)		// si la touche relachée est 'Z' ou la fléche haut
				TabTouche[0] = false;												// Mettre la première case du tableau "TabTouche" à faux
			
			if (e.keyCode == flash.ui.Keyboard.D || e.keyCode == Keyboard.RIGHT)	// si la touche relachée est 'D' ou la fléche droite
				TabTouche[1] = false;												// Mettre la deuxième case du tableau "TabTouche" à faux
			
			if (e.keyCode == flash.ui.Keyboard.S || e.keyCode == Keyboard.DOWN)		// si la touche relachée est 'S' ou la fléche bas
				TabTouche[2] = false;												// Mettre la troisième case du tableau "TabTouche" à faux
			
			if (e.keyCode == flash.ui.Keyboard.Q || e.keyCode == Keyboard.LEFT)		// si la touche relachée est 'Q' ou la fléche gauche
				TabTouche[3] = false;												// Mettre la quatrième case du tableau "TabTouche" à faux
			
			if (e.keyCode == Keyboard.SPACE)										// si la touche relachée est "ESPACE"
				Fire[0] = false;													// Mettre la première case du tableau "Fire" à faux
			
			if (e.keyCode == Keyboard.ENTER)										// si la touche relachée est "ENTREE"
				Fire[1] = false;													// Mettre la deuxième case du tableau "Fire" à faux
			
			if (e.keyCode == Keyboard.ESCAPE)										// si la touche relachée est "ECHAP"
				reset = false;														// arreter le reset
			
			if (e.keyCode == Keyboard.U)									// si la touche appuyée est 'U'
			{
				FlxG.volume += 0.05;										// augmenté le son
				FlxG.play("assets/data/beep.mp3", 1, false, true, null);
			}
			
			if (e.keyCode == Keyboard.L)									// si la touche appuyée est 'L'
			{
				FlxG.volume -= 0.05;										// diminué le son
				FlxG.play("assets/data/beep.mp3", 1, false, true, null);
			}
			
			if (e.keyCode == Keyboard.M)									// si la touche appuyée est ''
			{
				FlxG.mute = !FlxG.mute;										// coupé le son
				FlxG.play("assets/data/beep.mp3", 1, false, true, null);
			}
		}
		
		
		override public function destroy():Void
		{
			if (!pause)
				super.destroy();
		}
			
			override public function update():Void
		{
			ship.angle = 0;													// 'objet ship reprend un angle de 0 degré
			ship.frame = 0;
			ok++;
			
			if (ok == 59) Musique(ok);
			
			if (!pause)
				super.update();
				
			// JOUEUR
			
			if (ship.x < 200 + (ship.width + plasma.width))
			{
				ship.x = 200 + (ship.width + plasma.width);
				plasma.x = ship.x - 30;
			}
			
			if (ship.x > skin.width - 200 - (ship.width + plasma.width))
			{
				ship.x =skin.width - 200 - (ship.width + plasma.width);
				plasma.x = ship.x - 30;
			}
			
			if (ship.y < 100 + ship.height)
				plasma.y = ship.y = 100 + ship.height;
				
			if (ship.y > skin.height - 100 - ship.height)
				plasma.y = ship.y = skin.height - 100 - ship.height;
			
			if (fire_delai > 0 && !pause)
				fire_delai--;
			
			if (missile_delai > 0 && !pause)
				missile_delai--;
			
			if (TabTouche[1] && !pause)	//AVANCER										// si la seconde case du tableau est vrai ("RIGHT" ou "D")
			{
				ship.acceleration.x = plasma.acceleration.x = 2 * ship.maxVelocity.x;	// on donne une vitesse positive sur y à 'objet ship (avancer)
				ship.angle = 7;															// un angle de 5 degrès
				ship.frame = 1;															// et la frame 1
			}
			
			else if (!TabTouche[3] && !pause)
				ship.acceleration.x = plasma.acceleration.x = 4 * ship.velocity.x;		// sinon on réduit la vitesse sur x à zéro
			
			
			if (TabTouche[3] && !pause)	//RECULER										// si la quatrième case du tableau est vrai ("LEFT" ou "Q")
			{
				ship.acceleration.x = plasma.acceleration.x = -2 * ship.maxVelocity.x;	// on donne une vitesse négative sur x à 'ojet ship (reculer)
				ship.angle = -7;														// un angle de -10 degrès
				ship.frame = 2;															// et on met la frame 1
			}
			
			else if (!TabTouche[1] && !pause)
				ship.acceleration.x = plasma.acceleration.x = -4 * ship.velocity.x;			// sinon on réduit la vitesse sur x à 0
				
			if (TabTouche[0] && !pause)	//MONTER										// si la première case du tableau est vrai ("UP" ou "Z")
			{
				ship.acceleration.y = plasma.acceleration.y = -2 * ship.maxVelocity.y;	// on donne une vitesse négative sur y à 'objet ship (monter)
				ship.angle = -10;														// on donne un angle de -10
				ship.frame = 0;															// et on utilise la seconde frame
			}
			
			else if (!TabTouche[2] && !pause)
				ship.acceleration.y = plasma.acceleration.y = 4 * ship.velocity.y;		// sinon on réduit la vitesse sur y à zéro
			
			if (TabTouche[2] && !pause)	//DESCENDRE										// si la troisième case du tableau est vrai ("DOWN" ou "S")
			{
				ship.acceleration.y = plasma.acceleration.y = 2 * ship.maxVelocity.y;	// on donne une vitesse positive sur y à 'objet ship (descendre)
				ship.angle = 10;														// un angle de 10 degrès
				ship.frame = 0;															// on met la frame 0
			}
			
			else if (!TabTouche[0] && !pause)
				ship.acceleration.y = plasma.acceleration.y = -4 * ship.velocity.y;		// sinon on réduitt la vitesse sur y à 0
			
			if (Fire[0] && missile_delai == 0 && !pause)
			{
				FlxG.play("assets/data/fire.mp3", 1, false, true, null);	// Jouer un son
				missiles = new FlxSprite();
				missiles.loadGraphic("assets/missile.png", true, false, 16, 4);
				missiles.addAnimation("tourne", [0, 1, 2, 3], 15, true);
				missiles.scale.x = missiles.scale.y = zoom;
				missiles.y = ship.y + 20;
				missiles.x = ship.x - 10;
				missiles.acceleration.x = 300;					// on donne une vitesse positive sur x à 'objet missile (avancer)
				missiles.play("tourne");
				add(missiles);									// ajout de 'objet missile sur la fenêtre
				missile_delai = 15;
				BoomM.add(missiles);
			}
			
			if (Fire[1] && fire_delai == 0 && !pause)
			{
				FlxG.play("assets/data/Piou.mp3", .75, false, true, null);	// Jouer un son	
				mis_fire = new FlxSprite();
				mis_fire.loadGraphic("assets/mis_fire.png", true, false, 8, 8);
				mis_fire.addAnimation("avance", [0, 1, 2, 3, 4, 5], 15, true);
				mis_fire.scale.x = mis_fire.scale.y = zoom / 2;
				mis_fire.y = ship.y;
				mis_fire.x = ship.x + 5;
				mis_fire.acceleration.x = 250;					// on donne une vitesse positive sur x à 'objet missile (avancer)
				mis_fire.play("avance");
				add(mis_fire);									// ajout de l'objet mis_fire sur la fenêtre
				fire_delai = 10;
				BoomF.add(mis_fire);
			}
			
			//ORDI
			
			// Bloquer l'enemi sur l'aire de jeu ET déplacement de l'enemi
			
			if (enemi.x < 200 && enemi.y < 100)		// En haut à gauche
			{
				enemi.acceleration.x = Math.round(Math.random() + 1) * enemi.maxVelocity.x;
				enemi.acceleration.y = Math.round(Math.random() + 1) * enemi.maxVelocity.y;
			}
			
			if (enemi.x < 200 && enemi.y > 563 - 100)	// En bas à gauche
			{
				enemi.acceleration.x = Math.round(Math.random() + 1) * enemi.maxVelocity.x;
				enemi.acceleration.y = - Math.round(Math.random() + 1) * enemi.maxVelocity.y;
			}
			
			if (enemi.x > skin.width - 200 && enemi.y < 100)	// En haut à droite
			{
				enemi.acceleration.x = - Math.round(Math.random() + 1) * enemi.maxVelocity.x;
				enemi.acceleration.y = Math.round(Math.random() + 1) * enemi.maxVelocity.y;
			}
			
			if (enemi.x > skin.width - 200 && enemi.y > 563 - 100)	// En bas à droite
			{
				enemi.acceleration.x = - Math.round(Math.random() + 1) * enemi.maxVelocity.x;
				enemi.acceleration.y = - Math.round(Math.random() + 1) * enemi.maxVelocity.y;
			}
			
			if (enemi.x < 200)					// A gauche [Camera]
			{
				enemi.x = 200;
				enemi.acceleration.x = Math.round(Math.random() + 1) * enemi.maxVelocity.x;
			}
			
			if (enemi.x > skin.width - 200)		// A droite [largeur - camera]
			{
				enemi.x = skin.width - 200;
				enemi.acceleration.x = - Math.round(Math.random() + 1) * enemi.maxVelocity.x;
			}
			
			if (enemi.y < 100)				// En haut [camera]
			{
				enemi.y = 100;
				enemi.acceleration.y = Math.round(Math.random() + 1) * enemi.maxVelocity.y;
			}
			
			if (enemi.y > 563 - 100) 		// En bas [hauteur - camera]
			{
				enemi.y = 563 - 100;
				enemi.acceleration.y = - Math.round(Math.random() + 1) * enemi.maxVelocity.y;
			}
			
			//TOUCHER
			
			FlxG.collide(BoomM, enemi, SupprBoom);
			FlxG.collide(BoomF, enemi, SupprBoom);
		//	trace(Boom);
			
			//RECOMENCER
			
			if (reset)
				FlxG.resetState();
		}
}