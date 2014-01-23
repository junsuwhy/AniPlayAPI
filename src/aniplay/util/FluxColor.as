package aniplay.util 
{
	/**
	 * ...
	 * @author ...
	 */
	public class FluxColor 
	{
		private var m_uVar:uint;
		private var m_uColor:uint;
		private const PI:Number=3.1415926
		
		public function FluxColor (_uNum:uint)
		{
			m_uVar = _uNum;
			var R:uint = uint(192+32*Math.sin(m_uVar/33*PI/30));
			var G:uint = uint(192+32*Math.sin((m_uVar/33+20)*PI/30));
			var B:uint = uint(192+ 32 * Math.sin((m_uVar/33 + 40) * PI / 30));
			
			var strR:String = (R.toString(16).length < 2)? "0" + R.toString(16):R.toString(16);
			var strG:String = (G.toString(16).length < 2)? "0" + G.toString(16):G.toString(16);
			var strB:String = (B.toString(16).length < 2)? "0" + B.toString(16):B.toString(16);
			
			var strColor:String = "0x" + strR + strG + strB;
			m_uColor = uint(strColor);
		}
		
		public function getColor(_num:uint=0):uint {
			if (_num == 0) return m_uColor
			else {
				var R:uint = uint(192+32*Math.sin((m_uVar/33+_num)*PI/30));
				var G:uint = uint(192+32*Math.sin((m_uVar/33+20+_num)*PI/30));
				var B:uint = uint(192+ 32 * Math.sin((m_uVar/33 + 40+_num) * PI / 30));
				
				var strR:String = (R.toString(16).length < 2)? "0" + R.toString(16):R.toString(16);
				var strG:String = (G.toString(16).length < 2)? "0" + G.toString(16):G.toString(16);
				var strB:String = (B.toString(16).length < 2)? "0" + B.toString(16):B.toString(16);
				
				var strColor:String = "0x" + strR + strG + strB;
				return uint(strColor);
				
			}
			
		}
	}

}