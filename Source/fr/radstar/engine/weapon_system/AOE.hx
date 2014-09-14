package fr.radstar.weapon_system;
import fr.radstar.engine.Entity;
import fr.radstar.tools.IPoolable;
import nape.phys.Body;

/**
 * ...
 * @author Ynk33
 */
class AOE extends Entity implements IPoolable
{
	var mEntitiesTouched:Array<Entity>;
	var mDamages:Int;
	var mLifeSpan:Int;
	
	public function new() 
	{
		super();
		this.reset();
	}
	
	public function init(damages:Int, lifeSpan:Int, body:Body, group:UInt):Void
	{
		mDamages = damages;
		mLifeSpan = lifeSpan;
		
		this.body = geom;
	}
	
	public function reset():Void
	{
		mEntitiesTouched = new Array<Entity>();
	}
	
	public function free():Void
	{
		this.reset();
	}
	
}