package aniplay.action 
{
	import aniplay.display.APView;
	/**
	 * ...
	 * @author junsucom
	 */
	public class actGravity extends APAction
	{
		private var m_fGravity:Number;
		
		public function actGravity(_gravity:Number) 
		{
			m_fGravity = _gravity;
		}
		
		override public function doAct(_view:APView,_time:uint):void
		{
			_view.yAccelerate += m_fGravity * _time / 33;
			
		}
		
		
	}

}