package fr.radstar.tools;

/**
 * ...
 * @author Ynk33
 */
class Pool
{
	var mpool:Map < String, Array<IPoolable> > ;
	
	public function new() 
	{
		mpool = new Map < String, Array<IPoolable> > ();
	}
	
	public function getItem(className:String):IPoolable
	{
		if (!mpool.exists(className))
		{
			mpool.set(className, new Array<IPoolable>());
		}
		var array:Array<IPoolable> = mpool.get(className);
		
		if (array.length == 0)
		{
			return Type.createEmptyInstance(Type.resolveClass(className));
		}
		else
		{
			return array.pop();
		}
	}
	
	public function freeItem(item:IPoolable):Void
	{
		item.free();
		var className:String = Type.getClassName(Type.getClass(item));
		
		if (!mpool.exists(className))
		{
			mpool.set(className, new Array<IPoolable>());
		}
		mpool[className].push(item);
	}
}