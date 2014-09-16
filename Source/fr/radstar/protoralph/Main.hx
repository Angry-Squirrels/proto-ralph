package fr.radstar.protoralph ;

import fr.radstar.protoralph.scenes.Test;
import nape.geom.Vec2;
import openfl.display.Sprite;
import fr.radstar.engine.Engine;

class Main extends Sprite {
	
	var mEngine : Engine;
	
	public function new () {
		
		super ();
		
		mEngine = Engine.getInstance();
		addChild(mEngine);
		
		var space = mEngine.getSpace();
		space.gravity = Vec2.weak(0, 0);
		
		mEngine.gotoScene(new Test());
	}
	
	
}