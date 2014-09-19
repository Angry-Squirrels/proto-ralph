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
	var mEntitesByGroup : Map<GroupName, Array<Entity>>;
	
	var mPaused : Bool;
	
	var mGameWorld : Sprite;
	var mGuiLayer : Sprite;
	
	var mCamera : Camera;
	
	public function new() 
	{
		super();
		
		mCamera = new Camera(0,0);
		
		mGameWorld = new Sprite();
		addChild(mGameWorld);
		mGameWorld.addChild(mCamera);
		
		mEntities = new EntityList();
		mEntitiesToRemove = new Array<Entity>();
		mEntitesByGroup = new Map<GroupName, Array<Entity>>();
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
	
	public function getEntitiesByGroup(group : GroupName) : Array<Entity> {
		return mEntitesByGroup[group];
	}
	
	public function update(delta : Float) {
	}
	
	public function getGameWorld() : Sprite {
		return mGameWorld;
	}
	
	public function add(ent : Entity) {
		mEntities.add(ent);
		mGameWorld.addChild(ent);
		
		if (mEntitesByGroup[ent.group] == null)
			mEntitesByGroup[ent.group] = new Array<Entity>();
		
		var groupAr = mEntitesByGroup[ent.group];
		groupAr.push(ent);
	}
	
	public function remove(ent : Entity, free : Bool = true) {
		ent.canFree = free;
		mEntitiesToRemove.push(ent);
		
		var groupAr = mEntitesByGroup[ent.group];
		groupAr.remove(ent);
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