package {
	import flash.events.Event;

	public class AppEvent extends Event {
		public static const CHILD_DATA: String = "child_data";
		public var data: Object;

		public function AppEvent($type: String, $data: Object = null, $bubbles: Boolean = false) {
			// constructor code
			data = $data;
			super($type, $bubbles);
			
			trace('inside AppEvent emitter: ', $type, JSON.stringify($data), $bubbles)

		}
		/*
		override public function clone(): Event {
			return new AppEvent(type, data, bubbles);
		}
		*/

	}

}