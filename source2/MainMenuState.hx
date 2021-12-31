package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import openfl.Assets;
import flash.system.System;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.4.2'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;

		// yellow shit
		var yellowShit:FlxText;
		var shitpost:String;
	var finalVar:Array<Dynamic> = [];
	
	var optionShit:Array<String> = ['story mode', 'freeplay', 'donate', 'options', 'quit', 'character', 'credits'];

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	public static var bgPaths:Array<String> = 
	[
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/menuDesat',
		'backgrounds/menuDesat',
		'backgrounds/menuDesat',
		'backgrounds/menuDesat',
		'backgrounds/menuDesat',
		'backgrounds/menuDesat',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/BG5',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/menuBG',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/baguette',
		'backgrounds/menuDesat',
		'backgrounds/menuDesat',
		'backgrounds/menuDesat',
		'backgrounds/menuDesat',
		'backgrounds/menuDesat',
		'backgrounds/menuDesat',
		'backgrounds/poto'
	];

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.set(0, yScroll);
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		add(magenta);
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		
		var tex = Paths.getSparrowAtlas('FNF_main_menu_assets');
	

		var menuItem:FlxSprite = new FlxSprite(20, 250);//omg
		menuItem.frames = tex;
		menuItem.animation.addByPrefix('idle', optionShit[0] + " basic", 24);
		menuItem.animation.addByPrefix('selected', optionShit[0] + " white", 24);
		menuItem.animation.play('idle');
		menuItem.ID = 0;
		menuItem.updateHitbox();
		menuItem.screenCenter(X);
		menuItems.add(menuItem);
	
		menuItem.antialiasing = true;
		

		var menuItem:FlxSprite = new FlxSprite(20, 345);
		menuItem.frames = tex;
		menuItem.animation.addByPrefix('idle', optionShit[1] + " basic", 24);
		menuItem.animation.addByPrefix('selected', optionShit[1] + " white", 24);
		menuItem.animation.play('idle');
		menuItem.ID = 1;
		menuItem.updateHitbox();
		menuItem.screenCenter(X);
		menuItems.add(menuItem);
	
		menuItem.antialiasing = true;	


		var menuItem:FlxSprite = new FlxSprite(20, 430);
		menuItem.frames = tex;
		menuItem.animation.addByPrefix('idle', optionShit[2] + " basic", 24);
		menuItem.animation.addByPrefix('selected', optionShit[2] + " white", 24);
		menuItem.animation.play('idle');
		menuItem.ID = 2;
		menuItem.updateHitbox();
		menuItem.screenCenter(X);
		menuItems.add(menuItem);
		
		menuItem.antialiasing = true;
		

		var menuItem:FlxSprite = new FlxSprite(265, 520);
		menuItem.frames = tex;
		menuItem.animation.addByPrefix('idle', optionShit[3] + " basic", 24);
		menuItem.animation.addByPrefix('selected', optionShit[3] + " white", 24);
		menuItem.animation.play('idle');
		menuItem.ID = 3;
		menuItem.updateHitbox();
		//menuItem.screenCenter(X);
		menuItem.setGraphicSize(Std.int(menuItem.width * 0.6));
		menuItems.add(menuItem);

		menuItem.antialiasing = true;


		var menuItem:FlxSprite = new FlxSprite(690, 522);
		menuItem.frames = tex;
		menuItem.animation.addByPrefix('idle', optionShit[4] + " basic", 24);
		menuItem.animation.addByPrefix('selected', optionShit[4] + " white", 24);
		menuItem.animation.play('idle');
		menuItem.ID = 4;
		menuItem.updateHitbox();
		//menuItem.screenCenter(X);
		menuItem.setGraphicSize(Std.int(menuItem.width * 0.75));
		menuItems.add(menuItem);

		menuItem.antialiasing = true;


		var menuItem:FlxSprite = new FlxSprite(995, 440);
		menuItem.frames = tex;
		menuItem.animation.addByPrefix('idle', optionShit[5] + " basic", 24);
		menuItem.animation.addByPrefix('selected', optionShit[5] + " white", 24);
		menuItem.animation.play('idle');
		menuItem.ID = 5;
		menuItem.updateHitbox();
		//menuItem.screenCenter(X);
		menuItem.setGraphicSize(Std.int(menuItem.width * 0.7));
		menuItems.add(menuItem);

		menuItem.antialiasing = true;


		var menuItem:FlxSprite = new FlxSprite(220, 440);
		menuItem.frames = tex;
		menuItem.animation.addByPrefix('idle', optionShit[6] + " basic", 24);
		menuItem.animation.addByPrefix('selected', optionShit[6] + " white", 24);
		menuItem.animation.play('idle');
		menuItem.ID = 6;
		menuItem.updateHitbox();
		//menuItem.screenCenter(X);
		menuItem.setGraphicSize(Std.int(menuItem.width * 0.6));
		menuItems.add(menuItem);

		menuItem.antialiasing = true;
	
		/*
		x - izquierda + derecha
		y - arriba + abajo
		*/
		/* character.hx:
		x - derecha + izquierda
		y - abajo + arriba
		*/

		yellowShit = new FlxText(0, 0, 0, finalVar[0] + '\n' + finalVar[1]);
		yellowShit.setFormat(Paths.font("minecraftia.ttf"), 18, FlxColor.YELLOW, CENTER);
		yellowShit.angle = -30;
		yellowShit.screenCenter();
		yellowShit.y -= 155;
		yellowShit.x += 250;



		add(menuItems);
		add(yellowShit);
		fuckBump(0);

		//FlxG.camera.follow(camFollowPos, null, 1);

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	var canClick:Bool = true;
	var usingMouse:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		menuItems.forEach(function(spr:FlxSprite)
			{
				if(usingMouse)
				{
					if(!FlxG.mouse.overlaps(spr))
						spr.animation.play('idle');
				}
		
				if (FlxG.mouse.overlaps(spr))
				{
					if(canClick)
					{
						curSelected = spr.ID;
						usingMouse = true;
						spr.animation.play('selected');
					}
						
					if(FlxG.mouse.pressed && canClick)
					{
						
					}
				}
	
		
				spr.updateHitbox();
			});

		

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 5.6, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT || FlxG.mouse.pressed)
			{
				if (optionShit[curSelected] == 'donate')
					{
						#if linux
						Sys.command('/usr/bin/xdg-open', ["http://twitch.tv/shadoune666", "http://instagram.com/shadoune666", "https://twitter.com/Shadoune666", " https://discord.gg/wWwdE3r"]);
						#else
						FlxG.openURL('https://www.youtube.com/user/Shadoune666Mc');
						FlxG.openURL('http://twitch.tv/shadoune666');
						FlxG.openURL('http://instagram.com/shadoune666');
						FlxG.openURL('https://twitter.com/Shadoune666');
						FlxG.openURL('https://discord.gg/wWwdE3r');
						#end				
	
						FlxG.switchState(new MainMenuState());
					}
					
					if (optionShit[curSelected] == 'quit')
					{
						#if linux
						Sys.command('/usr/bin/xdg-open', ["https://www.youtube.com/watch?v=dQw4w9WgXcQ"]);
						#else
						FlxG.openURL('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
						#end
						
						System.exit(0);
					}


				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));
										
					canClick = false;

					if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story mode':
										MusicBeatState.switchState(new StoryMenuState());

										trace("Story Menu Selected");

									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									/*case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									*/case 'credits':
										MusicBeatState.switchState(new MusicPlayerState());

										trace("c papu");

									case 'options':
										MusicBeatState.switchState(new OptionsState());

										trace("use CHAD INPUT");

										case 'character':
											MusicBeatState.switchState(new CreditsState());	
							
											trace("hazme un mundo sldg de nuevo");	

											
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.justPressed.SEVEN)
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			//spr.screenCenter(X);
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.offset.y = 0;
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
				spr.offset.x = 0.15 * (spr.frameWidth / 2 + 180);
				spr.offset.y = 0.15 * spr.frameHeight;
				FlxG.log.add(spr.frameWidth);
			}
		});
	}
		
	public function getShit()
		{
			var text:String = Assets.getText(Paths.txt('MinecraftText'));
	
			var array:Array<String> = text.split('\n');
	
			shitpost = FlxG.random.getObject(array);
	
			finalVar = shitpost.split(' <> ');
		}

	function fuckBump(key:Int = 0)
		{
			if (key == 0)
			{
				FlxTween.tween(yellowShit.scale, {x: 1.2, y: 1.2}, 1, {
				onComplete: function(twn:FlxTween)
				{ 
					fuckBump(1);
				}});
			}
			else
			{
				FlxTween.tween(yellowShit.scale, {x: 1, y: 1}, 1, {
				onComplete: function(twn:FlxTween)
				{ 
					fuckBump(0);
				}});
			}
		}
		public static function randomizeBG():flixel.system.FlxAssets.FlxGraphicAsset
			{
				var chance:Int = FlxG.random.int(0, bgPaths.length - 1);
				return Paths.image(bgPaths[chance]);
			}
}
