package fr.radstar.engine.tools;

/**
 * ...
 * @author Ynk33
 */
class Pool
{
	var mPool:Map < String, Array<IPoolable> > ;
	static var mInstance:Pool;
	
	public function new() 
	{
		mPool = new Map < String, Array<IPoolable> > ();
	}
	
	public static function getInstance():Pool
	{
		if (mInstance == null)
		{
			mInstance = new Pool();
		}
		return mInstance;
	}
	
	public function getItem(itemClass:Class<Dynamic>):IPoolable
	{
		var className = Type.getClassName(itemClass);
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