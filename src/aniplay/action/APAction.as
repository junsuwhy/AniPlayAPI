package aniplay.action 
{
	import aniplay.display.APView;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author junsucom
	 */
	public class APAction 
	{
		protected var m_map:Dictionary;
		
		public function APAction() 
		{
			m_map = new Dictionary();
		}
		
		public function setMap(_view:APView, _str:String, _val:*):void
		{
			if (!m_map[_view])
			{
				m_map[_view] = new Array();
			}
			m_map[_view][_str] = _val;
		}
		
		//繼承時實作
		public function doAct(view:APView,time:uint):void
		{

		}
		
		
	}

}