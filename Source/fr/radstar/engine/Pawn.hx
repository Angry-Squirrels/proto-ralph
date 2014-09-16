package fr.radstar.engine;
import fr.radstar.engine.IState.State;

/**
 * ...
 * @author TBaudon
 */
class Pawn extends Actor
{
	
	public var player : Int;

	public function new(baseState : State, grp : GroupName) 
	{
		super(baseState, grp);
	}
	
	
	
}