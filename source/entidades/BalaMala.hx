package entidades;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author Tomás Mugetti
 */
class BalaMala extends FlxSprite
{
	private var disparable:Bool;
	public function new() //igual a bala pero con dirección invertida y otro sprite
	{
		super();
		x = -100;
		y = -100;
		loadGraphic(AssetPaths.tiromalo__png);
		angle = 0;
		disparable = true;
		scale.set(1, 1);
		updateHitbox();
		velocity.x = 0;
		velocity.y = 0;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		meJui();
	}
	public function getDisparable():Bool
	{
		return disparable;
	}
	public function disparada(_x:Float, _y:Float):Void
	{
		disparable = false;
		x = _x;
		y = _y;
		velocity.y = 50;
	}
	private function meJui():Void
	{
		if (y < 0-height || y > FlxG.height + height) 
		{
			paTuCasa();
		}
	}
	public function hit():Void
	{
		paTuCasa();
	}
	private function paTuCasa():Void //La bala nunca deja se destruye, solo esta fuera de vista. 
	{
		y = -100;
		x = -100;
		velocity.y = 0;
		disparable = true;
	}
	
}