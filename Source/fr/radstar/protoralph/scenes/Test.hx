package fr.radstar.protoralph.scenes;
import flash.display.Graphics;
import fr.radstar.engine.Entity;
import fr.radstar.engine.Scene;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.phys.Material;
import nape.shape.Circle;
import nape.shape.Polygon;

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
		
		var ball = new Body(BodyType.DYNAMIC);
		ball.shapes.add(new Circle(20));
		ball.setShapeMaterials(new Material(2));
		
		ent.body = ball;
		
		ent.x = 200;
		
		var ent2 = new Entity();
		var rect = new Body(BodyType.STATIC);
		rect.shapes.add(new Polygon(Polygon.box(500, 100)));
		ent2.y = 400;
		ent2.graphics.beginFill(0x0000ff);
		ent2.graphics.drawRect(0, 0, 500, 100);
		ent2.body = rect;
		add(ent2);
	}
	
	override public function update(delta : Float) {
		super.update(delta);
	}
	
}