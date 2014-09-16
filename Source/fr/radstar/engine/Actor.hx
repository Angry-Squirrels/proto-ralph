package fr.radstar.engine;
import fr.radstar.engine.IState.State;
import fr.radstar.engine.weapon.Weapon;

/**
 * ...
 * @author TBaudon
 */
class Actor extends Entity
{

	public var weapon : Weapon;
	public var state : State;
	
	public function new(baseState : State, grp : GroupName) 
	{
		super();
		
		state = baseState;
		group = grp;
	}
	
	public function attack() {
		if (weapon != null) {
			weapon.use(this);
		}
	}
	
	override public function update(delta : Float) {
		if (state != null)
			state.update(delta);
	}
	
}