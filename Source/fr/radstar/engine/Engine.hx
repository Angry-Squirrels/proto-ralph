package fr.radstar.engine ;
import nape.geom.Vec2;
import nape.space.Space;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.ui.Keyboard;

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
	
	var mSpace : Space;
	
	function new() 
	{
		super();
		
		mSpace = new Space(Vec2.weak(0, 9.80));
		
		mLastTime = Lib.getTimer();
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	function onEnterFrame(e:Event):Void 
	{
		var time = Lib.getTimer();
		var delta = time - mLastTime;
		mLastTime = time;
		
		update(cast delta / 1000);
	}
	
	function update(delta : Float) {
		mSpace.step(delta);
		
		if (mCurrentScene != null)
			mCurrentScene.mainUpdate(delta);
	}
	
	public function getSpace() : Space {
		return mSpace;
	}
	
	public function gotoScene(scene : Scene) {
		if (mCurrentScene != null)
			mCurrentScene.stop();
		mSpace.clear();
		mCurrentScene = scene;
		addChild(mCurrentScene);
		mCurrentScene.play();
	}
	
	public function getCurrentScene() : Scene {
		return mCurrentScene;
	}
	
}