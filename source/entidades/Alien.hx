package entidades;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author Tomás Mugetti
 */
class Alien extends FlxSprite
{
	private var amigos:Int;
	private var contador:Int;
	private var direcY:Bool;
	private var direcX:Bool;
	public function new(X:Float, Y:Float) 
	{
		super(X,Y);
		loadGraphic(AssetPaths.alien__png);
		angle = 0;
		scale.set(1, 1);
		updateHitbox();
		contador = 0;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		contar();
		
	}
	override public function destroy():Void
	{
		FlxG.state.remove(this);
		super.destroy();
	}
	private function contar():Void
	{
		contador++;
		if (contador>=60) 
		{
			mover();
			contador = 0;
		}
	}
	private function mover():Void
	{
		y += this.width; //borrar esta parte despues
		//if (direcY) 
		//{
			//y += height;
			//direcY = false;
		//} else if (direcX) 
		//{
			//x += width;
		//} else 
		//{
			//x -= width;
		//}
	}
	//public function pared():Void
	//{
		//direcY = true;
		//if (direcX) 
		//{
			//direcX = false;
		//} else 
		//{
			//direcX = true;
		//}
	//}
}