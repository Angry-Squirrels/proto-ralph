package fr.radstar.engine ;
import openfl.events.Event;
import openfl.events.EventDispatcher;

/**
 * ...
 * @author TBaudon
 */
class EntityList
{
	public var first : Entity;
	public var last : Entity;

	public function new() 
	{
		first = null;
		last = null;
	}
	
	public function add(ent : Entity) {
		if (first == null){
			first = ent;
			last = ent;
		}else {
			ent.prev = last;
			last.next = ent;
			last = ent;
		}
	}
	
	public function remove(ent : Entity) {
		if (ent.prev == null && ent.next == null)
			throw "not in the list";
			
		if (ent == last)
			last = ent.prev;
		if (ent == first)
			first = ent.next;
		
		if (ent.prev != null)
			ent.prev.next = ent.next;
			
		if (ent.next != null)
			ent.next.prev = ent.prev;
		
		if (ent.canFree) 
			ent.free();
	}
	
}