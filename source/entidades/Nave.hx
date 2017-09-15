package entidades;
import flash.desktop.Clipboard;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author Tomás Mugetti
 */
class Nave extends FlxSprite
{

	public function new() 
	{
		super();
		x = FlxG.width / 2 -7;
		y = FlxG.height - 16;
		loadGraphic(AssetPaths.nave__png);
		angle = 0;
		scale.set(1, 1);
		updateHitbox;
		velocity.x = 0;
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		mover();
		quedateAdentroMierda();
	}
	private function quedateAdentroMierda() : Void
	{
		if (x < 0) 
		{
			x = 0;
		}
		if (x > FlxG.width - width) 
		{
			x = FlxG.width - width;
		}
	}
	private function mover(): Void
	{
		if (FlxG.keys.pressed.RIGHT) 
		{
			velocity.x = 50;
		} else if (FlxG.keys.pressed.LEFT) 
		{
			velocity.x = -50;
		} else 
		{
			velocity.x = 0;
		}
	}
	public function disparar(cargado:Bool):Bool //Si quiero y puedo disparar
	{
		if (FlxG.keys.pressed.SPACE) 
		{
			return cargado;
			
		}else 
		{
			return false;
		}
	}
}