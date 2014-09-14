package fr.radstar;

/**
 * ...
 * @author TBaudon
 */
class Scene
{
	
	var mEntities : EntityList;

	public function new() 
	{
		mEntities = new EntityList();
	}
	
	public function update(delta : Float) {
		var entity = mEntities.first;
		while (entity != null) {
			entity.update(delta);
			entity = entity.next;
		}
	}
	
	public function play() {
		
	}
	
	public function pause() {
		
	}
	
	public function stop() {
		
	}
	
}