package fr.radstar.engine.tools.factories;
import fr.radstar.engine.GroupName;
import fr.radstar.engine.weapon_system.AOE;
import fr.radstar.engine.tools.Pool;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;
import nape.shape.Shape;

/**
 * ...
 * @author Ynk33
 */
class AOEFactory
{
	public static function createImpact(group:GroupName):AOE
	{
		var aoe:AOE = cast(Pool.getInstance().getItem("AOE"), AOE);
		var body:Body;
		if (aoe.body == null)
		{
			body = new Body(BodyType.DYNAMIC);
			var shape:Circle = new Circle(2);
			body.shapes.add(shape);
		}
		else
		{
			body = aoe.body;
			body.type = BodyType.DYNAMIC;
			body.shapes.clear();
			body.shapes.add(new Circle(2));
		}
		
		aoe.init(1, 0.1, body, group);
		
		return aoe;
	}
}