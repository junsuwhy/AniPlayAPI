package aniplay.util 
{
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author junsucom
	 */
	public class LoadMp3File extends EventDispatcher
	{
		private var mySound:Sound = null;
		
		public function LoadMp3File(_file:String) 
		{
            mySound = new Sound();
            mySound.load(new URLRequest(_file));
			
			
		}
		
		public function play():void
		{
			mySound.play();
		}
		
	}

}