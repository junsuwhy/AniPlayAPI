package aniplay.action 
{
	import aniplay.display.APView
	/**
	 * ...
	 * @author ...
	 */
	public class actStill extends APAction 
	{
		
		public function actStill() 
		{
			
		}
		
		override public function doAct(_view:APView,_time:uint):void
		{
			_view.xVelocity = 0;
			_view.yVelocity = 0;
			_view.xAccelerate = 0;
			_view.yAccelerate = 0;
			
			
		}
		
		
	}

}