package fr.radstar.protoralph.entities;

import fr.radstar.engine.GroupName;
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
		super(GroupName.Player);
		
		graphics.beginFill(0x0055cc);
		graphics.drawCircle(0, 0, 20);
		graphics.endFill();
		
		body.shapes.add(new Circle(20));
	}
	
}