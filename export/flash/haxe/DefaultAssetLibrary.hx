package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("Beep", __ASSET__assets_data_beep_mp3);
		type.set ("Beep", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/data/autotiles.png", __ASSET__assets_data_autotiles_png);
		type.set ("assets/data/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/autotiles_alt.png", __ASSET__assets_data_autotiles_alt_png);
		type.set ("assets/data/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/base.png", __ASSET__assets_data_base_png);
		type.set ("assets/data/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/beep.mp3", __ASSET__assets_data_beep_mp4);
		type.set ("assets/data/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/data/beep2.mp3", __ASSET__assets_data_beep2_mp3);
		type.set ("assets/data/beep2.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/data/button.png", __ASSET__assets_data_button_png);
		type.set ("assets/data/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_a.png", __ASSET__assets_data_button_a_png);
		type.set ("assets/data/button_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_b.png", __ASSET__assets_data_button_b_png);
		type.set ("assets/data/button_b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_c.png", __ASSET__assets_data_button_c_png);
		type.set ("assets/data/button_c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_down.png", __ASSET__assets_data_button_down_png);
		type.set ("assets/data/button_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_left.png", __ASSET__assets_data_button_left_png);
		type.set ("assets/data/button_left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_right.png", __ASSET__assets_data_button_right_png);
		type.set ("assets/data/button_right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_up.png", __ASSET__assets_data_button_up_png);
		type.set ("assets/data/button_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_x.png", __ASSET__assets_data_button_x_png);
		type.set ("assets/data/button_x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/button_y.png", __ASSET__assets_data_button_y_png);
		type.set ("assets/data/button_y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/courier.ttf", __ASSET__assets_data_courier_ttf);
		type.set ("assets/data/courier.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/data/cursor.png", __ASSET__assets_data_cursor_png);
		type.set ("assets/data/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/default.png", __ASSET__assets_data_default_png);
		type.set ("assets/data/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/fire.mp3", __ASSET__assets_data_fire_mp3);
		type.set ("assets/data/fire.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/data/fontData10pt.png", __ASSET__assets_data_fontdata10pt_png);
		type.set ("assets/data/fontData10pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/fontData11pt.png", __ASSET__assets_data_fontdata11pt_png);
		type.set ("assets/data/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/handle.png", __ASSET__assets_data_handle_png);
		type.set ("assets/data/handle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/He.mp3", __ASSET__assets_data_he_mp3);
		type.set ("assets/data/He.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/data/intro.mp3", __ASSET__assets_data_intro_mp3);
		type.set ("assets/data/intro.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/data/logo.png", __ASSET__assets_data_logo_png);
		type.set ("assets/data/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/logo_corners.png", __ASSET__assets_data_logo_corners_png);
		type.set ("assets/data/logo_corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/logo_light.png", __ASSET__assets_data_logo_light_png);
		type.set ("assets/data/logo_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/nokiafc22.ttf", __ASSET__assets_data_nokiafc22_ttf);
		type.set ("assets/data/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/data/Piou.mp3", __ASSET__assets_data_piou_mp3);
		type.set ("assets/data/Piou.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/data/stick.png", __ASSET__assets_data_stick_png);
		type.set ("assets/data/stick.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/flixel.png", __ASSET__assets_data_vcr_flixel_png);
		type.set ("assets/data/vcr/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/open.png", __ASSET__assets_data_vcr_open_png);
		type.set ("assets/data/vcr/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/pause.png", __ASSET__assets_data_vcr_pause_png);
		type.set ("assets/data/vcr/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/play.png", __ASSET__assets_data_vcr_play_png);
		type.set ("assets/data/vcr/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/record_off.png", __ASSET__assets_data_vcr_record_off_png);
		type.set ("assets/data/vcr/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/record_on.png", __ASSET__assets_data_vcr_record_on_png);
		type.set ("assets/data/vcr/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/restart.png", __ASSET__assets_data_vcr_restart_png);
		type.set ("assets/data/vcr/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/step.png", __ASSET__assets_data_vcr_step_png);
		type.set ("assets/data/vcr/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vcr/stop.png", __ASSET__assets_data_vcr_stop_png);
		type.set ("assets/data/vcr/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/vis/bounds.png", __ASSET__assets_data_vis_bounds_png);
		type.set ("assets/data/vis/bounds.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/HaxeFlixel.svg", __ASSET__assets_haxeflixel_svg);
		type.set ("assets/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/missile.png", __ASSET__assets_missile_png);
		type.set ("assets/missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/mis_fire.png", __ASSET__assets_mis_fire_png);
		type.set ("assets/mis_fire.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/openfl.svg", __ASSET__assets_openfl_svg);
		type.set ("assets/openfl.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/plasma.png", __ASSET__assets_plasma_png);
		type.set ("assets/plasma.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/plasma2.png", __ASSET__assets_plasma2_png);
		type.set ("assets/plasma2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/ship.png", __ASSET__assets_ship_png);
		type.set ("assets/ship.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/space.png", __ASSET__assets_space_png);
		type.set ("assets/space.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/space2.png", __ASSET__assets_space2_png);
		type.set ("assets/space2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/space3.png", __ASSET__assets_space3_png);
		type.set ("assets/space3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/console.png", __ASSET__flixel_img_debugger_buttons_console_png);
		type.set ("flixel/img/debugger/buttons/console.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/logDebug.png", __ASSET__flixel_img_debugger_buttons_logdebug_png);
		type.set ("flixel/img/debugger/buttons/logDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/open.png", __ASSET__flixel_img_debugger_buttons_open_png);
		type.set ("flixel/img/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/pause.png", __ASSET__flixel_img_debugger_buttons_pause_png);
		type.set ("flixel/img/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/play.png", __ASSET__flixel_img_debugger_buttons_play_png);
		type.set ("flixel/img/debugger/buttons/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/record_off.png", __ASSET__flixel_img_debugger_buttons_record_off_png);
		type.set ("flixel/img/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/record_on.png", __ASSET__flixel_img_debugger_buttons_record_on_png);
		type.set ("flixel/img/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/restart.png", __ASSET__flixel_img_debugger_buttons_restart_png);
		type.set ("flixel/img/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/statsDebug.png", __ASSET__flixel_img_debugger_buttons_statsdebug_png);
		type.set ("flixel/img/debugger/buttons/statsDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/step.png", __ASSET__flixel_img_debugger_buttons_step_png);
		type.set ("flixel/img/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/stop.png", __ASSET__flixel_img_debugger_buttons_stop_png);
		type.set ("flixel/img/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/visualDebug.png", __ASSET__flixel_img_debugger_buttons_visualdebug_png);
		type.set ("flixel/img/debugger/buttons/visualDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/buttons/watchDebug.png", __ASSET__flixel_img_debugger_buttons_watchdebug_png);
		type.set ("flixel/img/debugger/buttons/watchDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/flixel.png", __ASSET__flixel_img_debugger_flixel_png);
		type.set ("flixel/img/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/debugger/windowHandle.png", __ASSET__flixel_img_debugger_windowhandle_png);
		type.set ("flixel/img/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/logo/default.png", __ASSET__flixel_img_logo_default_png);
		type.set ("flixel/img/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/logo/HaxeFlixel.svg", __ASSET__flixel_img_logo_haxeflixel_svg);
		type.set ("flixel/img/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("flixel/img/logo/logo.png", __ASSET__flixel_img_logo_logo_png);
		type.set ("flixel/img/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/preloader/corners.png", __ASSET__flixel_img_preloader_corners_png);
		type.set ("flixel/img/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/preloader/light.png", __ASSET__flixel_img_preloader_light_png);
		type.set ("flixel/img/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/tile/autotiles.png", __ASSET__flixel_img_tile_autotiles_png);
		type.set ("flixel/img/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/tile/autotiles_alt.png", __ASSET__flixel_img_tile_autotiles_alt_png);
		type.set ("flixel/img/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/analog/base.png", __ASSET__flixel_img_ui_analog_base_png);
		type.set ("flixel/img/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/analog/thumb.png", __ASSET__flixel_img_ui_analog_thumb_png);
		type.set ("flixel/img/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/button.png", __ASSET__flixel_img_ui_button_png);
		type.set ("flixel/img/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/cursor.png", __ASSET__flixel_img_ui_cursor_png);
		type.set ("flixel/img/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/fontData11pt.png", __ASSET__flixel_img_ui_fontdata11pt_png);
		type.set ("flixel/img/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/a.png", __ASSET__flixel_img_ui_virtualpad_a_png);
		type.set ("flixel/img/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/b.png", __ASSET__flixel_img_ui_virtualpad_b_png);
		type.set ("flixel/img/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/c.png", __ASSET__flixel_img_ui_virtualpad_c_png);
		type.set ("flixel/img/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/down.png", __ASSET__flixel_img_ui_virtualpad_down_png);
		type.set ("flixel/img/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/left.png", __ASSET__flixel_img_ui_virtualpad_left_png);
		type.set ("flixel/img/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/right.png", __ASSET__flixel_img_ui_virtualpad_right_png);
		type.set ("flixel/img/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/up.png", __ASSET__flixel_img_ui_virtualpad_up_png);
		type.set ("flixel/img/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/x.png", __ASSET__flixel_img_ui_virtualpad_x_png);
		type.set ("flixel/img/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/img/ui/virtualpad/y.png", __ASSET__flixel_img_ui_virtualpad_y_png);
		type.set ("flixel/img/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/snd/beep.wav", __ASSET__flixel_snd_beep_wav);
		type.set ("flixel/snd/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("flixel/snd/flixel.wav", __ASSET__flixel_snd_flixel_wav);
		type.set ("flixel/snd/flixel.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		
		#elseif html5
		
		path.set ("Beep", "assets/data/beep.mp3");
		type.set ("Beep", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/data/autotiles.png", "assets/data/autotiles.png");
		type.set ("assets/data/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/autotiles_alt.png", "assets/data/autotiles_alt.png");
		type.set ("assets/data/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/base.png", "assets/data/base.png");
		type.set ("assets/data/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/beep.mp3", "assets/data/beep.mp3");
		type.set ("assets/data/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/data/beep2.mp3", "assets/data/beep2.mp3");
		type.set ("assets/data/beep2.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/data/button.png", "assets/data/button.png");
		type.set ("assets/data/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/button_a.png", "assets/data/button_a.png");
		type.set ("assets/data/button_a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/button_b.png", "assets/data/button_b.png");
		type.set ("assets/data/button_b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/button_c.png", "assets/data/button_c.png");
		type.set ("assets/data/button_c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/button_down.png", "assets/data/button_down.png");
		type.set ("assets/data/button_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/button_left.png", "assets/data/button_left.png");
		type.set ("assets/data/button_left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/button_right.png", "assets/data/button_right.png");
		type.set ("assets/data/button_right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/button_up.png", "assets/data/button_up.png");
		type.set ("assets/data/button_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/button_x.png", "assets/data/button_x.png");
		type.set ("assets/data/button_x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/button_y.png", "assets/data/button_y.png");
		type.set ("assets/data/button_y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/courier.ttf", __ASSET__assets_data_courier_ttf);
		type.set ("assets/data/courier.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		path.set ("assets/data/cursor.png", "assets/data/cursor.png");
		type.set ("assets/data/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/default.png", "assets/data/default.png");
		type.set ("assets/data/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/fire.mp3", "assets/data/fire.mp3");
		type.set ("assets/data/fire.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/data/fontData10pt.png", "assets/data/fontData10pt.png");
		type.set ("assets/data/fontData10pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/fontData11pt.png", "assets/data/fontData11pt.png");
		type.set ("assets/data/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/handle.png", "assets/data/handle.png");
		type.set ("assets/data/handle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/He.mp3", "assets/data/He.mp3");
		type.set ("assets/data/He.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/data/intro.mp3", "assets/data/intro.mp3");
		type.set ("assets/data/intro.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/data/logo.png", "assets/data/logo.png");
		type.set ("assets/data/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/logo_corners.png", "assets/data/logo_corners.png");
		type.set ("assets/data/logo_corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/logo_light.png", "assets/data/logo_light.png");
		type.set ("assets/data/logo_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/data/nokiafc22.ttf", __ASSET__assets_data_nokiafc22_ttf);
		type.set ("assets/data/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		path.set ("assets/data/Piou.mp3", "assets/data/Piou.mp3");
		type.set ("assets/data/Piou.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/data/stick.png", "assets/data/stick.png");
		type.set ("assets/data/stick.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/vcr/flixel.png", "assets/data/vcr/flixel.png");
		type.set ("assets/data/vcr/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/vcr/open.png", "assets/data/vcr/open.png");
		type.set ("assets/data/vcr/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/vcr/pause.png", "assets/data/vcr/pause.png");
		type.set ("assets/data/vcr/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/vcr/play.png", "assets/data/vcr/play.png");
		type.set ("assets/data/vcr/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/vcr/record_off.png", "assets/data/vcr/record_off.png");
		type.set ("assets/data/vcr/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/vcr/record_on.png", "assets/data/vcr/record_on.png");
		type.set ("assets/data/vcr/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/vcr/restart.png", "assets/data/vcr/restart.png");
		type.set ("assets/data/vcr/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/vcr/step.png", "assets/data/vcr/step.png");
		type.set ("assets/data/vcr/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/vcr/stop.png", "assets/data/vcr/stop.png");
		type.set ("assets/data/vcr/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/data/vis/bounds.png", "assets/data/vis/bounds.png");
		type.set ("assets/data/vis/bounds.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/HaxeFlixel.svg", "assets/HaxeFlixel.svg");
		type.set ("assets/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/missile.png", "assets/missile.png");
		type.set ("assets/missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/mis_fire.png", "assets/mis_fire.png");
		type.set ("assets/mis_fire.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/openfl.svg", "assets/openfl.svg");
		type.set ("assets/openfl.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/plasma.png", "assets/plasma.png");
		type.set ("assets/plasma.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/plasma2.png", "assets/plasma2.png");
		type.set ("assets/plasma2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/ship.png", "assets/ship.png");
		type.set ("assets/ship.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/space.png", "assets/space.png");
		type.set ("assets/space.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/space2.png", "assets/space2.png");
		type.set ("assets/space2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/space3.png", "assets/space3.png");
		type.set ("assets/space3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/console.png", "flixel/img/debugger/buttons/console.png");
		type.set ("flixel/img/debugger/buttons/console.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/logDebug.png", "flixel/img/debugger/buttons/logDebug.png");
		type.set ("flixel/img/debugger/buttons/logDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/open.png", "flixel/img/debugger/buttons/open.png");
		type.set ("flixel/img/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/pause.png", "flixel/img/debugger/buttons/pause.png");
		type.set ("flixel/img/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/play.png", "flixel/img/debugger/buttons/play.png");
		type.set ("flixel/img/debugger/buttons/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/record_off.png", "flixel/img/debugger/buttons/record_off.png");
		type.set ("flixel/img/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/record_on.png", "flixel/img/debugger/buttons/record_on.png");
		type.set ("flixel/img/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/restart.png", "flixel/img/debugger/buttons/restart.png");
		type.set ("flixel/img/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/statsDebug.png", "flixel/img/debugger/buttons/statsDebug.png");
		type.set ("flixel/img/debugger/buttons/statsDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/step.png", "flixel/img/debugger/buttons/step.png");
		type.set ("flixel/img/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/stop.png", "flixel/img/debugger/buttons/stop.png");
		type.set ("flixel/img/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/visualDebug.png", "flixel/img/debugger/buttons/visualDebug.png");
		type.set ("flixel/img/debugger/buttons/visualDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/buttons/watchDebug.png", "flixel/img/debugger/buttons/watchDebug.png");
		type.set ("flixel/img/debugger/buttons/watchDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/flixel.png", "flixel/img/debugger/flixel.png");
		type.set ("flixel/img/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/debugger/windowHandle.png", "flixel/img/debugger/windowHandle.png");
		type.set ("flixel/img/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/logo/default.png", "flixel/img/logo/default.png");
		type.set ("flixel/img/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/logo/HaxeFlixel.svg", "flixel/img/logo/HaxeFlixel.svg");
		type.set ("flixel/img/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("flixel/img/logo/logo.png", "flixel/img/logo/logo.png");
		type.set ("flixel/img/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/preloader/corners.png", "flixel/img/preloader/corners.png");
		type.set ("flixel/img/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/preloader/light.png", "flixel/img/preloader/light.png");
		type.set ("flixel/img/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/tile/autotiles.png", "flixel/img/tile/autotiles.png");
		type.set ("flixel/img/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/tile/autotiles_alt.png", "flixel/img/tile/autotiles_alt.png");
		type.set ("flixel/img/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/analog/base.png", "flixel/img/ui/analog/base.png");
		type.set ("flixel/img/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/analog/thumb.png", "flixel/img/ui/analog/thumb.png");
		type.set ("flixel/img/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/button.png", "flixel/img/ui/button.png");
		type.set ("flixel/img/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/cursor.png", "flixel/img/ui/cursor.png");
		type.set ("flixel/img/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/fontData11pt.png", "flixel/img/ui/fontData11pt.png");
		type.set ("flixel/img/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/a.png", "flixel/img/ui/virtualpad/a.png");
		type.set ("flixel/img/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/b.png", "flixel/img/ui/virtualpad/b.png");
		type.set ("flixel/img/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/c.png", "flixel/img/ui/virtualpad/c.png");
		type.set ("flixel/img/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/down.png", "flixel/img/ui/virtualpad/down.png");
		type.set ("flixel/img/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/left.png", "flixel/img/ui/virtualpad/left.png");
		type.set ("flixel/img/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/right.png", "flixel/img/ui/virtualpad/right.png");
		type.set ("flixel/img/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/up.png", "flixel/img/ui/virtualpad/up.png");
		type.set ("flixel/img/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/x.png", "flixel/img/ui/virtualpad/x.png");
		type.set ("flixel/img/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/img/ui/virtualpad/y.png", "flixel/img/ui/virtualpad/y.png");
		type.set ("flixel/img/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("flixel/snd/beep.wav", "flixel/snd/beep.wav");
		type.set ("flixel/snd/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("flixel/snd/flixel.wav", "flixel/snd/flixel.wav");
		type.set ("flixel/snd/flixel.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		
		#else
		
		try {
			
			var bytes = ByteArray.readFile ("manifest");
			bytes.position = 0;
			
			if (bytes.length > 0) {
				
				var data = bytes.readUTFBytes (bytes.length);
				
				if (data != null && data.length > 0) {
					
					var manifest:Array<AssetData> = Unserializer.run (data);
					
					for (asset in manifest) {
						
						path.set (asset.id, asset.path);
						type.set (asset.id, asset.type);
						
					}
					
				}
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || type == SOUND && (assetType == MUSIC || assetType == SOUND)) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

class __ASSET__assets_data_beep_mp3 extends flash.media.Sound { }
class __ASSET__assets_data_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_base_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_beep_mp4 extends flash.media.Sound { }
class __ASSET__assets_data_beep2_mp3 extends flash.media.Sound { }
class __ASSET__assets_data_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_b_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_c_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_down_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_left_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_right_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_button_y_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_courier_ttf extends flash.text.Font { }
class __ASSET__assets_data_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_default_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_fire_mp3 extends flash.media.Sound { }
class __ASSET__assets_data_fontdata10pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_handle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_he_mp3 extends flash.media.Sound { }
class __ASSET__assets_data_intro_mp3 extends flash.media.Sound { }
class __ASSET__assets_data_logo_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_logo_corners_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_logo_light_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_nokiafc22_ttf extends flash.text.Font { }
class __ASSET__assets_data_piou_mp3 extends flash.media.Sound { }
class __ASSET__assets_data_stick_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_open_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_pause_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_play_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_restart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_step_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vcr_stop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_data_vis_bounds_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_haxeflixel_svg extends flash.utils.ByteArray { }
class __ASSET__assets_missile_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_mis_fire_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_openfl_svg extends flash.utils.ByteArray { }
class __ASSET__assets_plasma_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_plasma2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_ship_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_space_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_space2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_space3_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_console_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_logdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_open_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_pause_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_play_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_restart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_statsdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_step_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_stop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_visualdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_buttons_watchdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_debugger_windowhandle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_logo_haxeflixel_svg extends flash.utils.ByteArray { }
class __ASSET__flixel_img_logo_logo_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_preloader_corners_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_preloader_light_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_tile_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_tile_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_analog_base_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_analog_thumb_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_b_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_c_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_down_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_left_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_right_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_img_ui_virtualpad_y_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__flixel_snd_beep_wav extends flash.media.Sound { }
class __ASSET__flixel_snd_flixel_wav extends flash.media.Sound { }


#elseif html5

















class __ASSET__assets_data_courier_ttf extends flash.text.Font { }











class __ASSET__assets_data_nokiafc22_ttf extends flash.text.Font { }






























































#end