package fr.radstar.protoralph.entities;
import fr.radstar.engine.Actor;
import fr.radstar.engine.IState.State;
import nape.geom.Vec2;

/**
 * ...
 * @author TBaudon
 */
class MoveState extends State
{
	
	var mTargetPoint : Vec2;

	public function new(actor : Actor) 
	{
		super(actor);
	}
	
	
	
}