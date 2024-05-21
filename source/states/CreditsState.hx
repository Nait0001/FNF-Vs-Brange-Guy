package states;

#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end

import objects.AttachedSprite;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	public static var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:FlxColor;
	var colorTween:FlxTween;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		creditsStuff = [];

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		for (mod in Mods.parseList().enabled) pushModCreditsToList(mod);
		#end

		var defaultList:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			['Brange Guy Team'],
			['Novaize',				'Novaize',			'Owner, Director, Artist and Animator\n$"é o daniel novinhas n tem como"$',											'https://twitter.com/Novaze_lippy',								'542861'],
			['Luizkkkj',			'Luizkkkj',			'Director, Charter, Artist and Chromatic Scale Maker\n$"Enfia o capítulo novo do fort no CU cupbendy"$',				'https://twitter.com/strelabionica',							'ffe600'],
			['Dort',				'Dort',				'Director and Composer\n$"i made all songs in mobile :3"$',															'https://twitter.com/SillyAkaDort',								'00FFD4'],
			['Migueell',			'Migueell',			'Co director and Migueell',																							'https://twitter.com/MigueellMouse',							'ffe600'],
			['Boboa',				'Boboa',			'Artist, Animator and Lua Coder\n$"yippiee :3"$',																		'https://twitter.com/bobolinhas9',								'372B52'],
			['O626',				'626',				'Artist\n$"VlackGuyIsNice!"$',																						'https://twitter.com/O_626',									'ff7300'],
			['Nait',				'nati',				'Haxe Coder\n$"olha eu so coder olha como meu icon é diferente"$',													'https://twitter.com/Nait0001',									'FFC0CB'],
			['SlanMan',				'SlanMan',			'Composer',																											'https://twitter.com/man_slan',									'ffd505'],
			['Arvarin',				'Arvarin',			'Composer and Chromatic Scale Maker',																				'https://twitter.com/arvarin',									'a200ff'],
			['Big Boss',			'Big-Boss',			'Coder',																											'https://twitter.com/TheBigBoss050',							'bcdfe6'],
			['Soak',				'Soak',				'Composer\n$"check ma work on youtube"$',																				'https://youtube.com/@Soaked7?si=12t4WpMvVBNcsWuC',				'323a4d'],
			['carlos eduardo 2',	'carlos',			'Composer\n$"a vida é como agua, se fica parado vem o mosquito da dengue"$',											'https://twitter.com/carlosxccc',								'00BFFF'],
			['Coolte3yet',			'Coolte3yet',		'Artist\n$"baranja gay faz o funny"$',																				'https://twitter.com/coolte3yet',								'bcdfe6'],
			['Torta de coxinha',	'Torta',			'BG Artist\n$"Dinheiro e Mulheres"$',																					'https://twitter.com/TortinhaSalgada',							'F1DAA5'],
			['Xokito',				'Xokito',			'Chromatic Scale Maker\n$"Deus é bom"$',																				'https://twitter.com/Xokito14',									'28FF89'],
			['Xrex',				'Xrex',				'Composer',																											'https://twitter.com/XREXUwU904',								'ff05c1'],
			['Telly',				'Telly',			'Charter and Artist\n$"follow me (im orpl guy)"$',																	'https://twitter.com/tellynv',									'ff0898'],
			['IcaroDev',			'Icaro',			'Charter\n$"um idiota qualquer"$',																					'https://www.youtube.com/channel/UC6mh55fWRJOC7zBXV8MGv0Q',		'ffcbdb'],
			['Kal\'',				'Kal',				'Beta Tester\n$"Also play Glue Guy!"$',																				'https://twitter.com/kalfandubs',								'8300ff'],
			['NAILOn',				'Nailon',			'Charter and Artist\n$"o inútil, skibidi toilet rizz gyat jit"$',														'https://www.youtube.com/@average_zimbabwe_citizen',			'ffe600'],
			['Nardii',				'Nardi',			'Artist\n$"Unemployed Artist"$',																						'https://twitter.com/DaviNardii',								'd988db'],
			['Nerdin',				'Nerdin',			'Composer',																											'https://twitter.com/nerdolamusicas',							'b865cf'],
			['Nonimo',				'Nonimo',			'Artist',																											'https://twitter.com/CryNonimo',								'7a352c'],
			['Psych Engine Team'],
			['Shadow Mario',		'shadowmario',		'Main Programmer of Psych Engine',								'https://twitter.com/Shadow_Mario_',	'444444'],
			['Riveren',				'riveren',			'Main Artist/Animator of Psych Engine',							'https://twitter.com/riverennn',		'B42F71'],
			[''],
			['Former Engine Members'],
			['shubs',				'shubs',			'Ex-Programmer of Psych Engine',								'https://twitter.com/yoshubs',			'5E99DF'],
			['bb-panzu',			'bb',				'Ex-Programmer of Psych Engine',								'https://twitter.com/bbsub3',			'3E813A'],
			[''],
			['Engine Contributors'],
			['iFlicky',				'flicky',			'Composer of Psync and Tea Time\nMade the Dialogue Sounds',		'https://twitter.com/flicky_i',			'9E29CF'],
			['SqirraRNG',			'sqirra',			'Crash Handler and Base code for\nChart Editor\'s Waveform',	'https://twitter.com/gedehari',			'E1843A'],
			['EliteMasterEric',		'mastereric',		'Runtime Shaders support',										'https://twitter.com/EliteMasterEric',	'FFBD40'],
			['PolybiusProxy',		'proxy',			'.MP4 Video Loader Library (hxCodec)',							'https://twitter.com/polybiusproxy',	'DCD294'],
			['KadeDev',				'kade',				'Fixed some cool stuff on Chart Editor\nand other PRs',			'https://twitter.com/kade0912',			'64A250'],
			['Keoiki',				'keoiki',			'Note Splash Animations and Latin Alphabet',					'https://twitter.com/Keoiki_',			'D2D2D2'],
			['superpowers04',		'superpowers04',	'LUA JIT Fork',													'https://twitter.com/superpowers04',	'B957ED'],
			['Smokey',				'smokey',			'Sprite Atlas Support',											'https://twitter.com/Smokey_5_',		'483D92'],
			[''],
			["Funkin' Crew"],
			['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",							'https://twitter.com/ninja_muffin99',	'CF2D2D'],
			['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",								'https://twitter.com/PhantomArcade3K',	'FADC45'],
			['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",								'https://twitter.com/evilsk8r',			'5ABD4B'],
			['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",								'https://twitter.com/kawaisprite',		'378FC7']
		];
		
		for(i in defaultList) {
			creditsStuff.push(i);
		}
	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 2, 300, creditsStuff[i][0], !isSelectable);
			optionText.isMenuItem = true;
			optionText.targetY = i;
			optionText.changeX = false;
			optionText.snapToPosition();
			grpOptions.add(optionText);

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Mods.currentModDirectory = creditsStuff[i][5];
				}

				var str:String = 'credits/missing_icon';
				if (Paths.image('credits/' + creditsStuff[i][1]) != null) str = 'credits/' + creditsStuff[i][1];
				var icon:AttachedSprite = new AttachedSprite(str);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
				//icon.origin.set(icon.offset.x, icon.offset.y);
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Mods.currentModDirectory = '';

				if (creditsStuff[i][0] == 'Nait')
				{
					var marginY = 80;

					FlxTween.tween(icon, {angleAdd: 20}, 0.2, {type: PINGPONG, ease: FlxEase.circOut});
					FlxTween.tween(icon, {yAdd: icon.y - marginY}, 0.3, {type: PINGPONG, ease: FlxEase.backOut});
				}

				if(curSelected == -1) curSelected = i;
			}
			else optionText.alignment = CENTERED;
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, FlxG.height + offsetThing - 25, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				CustomFadeTransition.creditIcons = true;
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = FlxMath.bound(elapsed * 12, 0, 1);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:FlxColor = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		trace('The BG color is: $newColor');
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.applyMarkup(descText.text, [new FlxTextFormatMarkerPair(new FlxTextFormat(newColor, false, true, FlxColor.BLACK), '$')]);
		descText.y = FlxG.height - descText.height + offsetThing - 60;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	#if MODS_ALLOWED
	function pushModCreditsToList(folder:String)
	{
		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
	}
	#end

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}