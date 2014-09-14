package fr.radstar.engine.tools.factories;
import fr.radstar.engine.GroupName;
import fr.radstar.engine.weapon_system.Bullet;
import fr.radstar.engine.tools.Pool;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;

/**
 * ...
 * @author Ynk33
 */
class BulletFactory
{
	public static function createSimpleBullet(group:GroupName):Bullet
	{
		var bullet:Bullet = cast(Pool.getInstance().getItem("Bullet"), Bullet);
		var body:Body;
		if (bullet.body == null)
		{
			body = new Body(BodyType.DYNAMIC);
			var shape:Polygon = Polygon.rect(0, -1, 5, 2);
			body.shapes.add(shape);
		}
		else
		{
			body = bullet.body;
			body.type = BodyType.DYNAMIC;
			body.shapes.clear();
			body.shapes.add(Polygon.rect(0, -1, 5, 2));
		}
		
		bullet.init(10, AOEFactory.createImpact(group), body, group);
		
		return bullet;
	}
}