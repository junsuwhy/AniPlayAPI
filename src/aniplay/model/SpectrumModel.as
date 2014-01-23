package aniplay.model 
{
	import flash.utils.ByteArray;
	import flash.media.SoundMixer;
	import aniplay.util.LoadMp3File;
	
	/**
	 * ...
	 * @author junsucom
	 */
	public class SpectrumModel
	{
		//普通的波形陣列
		private var m_arrNormal:Array;
		//經Fourier轉換的陣列，0是低頻，255是高頻
		private var m_arrFFT:Array;
		//經過排序的FFT陣列，255可取得最大值
		private var m_arrFFTSort :Array;
		//前一個影格的FFT陣列
		private var m_arrLastFFT:Array;

		//此影格和前影格FFT陣列的差
		private var m_arrFFTDiffByFrame:Array;
		//與前影格FFT陣列的差，並經過排序，255可取得最大值
		private var m_arrFFTDiffByFrameSort:Array;
		
		private var m_uCount:uint = 0;
		
		private var m_numMax:Number ;
		private var m_numFreq:uint ;
		
		private var m_numDiffMax : Number;
		private var m_numDiffFreq :uint;
		
		private var m_numAveNormal:Number;
		private var m_numAveFFT:Number;
	

		
		
		private var baSpectrum:ByteArray ;
		private var mySound:LoadMp3File;
		
		
		public function SpectrumModel(_file:String) 
		{
			baSpectrum = new ByteArray();
			mySound = new LoadMp3File(_file);
		}
		
		public function playSound():void {
			mySound.play();
		}
		
		/**
		 * 傳回經Fast Fourier Transform的陣列
		 */
		public function get SpectFFTArray():Array
		{
			return m_arrFFT;
		}
		/**
		 * 傳回一般的聲波陣列
		 */
		public function get SpectNormalArray():Array
		{
			return m_arrNormal;
		}
		/**
		 * FFT跟上一次的聲音切片的差別陣列
		 */
		public function get FFTDiffArray():Array
		{
			return m_arrFFTDiffByFrame
		}
		public function get FFTMaximum():Number
		{
			return m_numMax;
		}
		public function get indexOfFFTMaxtmum():Number
		{
			return m_numDiffFreq;
		}
		public function get FFTAverage():Number
		{
			return m_numAveFFT;
		}
		public function get SpectAverage():Number
		{
			return m_numAveNormal;
		}
		public function get FFTDiffMaximum():Number
		{
			return m_arrFFTSort[m_arrFFTSort.length-1]
		}
		
		
		
		
		private function getSpectrumByteArray():ByteArray {
			SoundMixer.computeSpectrum(baSpectrum, false, 0);
			return baSpectrum;
		}
		
		public function getSpectrumArray():Array {
			var myByteArray:ByteArray = getSpectrumByteArray();
			var myArray:Array = new Array();
			for(var i:int = 0; i < 256; i +=2){
				myArray.push(myByteArray.readFloat());
			}
			return myArray
		}
		
		private function getFFTSpectrumByteArray():ByteArray {
			SoundMixer.computeSpectrum(baSpectrum, true, 0);
			return baSpectrum;
		}
		
		public function getFFTSpectrumArray():Array {
			SoundMixer.computeSpectrum(baSpectrum, true, 0);
			var myArray:Array = new Array();
			for(var i:int = 0; i < 256; i +=2){
				myArray.push(baSpectrum.readFloat());
			}
			return myArray
		}
		
		public function getData():void
		{
			if (m_arrFFT != null) {
				m_arrLastFFT = new Array();
				for (var i:int = 0; i < m_arrFFT.length; i++)
				{
					m_arrLastFFT[i] = m_arrFFT[i];
				}
			}
			m_arrNormal = getSpectrumArray();
			m_arrFFT = getFFTSpectrumArray();

			
			m_arrFFTDiffByFrame = new Array();
			m_arrFFTDiffByFrameSort = new Array();
			if (m_arrLastFFT != null)
			{
				for (var i:int = 0; i < m_arrFFT.length; i++)
				{
					m_arrFFTDiffByFrame[i] = m_arrFFT[i] - m_arrLastFFT[i];
					m_arrFFTDiffByFrameSort[i] = m_arrFFTDiffByFrame[i];
				}
				m_arrFFTDiffByFrameSort.sort();
				m_numDiffMax =	m_arrFFTDiffByFrameSort[m_arrFFTDiffByFrameSort.length - 1];
				m_numFreq = m_arrFFTDiffByFrame.indexOf(m_numDiffMax);
				
			}
			
			
			m_arrFFTSort = new Array();
			m_numAveFFT = 0;
			m_numAveNormal = 0;
			for (var i:int = 0; i < m_arrFFT.length; i++)
			{
					m_arrFFTSort[i] = m_arrFFT[i];
					m_numAveFFT += m_arrFFT[i];
					m_numAveNormal += m_arrNormal[i];
					
			}
			m_numAveFFT /= m_arrFFT.length;
			m_numAveNormal/=m_arrFFT.length;
			
			
			m_numMax= m_arrFFTSort.sort()[m_arrFFTSort .length - 1];
			m_numFreq = m_arrFFT.indexOf(m_numMax);
			
		}
		

		
		
	}

}