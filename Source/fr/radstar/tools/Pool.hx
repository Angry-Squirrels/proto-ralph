package fr.radstar.tools;

/**
 * ...
 * @author Ynk33
 */
class Pool
{
	var mpool:Map < Class, Array<IPoolable> > ;
	
	public function new() 
	{
		mpool = new Map < Class, Array<IPoolable> > ();
	}
	
	public function getItem(className:Class):IPoolable
	{
		if (mpool[className] == null)
		{
			mpool[className] = new Array<IPoolable>();
		}
		var array:Array<IPoolable> = mpool[className];
		
		if (array.length == 0)
		{
			return Type.createInstance<className>();
		}
		else
		{
			return array.pop();
		}
	}
	
	public function freeItem(item:IPoolable):Void
	{
		item.free();
		var className:Class = Type.getClass(item);
		
		if (mpool[className] == null)
		{
			mpool[className] = new Array<IPoolable>();
		}
		mpool[className].push(item);
	}
}