package fr.radstar;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

/**
 * ...
 * @author TBaudon
 */
class Engine extends Sprite
{
	
	static var mInstance : Engine;
	
	public static function getInstance() : Engine {
		if (mInstance == null) 
			mInstance = new Engine();
		return mInstance;
	}
	
	var mLastTime : Int;
	var mCurrentScene : Scene;
	
	function new() 
	{
		super();
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	function onEnterFrame(e:Event):Void 
	{
		var time = Lib.getTimer();
		var delta = time - mLastTime;
		mLastTime = time;
		
		update(cast time / 1000);
	}
	
	function update(delta : Float) {
		if (mCurrentScene != null)
			mCurrentScene.update(delta);
	}
	
	function gotoScene(scene : Scene) {
		if (mCurrentScene != null)
			mCurrentScene.stop();
		mCurrentScene = scene;
		mCurrentScene.play();
	}
	
}