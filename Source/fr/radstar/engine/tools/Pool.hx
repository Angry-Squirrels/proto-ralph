package fr.radstar.engine.tools;

/**
 * ...
 * @author Ynk33
 */
class Pool
{
	var mPool:Map < String, Array<IPoolable> > ;
	
	public function new() 
	{
		mPool = new Map < String, Array<IPoolable> > ();
	}
	
	public function getItem(className:String):IPoolable
	{
		if (!mPool.exists(className))
		{
			mPool.set(className, new Array<IPoolable>());
		}
		var array:Array<IPoolable> = mPool.get(className);
		
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
		
		if (!mPool.exists(className))
		{
			mPool.set(className, new Array<IPoolable>());
		}
		mPool[className].push(item);
	}
}