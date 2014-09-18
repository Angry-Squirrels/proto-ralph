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
		
		if (mPool[className] == null)
			mPool[className] = new Array<IPoolable>();
			
		var array:Array<IPoolable> = mPool[className];
		
		var item : IPoolable;
		
		if (array.length == 0)
			item = Type.createInstance(Type.resolveClass(className), []);
		else
			item = array.pop();
		
		return item;
	}
	
	public function freeItem(item:IPoolable):Void
	{
		item.reset();
		var className:String = Type.getClassName(Type.getClass(item));
		
		if (mPool[className] == null)
			mPool[className] = new Array<IPoolable>();
			
		mPool[className].push(item);
	}
}