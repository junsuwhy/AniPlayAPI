package aniplay.display 
{
	/**
	 * ...
	 * @author ...
	 */
	public class APLine extends APView 
	{
		private var m_x1:Number;
		private var m_y1:Number;
		private var m_x2:Number;
		private var m_y2:Number;
		
		public function APLine() 
		{
			super();
			
		}
		
		public function setPoint(x1:Number, y1:Number, x2:Number, y2:Number):void
		{
			m_x1 = x1 ;
			m_y1 = y1 ;
			m_x2 = x2 ;
			m_y2 = y2 ;
		}
		
		override protected function update():void
		{
			graphics.clear();
			graphics.lineStyle(1, 0x336699);
			graphics.moveTo(m_x1, m_y1);
			graphics.lineTo(m_x2, m_y2);
		}
		
	}

}