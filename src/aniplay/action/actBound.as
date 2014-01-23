package aniplay.action 
{
	import aniplay.display.APView;
	import flash.display.Stage;
	/**
	 * ...
	 * @author junsucom
	 */
	public class actBound extends APAction 
	{
		private var m_stage:Stage;
		private var m_radius:Number;
		private var m_friction :Number;
		
		public function actBound(_radius:Number,_friction:Number=1 ) 
		{
			m_radius = _radius;
			m_friction = _friction;
		}
		
		public function setStage(_stage:Stage):void
		{
			if(!m_stage)
			m_stage = _stage;
		}
		
		override public function doAct(_view:APView, time:uint):void
		{
			var uCircleRadius:uint = m_radius;
			var iFiction:Number = m_friction;
			
			if (_view.x + uCircleRadius > m_stage.stageWidth)
			{
				_view.x = m_stage.stageWidth-uCircleRadius;
				_view.xVelocity *= -m_friction;
			}
			if (_view.x - uCircleRadius < 0)
			{
				_view.x = uCircleRadius;
				_view.xVelocity *= -m_friction;
			}
			if (_view.y + uCircleRadius >  m_stage.stageHeight)
			{
				_view.y = m_stage.stageHeight - uCircleRadius ;
				_view.yVelocity *= -m_friction;
			}
			if (_view.y - uCircleRadius < 0)
			{
				_view.y = uCircleRadius;
				_view.yVelocity *= -m_friction;
			}
		}
	}

}