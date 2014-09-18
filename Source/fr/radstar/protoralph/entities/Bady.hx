package fr.radstar.protoralph.entities;
import fr.radstar.engine.Actor;
import fr.radstar.engine.GroupName;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;

/**
 * ...
 * @author TBaudon
 */
class Bady extends Actor
{

	public function new() 
	{
		super(GroupName.ENEMY);
		
		graphics.beginFill(0xcc5500);
		graphics.drawCircle(0, 0, 10);
		graphics.endFill();
		
		body.shapes.add(new Circle(10));
		
	}
	
}