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

	public function new() 
	{
		super();
		
		mEntities = new EntityList();
		mEntitiesToRemove = new Array<Entity>();
		mPaused = true;
	}
	
	@:final
	public function mainUpdate(delta : Float) {
		if (!mPaused) {
			var entity = mEntities.first;
			while (entity != null) {
				entity.update(delta);
				entity = entity.next;
			}
			
			update(delta);
		
			while (mEntitiesToRemove.length > 0)
				removeChild(mEntitiesToRemove.shift());
		}
	}
	
	public function update(delta : Float) {
	}
	
	public function add(ent : Entity) {
		mEntities.add(ent);
		addChild(ent);
	}
	
	public function remove(ent : Entity) {
		mEntitiesToRemove.push(ent);
	}
	
	public function play() {
		
	}
	
	public function pause() {
		
	}
	
	public function stop() {
		
	}
	
}