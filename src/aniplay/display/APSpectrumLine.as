package aniplay.display 
{
	/**
	 * ...
	 * @author ...
	 */
	public class APSpectrumLine extends APView 
	{
		private var m_uIteration:uint = 2;
		private var m_uLength:Number;
		private var m_uAmp:uint;
		private var m_arr:Array;
		private var m_uLineColor:uint=0xcc6633;
		
		public function APSpectrumLine() 
		{
			m_uLength = 128;
			m_uAmp = 100;
			m_arr = new Array();
		}
		
		override public function draw():void
		{
			graphics.lineStyle(2, m_uLineColor);	
			graphics.moveTo(-m_uLength/2, 0);			
			
			for(var i:int = 0; i < m_arr.length-1; i+=m_uIteration){
					graphics.lineTo((i+1)*m_uLength/m_arr.length -m_uLength/2, m_arr[i+1] * -m_uAmp);
				
			}
		}
		
		public function set setArray(_arr:Array):void
		{
			m_arr = _arr;
		}
		
		override protected function update():void
		{
			graphics.clear();
			draw();
		}
		
		public function drawLineP2P(_ix1:int, _iy1:int, _ix2:int, _iy2:int):void
		{
			x = (_ix1 + _ix2) / 2;
			y = (_iy1 + _iy2) / 2;
			var dx:int = _ix1 - _ix2;
			var dy:int = _iy1 - _iy2;
			m_uLength = Math.sqrt(dx * dx + dy * dy);
			m_uAmp = 5000 / m_uLength;
			rotation = (Math.atan2(dy, dx ) / PI * 180);
			
		}
		
	}

}