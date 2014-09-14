package fr.radstar.weapon_system;
import fr.radstar.Entity;
import fr.radstar.tools.IPoolable;

/**
 * ...
 * @author Ynk33
 */
class AOE extends Entity implements IPoolable
{
	private var entitiesTouched:Array<Entity>;
	
	public function new() 
	{
		reset();
	}
	
	public function reset()
	{
		entitiesTouched = new Array<Entity>();
	}
	
	
	
}