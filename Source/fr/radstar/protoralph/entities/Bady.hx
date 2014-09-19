package fr.radstar.protoralph.entities;
import fr.radstar.engine.Actor;
import fr.radstar.engine.Engine;
import fr.radstar.engine.Entity;
import fr.radstar.engine.GroupName;
import fr.radstar.protoralph.weapons.BareFist;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;

/**
 * ...
 * @author TBaudon
 */
class Bady extends Actor
{

	var mEnemies : Array<Entity>;
	var mTarget : Entity;
	
	public function new() 
	{
		super(GroupName.ENEMY);
		
		graphics.beginFill(0xcc5500);
		graphics.drawCircle(0, 0, 15);
		graphics.endFill();
		
		body.shapes.add(new Circle(15));
		
		hitPoints = 5;
		
		equip(new BareFist());
		
		speed = 10;
		moveStrenght = 25;
	}
	
	override public function baseState(delta : Float) {
		if (mEnemies == null)
			mEnemies = Engine.getInstance().getCurrentScene().getEntitiesByGroup(GroupName.PLAYER);
		else 
			if (mTarget == null){
				mTarget = getClosestInGroup(mEnemies);
				moveTo(mTarget.body.position);
			}
	}
}