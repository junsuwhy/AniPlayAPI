package aniplay.control 
{
	import aniplay.display.APView;
	import flash.utils.getTimer;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class APControl extends MovieClip
	{
		public  var m_view:APView;		
		
		public function APControl(_view:APView) 
		{
			m_view = _view;
			addChild(m_view);
			addEventListener(Event.ENTER_FRAME, doEnterFrame);	
		}
		
		
		public function get view():APView
		{
			return m_view;
		}
		
		private function doEnterFrame(_evt:Event):void
		{
			
			//做每一影格要做的事
			step();

			//更新畫面
			m_view.updateView( getTimer());
			
			
		}
		
		//繼承之後須實做
		//每個影格會做的事
		protected function step():void
		{
			
		}
		
	}

}