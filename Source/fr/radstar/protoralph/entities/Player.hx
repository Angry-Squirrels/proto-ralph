package fr.radstar.protoralph.entities;

import fr.radstar.engine.GroupName;
import fr.radstar.engine.IState.State;
import fr.radstar.engine.Pawn;

/**
 * ...
 * @author TBaudon
 */
class Player extends Pawn
{

	public function new() 
	{
		super(new MoveState(this), GroupName.Player);
		
		graphics.beginFill(0xff6600);
		graphics.drawCircle(0, 0, 20);
		graphics.endFill();
	}
	
}