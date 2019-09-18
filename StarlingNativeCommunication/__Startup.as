package {
	import flash.display.Sprite;
	import starling.core.Starling;

	[SWF(width = "400", height = "300", frameRate = "60", backgroundColor = "#ffff")]
	public class Startup extends Sprite {
		private var _starling: Starling;

		public function Startup(stage) {
			_starling = new Starling(Game, stage);
			_starling.start();

			trace(stage.stageWidth)
		}
	}


}


import starling.text.TextField;

class Game extends Sprite {
	public function Game() {
		var textField: TextField = new TextField(400, 300, "Welcome to Starling!");
		addChild(textField);
	}
}

import feathers.controls.Button;
import feathers.controls.TextCallout;
import feathers.themes.MetalWorksMobileTheme;

import starling.display.Sprite;
import starling.events.Event;

class HelloWorld extends Sprite {

	public function HelloWorld() {
		this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
	}

	protected var button: Button;

	protected function addedToStageHandler(event: Event): void {

		trace('addedToStageHandler')
		new MetalWorksMobileTheme();

		this.button = new Button();
		this.button.label = "Click Me";
		this.addChild(button);

		this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler);

		//this.button.x = (this.stage.stageWidth - this.button.width) / 2;
		//this.button.y = (this.stage.stageHeight - this.button.height) / 2;
		//this.button.validate();
	}

	protected function button_triggeredHandler(event: Event): void {
		TextCallout.show("Hi, I'm Feathers!\nHave a nice day.", this.button);
	}
}

/*
stop()

stage.frameRate = 60

import flash.display.Loader;
import flash.net.URLRequest;
import flash.display.MovieClip;

var loader: Loader = new Loader();

loadSWF();
function loadSWF(FileSWF = "Drawers Explorer.swf") {

	// URLRequest points to your external SWF
	var swfFile: URLRequest = new URLRequest(FileSWF);

	// Assign an event listener so that Flash informs you when the SWF has been loaded.
	loader.contentLoaderInfo.addEventListener(Event.OPEN, swfLoadedHandlerOpen);
	loader.contentLoaderInfo.addEventListener(Event.COMPLETE, swfLoadedHandlerComplete);

	function swfLoadedHandlerOpen(e: Event): void {
		trace("swfLoadedHandlerOpen");
	}

	function swfLoadedHandlerComplete(e: Event): void {
		trace("swfLoadedHandlerComplete");

		// access child (type 1)
		//Object(evt.target.content).updateForm(state_email, state_password)

		// access child (type 2)
		//Object(loader.content).updateForm(state_email, state_password, domain);

		loader.contentLoaderInfo.removeEventListener(Event.OPEN, swfLoadedHandlerOpen);
		loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, swfLoadedHandlerComplete);

	}

	//just add the loaded swf to container
	loader.load(swfFile);
	addChild(loader);

	setTimeout(function () {
		// removing the actual content from the place it was added
		removeChild(loader);
		// unloading and stoppping the loaded swf
		loader.unloadAndStop(true);
		trace('remove')
	}, 2000)

}
*/