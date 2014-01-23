package aniplay.control 
{
	import aniplay.util.FluxColor;
	import flash.display.MovieClip;
	import flash.events.Event;
	import aniplay.display.APView;
	import aniplay.display.APCircle;
	import flash.utils.getTimer;
	
	
	/**
	 * ...
	 * @author junsuwhy
	 */
	public class BounceCtrl extends MovieClip
	{
		
		private var m_apv:APView;
		private var m_apvCircle:APCircle;
		
		public function BounceCtrl() 
		{
			addEventListener(Event.ENTER_FRAME, doEnterFrame)
			m_apv = new APView()
			addEventListener(Event.ENTER_FRAME, doEnterFrame);
			addChild(m_apv);
			m_apvCircle= new APCircle();
			
			
			m_apv.addView(m_apvCircle);
			
		}
		
		private function doEnterFrame(_evt:Event):void
		{
			var color:FluxColor = new FluxColor(getTimer());
			m_apvCircle.color = color.getColor;
			m_apvCircle.xAccelerate = (stage.mouseX - m_apvCircle.x) *50;
			m_apvCircle.xVelocity = m_apvCircle.xVelocity * 0.9;
			m_apvCircle.yAccelerate = (stage.mouseY - m_apvCircle.y) *50;
			m_apvCircle.yVelocity = m_apvCircle.yVelocity * 0.9;
			
			var uCircleRadius:uint = 50;
			
			if (m_apvCircle.x + uCircleRadius > stage.stageWidth)
			{
				m_apvCircle.x = stage.stageWidth-uCircleRadius;
				m_apvCircle.xVelocity *= -1;
			}
			if (m_apvCircle.x - uCircleRadius < 0)
			{
				m_apvCircle.x = uCircleRadius;
				m_apvCircle.xVelocity *= -1;
			}
			if (m_apvCircle.y + uCircleRadius >  stage.stageHeight)
			{
				m_apvCircle.y = stage.stageHeight-uCircleRadius;
				m_apvCircle.yVelocity *= -1;
			}
			if (m_apvCircle.y - uCircleRadius < 0)
			{
				m_apvCircle.y = uCircleRadius;
				m_apvCircle.yVelocity *= -1;
			}
			
			//var time:uint = ;
			m_apv.updateView(getTimer());
		}
		
	}

}