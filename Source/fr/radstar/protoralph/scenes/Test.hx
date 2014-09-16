package fr.radstar.protoralph.scenes;
import fr.radstar.engine.Scene;
import fr.radstar.protoralph.entities.Player;
import fr.radstar.protoralph.entities.Wall;

/**
 * ...
 * @author TBaudon
 */
class Test extends Scene
{

	public function new() 
	{
		super();
		
		var wall = new Wall(100, 20);
		add(wall);
		
		var hero = new Player();
		hero.x = 400;
		hero.y = 240;
		add(hero);
		
		
	}
	
	override public function update(delta : Float) {
		super.update(delta);
	}
	
}