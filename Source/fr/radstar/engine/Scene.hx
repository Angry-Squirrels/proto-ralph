package fr.radstar.engine ;
import openfl.display.Sprite;

/**
 * ...
 * @author TBaudon
 */
class Scene extends Sprite
{
	
	var mEntities : EntityList;
	var mEntitiesToRemove : Array<Entity>;
	
	var mPaused : Bool;
	
	var mGameWorld : Sprite;
	var mGuiLayer : Sprite;
	
	var mCamera : Camera;
	
	public function new() 
	{
		super();
		
		mCamera = new Camera(0,0);
		addChild(mCamera);
		
		mGameWorld = new Sprite();
		addChild(mGameWorld);
		
		mEntities = new EntityList();
		mEntitiesToRemove = new Array<Entity>();
		mPaused = true;
		
		mGuiLayer = new Sprite();
		addChild(mGuiLayer);
	}
	
	@:final
	public function mainUpdate(delta : Float) {
		if (!mPaused) {
			var entity = mEntities.first;
			while (entity != null) {
				entity.mainUpdate(delta);
				entity = entity.next;
			}
			
			update(delta);
			
			mCamera.mainUpdate(delta);
		
			while (mEntitiesToRemove.length > 0) {
				var ent = mEntitiesToRemove.shift();
				mGameWorld.removeChild(ent);
				mEntities.remove(ent);
			}
		}
	}
	
	public function update(delta : Float) {
	}
	
	public function add(ent : Entity) {
		mEntities.add(ent);
		mGameWorld.addChild(ent);
	}
	
	public function remove(ent : Entity, free : Bool = true) {
		ent.canFree = free;
		mEntitiesToRemove.push(ent);
	}
	
	public function play() {
		mPaused = false;
	}
	
	public function pause() {
		mPaused = true;
	}
	
	public function stop() {
		mPaused = false;
	}
	
}