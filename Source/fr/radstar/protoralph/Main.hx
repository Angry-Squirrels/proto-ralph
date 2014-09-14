package fr.radstar.protoralph ;

import fr.radstar.protoralph.scenes.Test;
import openfl.display.Sprite;
import fr.radstar.engine.Engine;

class Main extends Sprite {
	
	var mEngine : Engine;
	
	public function new () {
		
		super ();
		
		mEngine = Engine.getInstance();
		addChild(mEngine);
		
		mEngine.gotoScene(new Test());
	}
	
	
}