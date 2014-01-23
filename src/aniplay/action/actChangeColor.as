package aniplay.action 
{
	import aniplay.util.FluxColor;
	import flash.utils.getTimer;
	import aniplay.display.APView;
	
	/**
	 * ...
	 * @author ...
	 */
	public class actChangeColor extends APAction 
	{
		
		private var m_uColor:uint;
		private var m_color:FluxColor;
		
		public function actChangeColor() 
		{
			
		}
		
		//繼承時實作
		override public function doAct(view:APView,time:uint):void
		{
			m_color = new FluxColor(getTimer());
			var constant:uint = 0;
			if (m_map[view])
				if (m_map[view]["constant"]) constant = m_map[view]["constant"];
			
			view.color = m_color.getColor(constant);
			
		}
		
	}

}