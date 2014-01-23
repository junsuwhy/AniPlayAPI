package aniplay.display 
{
	/**
	 * ...
	 * @author junsuwhy
	 */
	public class APSpectrumFilledCircle extends APView
	{
		private var m_uRadius:uint=50;
		private var m_uAmpRadius:uint=100;
		
		private var m_arrSpecData:Array;
		
		public function APSpectrumFilledCircle() 
		{
			
		}
		
		public function set setArray(_arr:Array):void
		{
			m_arrSpecData = _arr;
		}
		
		override protected function update():void
		{
				graphics.clear();
				var m_arr:Array = m_arrSpecData;
				graphics.lineStyle(2, 0x000000);	
				graphics.beginFill(color);
			
			
			
			var dLastRadius:Number = m_uRadius + m_arr[0] * m_uAmpRadius;
			var dLastAngle:Number = 0;
			var dCurrRadius:Number;
			var dCurrAngle:Number;
			graphics.moveTo( dLastRadius * Math.sin(dLastAngle),  dLastRadius * Math.cos(dLastAngle))
			
			for (var i:int = 1; i < m_arr.length ; i++) {
				dCurrRadius =  m_uRadius + m_arr[i] * m_uAmpRadius;
				dCurrAngle = i * 2 * PI / m_arr.length;
				
				graphics.lineTo(dCurrRadius * Math.sin(dCurrAngle),dCurrRadius * Math.cos(dCurrAngle));
				
				dLastRadius = dCurrRadius;
				dLastAngle = dCurrAngle;
				}
				
			dCurrRadius =  m_uRadius + m_arr[0] * m_uAmpRadius;
			dCurrAngle = 0 * 2 * PI / m_arr.length ;
			graphics.moveTo(dLastRadius*Math.sin(dLastAngle),dLastRadius*Math.cos(dLastAngle))
			graphics.lineTo( dCurrRadius * Math.sin(dCurrAngle), dCurrRadius * Math.cos(dCurrAngle));
				
			graphics.endFill();
		}
		
		
	}

}