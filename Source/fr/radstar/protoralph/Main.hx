package fr.radstar.protoralph ;

import openfl.display.Sprite;
import fr.radstar.engine.Engine;

class Main extends Sprite {
	
	var mEngine : Engine;
	
	public function new () {
		
		super ();
		
		mEngine = Engine.getInstance();
		addChild(mEngine);
		
		
	}
	
	
}