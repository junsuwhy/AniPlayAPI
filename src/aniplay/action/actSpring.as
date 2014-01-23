package aniplay.action 
{
	import aniplay.display.APView;
	/**
	 * ...
	 * @author junsucom
	 */
	public class actSpring extends APAction 
	{
		
		private var m_fMultiple:Number;
		
		public function actSpring(_fM:Number) 
		{
			
			m_fMultiple = _fM;
		}
		
		override public function doAct(_view:APView,_time:uint):void
		{
			for (var i:int = 0; i < m_map[_view]["target"].length; i++)
			{
				_view.xAccelerate += (m_map[_view]["target"][i].x - _view.x) * m_fMultiple ;
				_view.yAccelerate += (m_map[_view]["target"][i].y - _view.y) * m_fMultiple ;
				//trace(_view.yAccelerate);
			}
		}
		
	}

}