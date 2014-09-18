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
		
		range = 50;
		
		mPool = Pool.getInstance();
	}
	
	override public function use() {
		trace("Take my fist on your face !");
		
		var aoe : FistAoe = cast mPool.getItem(FistAoe);
		aoe.init(5, 1, owner.group);
		aoe.x = owner.x;
		aoe.y = owner.y;
		
		Engine.getInstance().getCurrentScene().add(aoe);
	}
	
}