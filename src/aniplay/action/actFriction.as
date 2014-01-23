package aniplay.action 
{
	import aniplay.display.APView;
	/**
	 * ...
	 * @author junsucom
	 */
	public class actFriction extends APAction
	{
		private var m_fMultipler:Number;
		
		public function actFriction (_fM:Number) 
		{
			m_fMultipler = _fM;
		}
		
		//繼承時實作
		override public function doAct(view:APView,_time:uint):void
		{
			view.xVelocity *= m_fMultipler;
			view.yVelocity *= m_fMultipler;
		}
		
		
	}

}