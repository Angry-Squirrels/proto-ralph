package fr.radstar.protoralph.entities;
import fr.radstar.engine.Entity;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;
import openfl.Assets;

/**
 * ...
 * @author TBaudon
 */
class Wall extends Entity
{

	public function new(w : Float, h : Float) 
	{
		super();
		
		body = new Body(BodyType.STATIC);
		body.shapes.add(new Polygon(Polygon.rect(0, 0, w, h)));
		
		var bitmap = Assets.getBitmapData("img/wall.png");
		graphics.beginBitmapFill(bitmap);
		graphics.drawRect(0, 0, w, h);
		graphics.endFill();
	}
	
}