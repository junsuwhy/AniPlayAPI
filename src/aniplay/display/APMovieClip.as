package aniplay.display 
{
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author junsucom
	 */
	public class APMovieClip extends APView 
	{
		private var m_class:Class;
		
		public function APMovieClip(_class:Class) 
		{
			m_class = _class;
		}
		
		override public function draw():void
		{
			addChild(DisplayObject(new m_class()));
		}
		
	}

}