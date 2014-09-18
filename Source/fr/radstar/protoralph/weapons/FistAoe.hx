package fr.radstar.protoralph.weapons;
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
		
		var shape : Circle = new Circle(20);
		shape.sensorEnabled = true;
		body.shapes.add(shape);
		
		graphics.beginFill(0xff0000);
		graphics.drawCircle(0, 0, 20);
	}
		
}