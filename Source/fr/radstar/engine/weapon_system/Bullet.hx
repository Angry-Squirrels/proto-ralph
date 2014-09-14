package fr.radstar.engine.weapon_system;
import fr.radstar.engine.Entity;
import fr.radstar.engine.GroupName;
import fr.radstar.engine.tools.IPoolable;
import nape.callbacks.InteractionCallback;
import nape.phys.Body;

/**
 * ...
 * @author Ynk33
 */
class Bullet extends Entity implements IPoolable
{
	var mLifeSpan:Int;
	var mAOE:AOE;

	public function new() 
	{
		super();
		this.reset();
	}
	
	public function init(lifeSpan:Int, aoe:AOE, body:Body, group:GroupName):Void
	{
		mLifeSpan = lifeSpan;
		mAOE = aoe;
		
		this.body = body;
		this.group = group;
	}
	
	public function reset():Void
	{
		this.invulnerable = true;
	}
	
	public function free():Void
	{
		this.reset();
	}
	
	function entityTouched(params:InteractionCallback):Void
	{
		try
		{
			var entity:Entity = cast(params.int2.castBody, Entity);
			if (entity.group != this.group)
			{
				// spawn AOE
				mAOE.fire();
			}
		}
		catch (e:String)
		{
			
		}
	}
}