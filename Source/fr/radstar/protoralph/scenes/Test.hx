package fr.radstar.protoralph.scenes;
import flash.events.Event;
import fr.radstar.engine.Camera;
import fr.radstar.engine.Engine;
import fr.radstar.engine.Entity;
import fr.radstar.engine.Scene;
import fr.radstar.protoralph.entities.Bady;
import fr.radstar.protoralph.entities.Crate;
import fr.radstar.protoralph.entities.Player;
import fr.radstar.protoralph.entities.Wall;
import nape.geom.Vec2;
import openfl.events.MouseEvent;
import openfl.events.TouchEvent;
import openfl.Lib;

/**
 * ...
 * @author TBaudon
 */
class Test extends Scene
{
	
	var mTime : Float;
	var mHero : Player;
	var mMouseDown : Bool;

	public function new() 
	{
		super();
		
		var wall = new Wall(800, 20);
		
		var wall2 = new Wall(480, 20);
		wall2.rotation = 90;
		wall2.x = 20;
		
		var wall3 = new Wall(800, 20);
		wall3.y = 460;
		
		var wall4 = new Wall(480, 20);
		wall4.rotation = 90;
		wall4.x = 800;
		
		mHero = new Player();
		mHero.x = 400;
		mHero.y = 240;
		
		mCamera.follow(mHero);
		mCamera.setPos(400, 240);
		
		add(mHero);
		add(wall);
		add(wall2);
		add(wall3);
		add(wall4);
		
		mTime = 0;
		
		for (i in 0 ... 10) {
			var bad = new Bady();
			bad.x = 30 + Math.random() * 740;
			bad.y = 30 + Math.random() * 420;
			add(bad);
			//bad.moveTo(Vec2.get(400,240));
		}
		
		for (i in 0 ... 10) {
			var bad = new Crate();
			bad.x = 30 + Math.random() * 740;
			bad.y = 30 + Math.random() * 420;
			add(bad);
		}
		
		Lib.current.stage.addEventListener(MouseEvent.CLICK, onWorldClicked);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		Lib.current.stage.addEventListener(MouseEvent.RIGHT_CLICK, onRightClick);
		
		Lib.current.stage.addEventListener(TouchEvent.TOUCH_TAP, onWorldClicked);
		Lib.current.stage.addEventListener(TouchEvent.TOUCH_BEGIN, onWorldClicked);
	}
	
	private function onRightClick(e:Event):Void 
	{
		
	}
	
	private function onMouseUp(e:Event):Void 
	{
		mMouseDown = false;
	}
	
	private function onMouseDown(e:Event):Void 
	{
		if (!Std.is(e.target, Entity))
			mMouseDown = true;
	}
	
	private function onWorldClicked(e:Event):Void 
	{
		
		var clickPos = Vec2.get( mGameWorld.mouseX, mGameWorld.mouseY);
		
		if (Std.is(e.target, Entity))
		{
			var ent : Entity = e.target;
			mHero.interractWith(ent);
			mMouseDown = false;
		}
		else
			mHero.moveTo(clickPos);
	}
	
	override public function update(delta : Float) {
		
		super.update(delta);
		
		if (mMouseDown) {
			var clickPos = Vec2.get( mGameWorld.mouseX, mGameWorld.mouseY);
			mHero.moveTo(clickPos);
		}
	}
	
}