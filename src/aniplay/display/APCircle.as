package aniplay.display 
{
	import aniplay.display.APView;
	
	/**
	 * ...
	 * @author junsuwhy
	 */
	public class APCircle extends APView 
	{
		private var m_uRadius:uint;
		
		public function APCircle(radius:uint) 
		{
			m_uRadius = radius;
		}
		
		override public function draw():void
		{
			graphics.clear();
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, m_uRadius);
		}
		
		override protected function update():void
		{
			graphics.clear();
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, m_uRadius);
		}
		
	}

}