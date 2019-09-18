﻿/**
 * Scroller
 * ---------------------
 * VERSION: 1.0
 * DATE: 4/08/2010
 * AS3
 * UPDATES AND DOCUMENTATION AT: http://www.FreeActionScript.com
 **/
package com.freeactionscript
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ScrollBar extends MovieClip
	{
		private var yOffset:Number;
		private var yMin:Number;
		private var yMax:Number;
		
		public function ScrollBar()
		{
			yMin = 0;
			yMax = track_mc.height - thumb_mc.height;
			thumb_mc.addEventListener(MouseEvent.MOUSE_DOWN, thumbDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, thumbUp);
		}
		
		private function thumbDown(event:MouseEvent):void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, thumbMove);
			yOffset = mouseY - thumb_mc.y;
		}

		private function thumbUp(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, thumbMove);
		}

		private function thumbMove(event:MouseEvent):void
		{
			thumb_mc.y = mouseY - yOffset;
			
			if (thumb_mc.y <= yMin)
			{				
				thumb_mc.y = yMin;
			}
			if (thumb_mc.y >= yMax)
			{
				thumb_mc.y = yMax;
			}
			
			dispatchEvent(new ScrollBarEvent(thumb_mc.y / yMax));
			
			event.updateAfterEvent();
		}
	}
}
