package fr.radstar.protoralph.scenes;
import flash.display.Graphics;
import fr.radstar.engine.Entity;
import fr.radstar.engine.Scene;

/**
 * ...
 * @author TBaudon
 */
class Test extends Scene
{

	public function new() 
	{
		super();
		
		var ent = new Entity();
		
		var g : Graphics = ent.graphics;
		
		g.clear();
		g.beginFill(0xff0000);
		g.drawCircle(0, 0, 20);
		
		add(ent);
	}
	
	override public function update(delta : Float) {
		super.update(delta);
	}
	
}