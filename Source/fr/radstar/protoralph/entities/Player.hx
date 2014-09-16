package fr.radstar.protoralph.entities;

import fr.radstar.engine.GroupName;
import fr.radstar.engine.IState.State;
import fr.radstar.engine.Pawn;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;

/**
 * ...
 * @author TBaudon
 */
class Player extends Pawn
{

	public function new() 
	{
		super(new MoveState(this), GroupName.Player);
		
		graphics.beginFill(0x0055cc);
		graphics.drawCircle(0, 0, 20);
		graphics.endFill();
		
		body = new Body(BodyType.DYNAMIC);
		body.shapes.add(new Circle(20));
	}
	
	public function moveTo(_x : Float, _y : Float) {

		
		var dir = Vec2.weak(_x - x, _y - y);
		body.applyImpulse(dir.mul(1));
	}
	
}