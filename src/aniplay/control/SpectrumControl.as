package aniplay.control
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;
	import aniplay.model.SpectrumModel;
	
	import aniplay.display.APView;
	
	/**
	 * ...
	 * @author junsucom
	 */
	public class SpectrumControl extends APControl
	{
		public  var sModel:SpectrumModel;
		public  var sView:APView;
		
		
		
		public function SpectrumControl(_sModel:SpectrumModel,_sView:APView) 
		{
			sModel = _sModel;
			super(_sView);
			sModel.playSound();
			
		}
		
		public function get model():SpectrumModel
		{
			return sModel;
		}
	
		
		//繼承之後須實做
		//每個影格會做的事
		override protected function step():void
		{
			//更新資料
			sModel.getData();
		}
		
		
	}

}