package fr.radstar ;


import openfl.display.Sprite;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		
		addChild(Engine.getInstance());
	}
	
	
}