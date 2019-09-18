package {
	import feathers.controls.Button;
	import feathers.controls.TextCallout;
	import feathers.themes.MetalWorksMobileTheme;
	import feathers.layout.*;

	import starling.display.Sprite;
	import starling.events.Event;
	import flash.display.MovieClip;

	import flash.events.Event

	[SWF(width = "400", height = "300", frameRate = "60", backgroundColor = "#ffff")]
	public class HelloWorld extends Sprite {

		public static var _this: Object; // class root

		public function HelloWorld() {
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		protected var button: Button;

		protected function addedToStageHandler(event: Event): void {
			
			new MetalWorksMobileTheme();

			this.button = new Button();
			this.button.label = "Click Me";
			this.button.width = 100;
			this.button.height = 50;
			this.addChild(button);

			this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler);

			button.horizontalAlign = HorizontalAlign.CENTER;
			button.verticalAlign = VerticalAlign.MIDDLE;

			this.button.x = (this.stage.stageWidth - this.button.width) / 2;
			this.button.y = (this.stage.stageHeight - this.button.height) / 2;
			this.button.validate();
		}

		protected function button_triggeredHandler(event: Event): void {
			TextCallout.show("Hi, I'm Feathers!\nHave a nice day.", this.button);


			_this.store += 100
			trace(_this.store)
			
			
			dispatchEvent(new AppEventStarling(AppEventStarling.CHILD_DATA, {
					payload: {
						data: 100,
						meta: "update_store_timeline"
					}
				},
				true));

		}
	}
}