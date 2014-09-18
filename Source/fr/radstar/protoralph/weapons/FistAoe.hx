package fr.radstar.protoralph.weapons;
import fr.radstar.engine.Entity;
import fr.radstar.engine.weapon.AOE;
import nape.callbacks.InteractionType;
import nape.shape.Circle;

/**
 * ...
 * @author Thomas B
 */
class FistAoe extends AOE
{

	public function new() 
	{
		super();
		
		var shape : Circle = new Circle(10);
		shape.sensorEnabled = true;
		body.shapes.add(shape);
		
		graphics.beginFill(0x000000,0.3);
		graphics.drawCircle(0, 0, 10);
	}
	
}