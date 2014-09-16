package fr.radstar.engine;
import openfl.events.AccelerometerEvent;
import openfl.events.Event;

/**
 * ...
 * @author TBaudon
 */
class Camera extends Entity
{
	
	var mPosX : Float;
	var mPosY : Float;
	
	var mTarget : Entity;

	public function new(posx : Float, posy : Float) 
	{
		super();
		
		mPosX = posx;
		mPosY = posy;
		
		addEventListener(Event.ADDED, onAdded);
	}
	
	override public function update(delta : Float) {
		if (mTarget != null) {
			x = mTarget.x;
			y = mTarget.y;
		}
		
		parent.x = -x + mPosX;
		parent.y = -y + mPosY;
	}
	
	override public function setPos(x : Float, y : Float) {
		mPosX = x;
		mPosY = y;
	}
	
	function onAdded(e : Event) {
		
		x = -parent.x + mPosX;
		y = -parent.y + mPosY;
	}
	
	public function follow(entity : Entity) {
		mTarget = entity;
	}
	
}