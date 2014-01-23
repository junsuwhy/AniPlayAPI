package aniplay.control 
{
	import aniplay.display.APSpectrumFilledCircle;
	import aniplay.display.APView;
	import aniplay.model.SpectrumModel;
	import aniplay.util.FluxColor;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author junsuwhy
	 */
	public class SpectrumControl2 extends SpectrumControl 
	{
		var m_apvCircle:APSpectrumFilledCircle;
		
		public function SpectrumControl2(_sModel:SpectrumModel,_sView:APView) 
		{
			super(_sModel, _sView);
			m_apvCircle = new APSpectrumFilledCircle();
			view.addView(m_apvCircle);
			
		}
		
		override protected function step():void
		{
			var color:FluxColor = new FluxColor(getTimer());
			m_apvCircle.color = color.getColor();
			m_apvCircle.setArray=sModel.getFFTSpectrumArray();
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
			
		}
		
	}

}