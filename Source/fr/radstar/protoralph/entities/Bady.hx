package fr.radstar.protoralph.entities;
import fr.radstar.engine.Actor;
import fr.radstar.engine.GroupName;
import fr.radstar.engine.IState.State;
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
		super(new State(this), GroupName.Enemy);
		
		graphics.beginFill(0xcc5500);
		graphics.drawCircle(0, 0, 10);
		graphics.endFill();
		
		body = new Body(BodyType.DYNAMIC);
		body.shapes.add(new Circle(10));
		
	}
	
}