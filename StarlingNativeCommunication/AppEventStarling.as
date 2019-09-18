package {
	import flash.display.MovieClip;
	import starling.events.Event;

	public class AppEventStarling extends Event {
		public static const CHILD_DATA: String = "child_data";

		public static var _this: Object; // class root		

		public function AppEventStarling($type: String, $data: Object = null, $bubbles: Boolean = false) {
			// constructor code
			//data = $data;

			super($type, $bubbles);

			trace('inside AppEvent emitter: ', $type, JSON.stringify($data), $bubbles, $data.payload.meta)
			//this.getPayload($data)

			switch($data.payload.meta){
				case "update_store_timeline":
					this.updateStoreTimeline($data.payload.data)
					break
			}
		}

		private function updateStoreTimeline(state): void {
			trace("AppEventStarling", _this.btn_1.alpha)
			_this.store += state
			_this.btn_1.txt_btn.text = "Counter: "+_this.store
			
			if(_this.store >= 1000){
				_this.loadSWF()				
			}
		}

	}

}