package fr.radstar.protoralph.weapons ;
import fr.radstar.engine.Engine;
import fr.radstar.engine.GroupName;
import fr.radstar.engine.tools.Pool;
import fr.radstar.engine.weapon.Weapon;

/**
 * ...
 * @author Thomas B
 */
class BareFist extends Weapon
{
	
	var mPool : Pool;

	public function new() 
	{
		super();
		
		range = 10;
		damage = 1;
		
		mPool = Pool.getInstance();
	}
	
	override public function use() {
		var aoe : FistAoe = cast mPool.getItem(FistAoe);
		aoe.init(damage, 0.1, owner, 0.5);
		
		aoe.x = owner.x + Math.cos(owner.body.rotation) * 30;
		aoe.y = owner.y + Math.sin(owner.body.rotation) * 30;
		
		Engine.getInstance().getCurrentScene().add(aoe);
	}
	
}