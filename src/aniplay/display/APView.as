package aniplay.display
{
	import aniplay.action.APAction;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author junsucom
	 */
	public class APView extends Sprite 
	{
		protected static const PI:Number = 3.1415926;
		//protected static const ANGLE_VEL:Number = 0.03;
		
		//新增加的子元件會出現在哪個座標
		protected var m_iCenterX:int=320;
		protected var m_iCenterY:int=240;
		
		private var parentView:APView;
		//StaticView裝不會經過update函式更新的元件
		private var m_arrStaticView:Array;
		//DynamicView裝會經由update函式更新的元件
		private var m_arrDynamicView:Array;
		//private var m_arrFilter:Array;
		
		private var m_uBornTime:uint=getTimer();
		private var m_uLastUpdateTime:uint=m_uBornTime;
		private var m_uFateTime:uint;
		//public var m_uCount:uint;
		
		//public var DELAY:uint = 5;
		private var m_uColor:uint;
		
		//protected var m_arr:Array;
		
		//update時動作的參數，預設為每秒多少，若要改變單位則更動m_numTimeUnit
		//scaleX=scaleY*=1+this*time/1000
		private var m_numScaleMultipler:Number = 0;
		//要變淡則輸入例如" -0.1"
		private var m_numAlphaMultipler:Number=0;
		private var m_numRotateAngle:Number=0;
		private var m_fXVelocity:Number=0;
		private var m_fYVelocity:Number = 0;
		private var m_fXAccelerate:Number = 0;
		private var m_fYAccelerate:Number= 0;
		
		//每個動作作用時間是以幾毫秒為單位?
		private var m_numTimeUnit:Number = 1000;
		
		public var isActing:Boolean = true;
		public var isUpdate:Boolean = true;
		
		//外掛事件
		private var m_arrActionList:Array=[];
		
		public function APView() 
		{
			
			m_arrStaticView = new Array();
			m_arrDynamicView = new Array();
			
		}
		
		{//get,set函式集
		public function get alphaMultipler():Number
		{
			return m_numAlphaMultipler;
		}
		public function set alphaMultipler(_fAM:Number):void
		{
			m_numAlphaMultipler = _fAM;
		}
		
		public function get scaleMultipler():Number
		{
			return m_numScaleMultipler;
		}
		public function set scaleMultipler(_fSM:Number):void
		{
			m_numScaleMultipler = _fSM;
		}
		public function get xVelocity():Number
		{
			return m_fXVelocity
		}
		public function set xVelocity(_xV:Number):void
		{
			m_fXVelocity = _xV;
		}
		public function get yVelocity():Number
		{
			return m_fYVelocity
		}
		public function set yVelocity(_yV:Number):void
		{
			m_fYVelocity = _yV;
		}
		
		public function get rotateAngle():Number
		{
			return m_numRotateAngle;
		}
		public function set rotateAngle(_fRA:Number):void
		{
			m_numRotateAngle = _fRA;
		}
		
		public function get xAccelerate():Number
		{
			return m_fXAccelerate;
		}
		public function set xAccelerate(_xA:Number):void
		{
			m_fXAccelerate = _xA;
		}
		public function get yAccelerate():Number
		{
			return m_fYAccelerate;
		}
		public function set yAccelerate(_yA:Number):void
		{
			m_fYAccelerate = _yA;
		}
		
		public function get xChildPosition():Number
		{
			return m_iCenterX;
		}
		public function set xChildPosition(_xA:Number):void
		{
			m_iCenterX = _xA;
		}
		public function get yChildPosition():Number
		{
			return m_iCenterY;
		}
		public function set yChildPosition(_yA:Number):void
		{
			m_iCenterY = _yA;
		}
		
		/**
		 * 設定此元件的生命週期，輸入為浮點數，單位為秒
		 */
		public function get life():Number
		{
			return m_uFateTime;
		}
		public function set life(_f:Number):void
		{
			m_uFateTime = uint(_f * 1000);
		}
		public function get color():uint
		{
			return m_uColor
		}
		public function set color(_u:uint):void
		{
			m_uColor = _u;
		}
		}
		
		
		//加入一個view
		public function addView(view:APView,_bIsDyn:Boolean=true):void
		{
			view.parentView = this;
			view.draw();
			if (_bIsDyn == true)
			{
				m_arrDynamicView.push(view);
			}
			else
			{
				m_arrStaticView.push(view);
			}
			addChild(view);
		}
		
		public function removeView(view:APView=null):void
		{
			if (view ==null)
			{
				if (parentView)
				{
					parentView.removeView(this);
				}
			}
			else if (m_arrStaticView.indexOf(view) >= 0)
			{
				m_arrStaticView.splice(m_arrStaticView.indexOf(view), 1);
				removeChild(view);
			}
			else if (m_arrDynamicView.indexOf(view) >= 0)
			{
				m_arrDynamicView.splice(m_arrDynamicView.indexOf(view) , 1);
				removeChild(view);
			}
			else 
			{
				throw "輸入的view不屬於這個view";
			}
		}
		
		public function addAction(_act:APAction,_arr:Array=null):void
		{
			if (isAction(_act))
			{
				trace("動作已經有了");
				return
			}
			m_arrActionList.push(_act);
			if (_arr)
			{
				for (var i:int = 0; i < _arr.length / 2; i++)_act.setMap(this,_arr[i], _arr[i + 1]);
			}
			
		}
		
		public function isAction(_act:APAction):Boolean
		{
			if (m_arrActionList.indexOf(_act) > -1)
				return true
			else
				return false;
		}
		
		public function removeAction(_act:APAction):void
		{
			if(m_arrActionList.indexOf(_act)>-1)
				m_arrActionList.splice(m_arrActionList.indexOf(_act), 1)
			else
				trace(_act + "不在列表裡面");
		}
		
		
		
		public function updateView(_time:uint):void
		{
			if (_time > m_uFateTime + m_uBornTime && m_uFateTime != 0)
			{
				removeView();
				return
			}
			
			var time:uint = _time-m_uLastUpdateTime;
			m_uLastUpdateTime = _time;
			
			if (isActing)
			{
				//複雜動作action
				for (var i:int = 0; i < m_arrActionList.length; i++)
				{
					m_arrActionList[i].doAct(this,time);
				}
				
				//簡單動作action
				scaleX *= 1+m_numScaleMultipler / m_numTimeUnit * time;
				scaleY *= 1+m_numScaleMultipler / m_numTimeUnit * time;
				alpha *= 1+m_numAlphaMultipler / m_numTimeUnit * time;
				rotation += m_numRotateAngle / m_numTimeUnit * time;
				
				m_fXVelocity += m_fXAccelerate / m_numTimeUnit * time;
				m_fYVelocity += m_fYAccelerate / m_numTimeUnit * time;
				x += m_fXVelocity / m_numTimeUnit * time ;// + m_fXAccelerate * time * time / m_numTimeUnit / m_numTimeUnit / 2;
				y += m_fYVelocity / m_numTimeUnit * time ;// + m_fYAccelerate * time * time / m_numTimeUnit / m_numTimeUnit / 2;
				m_fXAccelerate = 0;
				m_fYAccelerate = 0;
			}
			

			
			
			//while (m_arrDynamicView.length > DELAY) removeChild(m_arrDynamicView.shift());
			
			
			var view:APView;
			for (i = m_arrDynamicView.length-1; i>=0; i--)
			{
				
				view = m_arrDynamicView[i];
				view.updateView(_time);

			}
			for ( i = m_arrStaticView.length-1; i>=0; i--)
			{
				view = m_arrStaticView[i];
				view.updateView(_time);
			}
			
			if(isUpdate)	update();
		}
		
		//請在繼承時實作
		//建構一個實體時進行的函式
		public function draw():void
		{
			
		}
		
		//請在繼承時實作
		//每次呼叫更新時進行的函式
		protected function update():void
		{
			
		}
		
		//從外部呼叫update功能的函式
		//public function preUpdate():void
		//{
			//update();
		//}
		
	}

}