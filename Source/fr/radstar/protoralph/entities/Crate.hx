package fr.radstar.protoralph.entities;
import fr.radstar.engine.Entity;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;

/**
 * ...
 * @author TBaudon
 */
class Crate extends Entity
{

	public function new() 
	{
		super();
		
		graphics.beginFill(0x66cc33);
		graphics.drawRect(-15, -15, 30, 30);
		graphics.endFill();
		
		body = new Body(BodyType.DYNAMIC);
		body.shapes.add(new Polygon(Polygon.rect(-15, -15, 30, 30)));
	}
	
}