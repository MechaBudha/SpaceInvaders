package;

import entidades.Bala;
import entidades.BalaMala;
import entidades.Nave;
import entidades.Alien;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;

class PlayState extends FlxState
{
	private var player:Nave = new Nave();
	private var tiroPlayer:Bala = new Bala();
	private var tiroAlien:BalaMala = new BalaMala();
	private var aliens:FlxTypedGroup<Alien> = new FlxTypedGroup(50);
	private var contralapared:Bool;
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		add(player);
		add(tiroPlayer);
		add(tiroAlien);
		for (i in 0 ... 5) 
		{
			for (j in 0 ... 10) 
			{
				var a:Alien = new Alien(20 + (j * 12), i * 12);
				aliens.add(a);
			}
		}
		add(aliens);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//disparo player
		if (player.disparar(tiroPlayer.getDisparable())) //Si el jugador quiere disparar, y la bala esta disponible
		{
			tiroPlayer.disparada(player.x + 3, player.y); //sale del centro de la nave
		}
		//disparo alien
		if (tiroAlien.getDisparable()) 
		{
			var malo:Alien = aliens.getRandom();
			var A:Float = malo.x;
			var B:Float = malo.y; 
			var C:Float = malo.width / 2;
			tiroAlien.disparada(A + C, B);
		}
		//colisiones
		//bala y alien
		for (i in 0 ... aliens.members.length -1) 
		{
			var loco:Alien = aliens.members[i];
			FlxG.overlap(tiroPlayer, loco, choqueAlien);
		}
		//bala y nave
		FlxG.overlap(tiroAlien, player, choquePlayer);
		//nave y alien
		for (i in 0 ... aliens.members.length -1) 
		{
			var loco:Alien = aliens.members[i];
			FlxG.overlap(player, loco, choqueAmbos);
		}
		
	}
	private function choqueAlien(tiro:Bala, cosa:Alien):Void
	{
		tiro.hit();
		aliens.remove(cosa); 
		cosa.destroy();
	}
	private function choquePlayer(tiro:BalaMala, pibe:Nave):Void
	{
		tiro.hit();
		pibe.destroy();
	}
	private function choqueAmbos(uno:Nave, otro:Alien):Void
	{
		uno.destroy(); 
		aliens.remove(otro);
		otro.destroy();
	}
}