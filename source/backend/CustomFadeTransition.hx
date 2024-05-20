package backend;

import flixel.util.FlxGradient;
import flixel.math.FlxPoint;

class CustomFadeTransition extends MusicBeatSubstate {
	public static var finishCallback:Void->Void;
	public static var nextCamera:FlxCamera;
	var stickerGroup:FlxSpriteGroup;
	var isTransIn:Bool = false;
	var gradientTrans:Bool = false;

	var stickerTimes:Int = 400;
	var stickerSprites:Array<String> = [
		"brange", "glack", "nerd",
		"spring", "tales"
	];
	var timerSticks:FlxTimer = null;
	var excuses:Array<Array<Float>> = [];
	
	private var leTween:FlxTween = null;
	var transBlack:FlxSprite;
	var transGradient:FlxSprite;
	public function new(duration:Float, isTransIn:Bool, gradientTrans:Bool = false) {
		super();
		this.isTransIn = isTransIn;
		this.gradientTrans = gradientTrans;


		if (!gradientTrans)
		{
			stickerGroup = new FlxSpriteGroup(0, 0, stickerTimes);
			add(stickerGroup);

			var stickerPerTime:Float = (duration / stickerTimes) / 100;


			//trace(TitleState.spriteDataGroup[0] == null);

			timerSticks = new FlxTimer().start(stickerPerTime, function(timer:FlxTimer){
				// isTransIn - close
				if (!isTransIn){
					createSticker(10);

					if (stickerGroup.length < stickerTimes)
						timerSticks.reset(stickerPerTime);
				} else {
					//deleteStickers();
					createSticker(stickerGroup.maxSize);
					//deleteSprites = true;
					new FlxTimer().start(duration/2, t -> deleteSprites = true);
				}

				//trace(stickerGroup.length);
			});

			if(nextCamera != null) {
				stickerGroup.cameras = [nextCamera];
			}
		}
		else
		{
			var zoom:Float = FlxMath.bound(FlxG.camera.zoom, 0.05, 1);
			var width:Int = Std.int(FlxG.width / zoom);
			var height:Int = Std.int(FlxG.height / zoom);
			transGradient = FlxGradient.createGradientFlxSprite(1, height, (isTransIn ? [0x0, FlxColor.BLACK] : [FlxColor.BLACK, 0x0]));
			transGradient.scale.x = width;
			transGradient.updateHitbox();
			transGradient.scrollFactor.set();
			add(transGradient);
	
			transBlack = new FlxSprite().makeGraphic(1, height + 400, FlxColor.BLACK);
			transBlack.scale.x = width;
			transBlack.updateHitbox();
			transBlack.scrollFactor.set();
			add(transBlack);
	
			transGradient.x -= (width - FlxG.width) / 2;
			transBlack.x = transGradient.x;
	
			if(isTransIn) {
				transGradient.y = transBlack.y - transBlack.height;
				FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {
					onComplete: function(twn:FlxTween) {
						close();
					},
				ease: FlxEase.linear});
			} else {
				transGradient.y = -transGradient.height;
				transBlack.y = transGradient.y - transBlack.height + 50;
				leTween = FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {
					onComplete: function(twn:FlxTween) {
						if(finishCallback != null) {
							finishCallback();
						}
					},
				ease: FlxEase.linear});
			}
	
			if(nextCamera != null) {
				transBlack.cameras = [nextCamera];
				transGradient.cameras = [nextCamera];
			}
		}
		nextCamera = null;
	}

	function createSticker(times = 1){
		FlxG.sound.play(Paths.sound("keys/keyClick" + FlxG.random.int(1, 9)));
		for (t in 0...times){
			var id_sprites:Int = stickerGroup.length - 1;
			var stickerscale = 0.5;

			if (id_sprites < 0) id_sprites = 0; 

			var sticker:FlxSprite = new FlxSprite();
			sticker.loadGraphic(Paths.image("stickers/" + stickerSprites[FlxG.random.int(0, stickerSprites.length-1)] + "Sticker" + FlxG.random.int(1, 3)));

			sticker.setGraphicSize(Std.int(sticker.width * stickerscale));
			sticker.updateHitbox();
			sticker.ID = id_sprites;
		
			var randownPos = new FlxPoint(0,0);

			//randownPos.x = FlxG.random.float(-sticker.width, FlxG.width, excuses[0]);
			//randownPos.y = FlxG.random.float(-sticker.height, FlxG.height, excuses[1]);
			for (c in 0...50){
				randownPos.x = FlxG.random.float(-sticker.width, FlxG.width);
				randownPos.y = FlxG.random.float(-sticker.height, FlxG.height);
				if (!stickerGroup.overlapsPoint(randownPos, true, nextCamera)){
					break;
				}
			}

			sticker.angle = FlxG.random.float(-30, 20);

			sticker.setPosition(randownPos.x, randownPos.y);

			stickerGroup.add(sticker);

			for (i in 0...Std.int(sticker.width)){
				excuses.push([(sticker.x + i), (sticker.y + i)]);
			}

			if (stickerGroup.length >= stickerGroup.maxSize && !isTransIn){				
				if (timerSticks    != null) timerSticks.cancel();
				if (finishCallback != null) finishCallback();

			}
		}
	}

	function deleteStickers(times:Int = 1){
		FlxG.sound.play(Paths.sound("keys/keyClick" + FlxG.random.int(1, 9)));
		for (t in 0...times){
			if (isTransIn && stickerGroup != null){
				if (stickerGroup.length > 0)
				{
					stickerGroup.forEachAlive(function(spr:FlxSprite){
						if (spr.ID == stickerGroup.maxSize - stickerGroup.length){
							spr.kill();
							stickerGroup.remove(spr, true);
							spr.destroy();
						}
					});
				}

				if (stickerGroup.length == 1){
					//TitleState.spriteDataGroup = [];
					close();
				}
			}
		}
	}

	var deleteSprites:Bool = false;
	override function update(elapsed:Float) {

		if (!gradientTrans)
		{
			if (deleteSprites){
				deleteStickers(10);
			}
		}
		else
		{
			if(isTransIn) {
				transBlack.y = transGradient.y + transGradient.height;
			} else {
				transBlack.y = transGradient.y - transBlack.height;
			}
		}
			
		super.update(elapsed);

		if (gradientTrans)
		{
			if(isTransIn) {
				transBlack.y = transGradient.y + transGradient.height;
			} else {
				transBlack.y = transGradient.y - transBlack.height;
			}
		}

	}

	override function destroy() {
		if(!gradientTrans && timerSticks != null) {

			timerSticks.cancel();

			stickerGroup.kill();
			stickerGroup.clear();
			stickerGroup.destroy();

			// if (finishCallback != null) finishCallback();
		}

		if (gradientTrans && leTween != null)
		{
			finishCallback();
			leTween.cancel();
		}
		super.destroy();
	}
}