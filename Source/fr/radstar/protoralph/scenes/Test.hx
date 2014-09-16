package fr.radstar.protoralph.scenes;
import fr.radstar.engine.Camera;
import fr.radstar.engine.Scene;
import fr.radstar.protoralph.entities.Player;
import fr.radstar.protoralph.entities.Wall;
import nape.geom.Vec2;

/**
 * ...
 * @author TBaudon
 */
class Test extends Scene
{
	
	var mTime : Float;
	var mHero : Player;

	public function new() 
	{
		super();
		
		var wall = new Wall(800, 20);
		var wall2 = new Wall(480, 20);
		wall2.rotation = 90;
		wall2.x = 20;
		var wall3 = new Wall(800, 20);
		var wall4 = new Wall(480, 20);
		
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
		
		mHero.body.applyImpulse(Vec2.weak(-10, 0));
		
		mTime = 0;
	}
	
	override public function update(delta : Float) {
		
		super.update(delta);
		
		
	}
	
}