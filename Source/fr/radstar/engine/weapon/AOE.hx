package fr.radstar.engine.weapon ;
import fr.radstar.engine.Entity;
import fr.radstar.engine.GroupName;
import fr.radstar.engine.tools.IPoolable;
import nape.callbacks.InteractionCallback;
import nape.phys.Body;

/**
 * ...
 * @author Ynk33
 */
class AOE extends Entity implements IPoolable
{
	var mEntitiesTouched:Array<Entity>;
	var mDamages:Int;
	var mLifeSpan:Float;
	
	public function new() 
	{
		super();
		this.reset();
	}
	
	public function init(damages:Int, lifeSpan:Float, body:Body, group:GroupName):Void
	{
		mDamages = damages;
		mLifeSpan = lifeSpan;
		
		this.body = geom;
		this.group = group;
	}
	
	public function reset():Void
	{
		mEntitiesTouched = new Array<Entity>();
		this.invulnerable = true;
	}
	
	public function free():Void
	{
		this.reset();
	}
	
	public function fire():Void
	{
		
	}
	
	function entityTouched(params:InteractionCallback):Void
	{
		try
		{
			var entity:Entity = cast(params.int2.castBody, Entity);
			if (entity.group != this.group)
			{
				mEntitiesTouched.push(entity);
				entity.onDamaged(mDamages);
			}
		}
		catch (e:String)
		{
			
		}
	}
}