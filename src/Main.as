package 
{
	import aniplay.control.BounceCtrl;
	import aniplay.control.SpectrumControl2;
	import aniplay.display.APView;
	import aniplay.display.APCircle;
	import aniplay.model.SpectrumModel;
	import aniplay.util.LoadMp3File;
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	/**
	 * ...
	 * @author junsuwhy
	 */
	public class Main extends Sprite 
	{
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var sView:APView = new APView();
			var sModel:SpectrumModel = new SpectrumModel("love.mp3");
			// entry point
			var ctrl:SpectrumControl2 = new SpectrumControl2(new SpectrumModel("love.mp3"), sView);
			addChild(ctrl);
			
			
			
		}
		
		
	}
	
}