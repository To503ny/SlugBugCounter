package
{

	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.text.*;
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.net.*;
	import flash.geom.ColorTransform;
	import Winner;
	import flash.utils.Timer;

	public class MainDocument extends MovieClip
	{
		var player1Points: int;
		var player2Points: int;
		var player3Points: int;
		var DEFAULT_PLAYER_TEXT_MSG: String = "player name";
		var DEFAULT_POINTS: String = String(0);
		var myColorTransform = new ColorTransform();
		private var winner: Winner;
		public static var doc: MainDocument;
		var myTimer:Timer = new Timer(180,1);

		public function MainDocument()
		{
			// constructor code
			trace("main document is alive");
			//set winnnerScreen to invisible
			winnerScreen.visible = false;
			winner_lbl.visible = false;
			winnerName_lbl.visible = false;
			close_btn.visible = false;
			
			//set player points to zero
			player1Points = 0;
			player2Points = 0;
			player3Points = 0;

			//set player one points lbl
			player1Points_lbl.text = DEFAULT_POINTS;
			player2Points_lbl.text = DEFAULT_POINTS;
			player3Points_lbl.text = DEFAULT_POINTS;


			//set player text default 
			player1Name_txt.text = String("Tony");
			player2Name_txt.text = String("Brit");
			player3Name_txt.text = String("amiyah");
			
			//Mouse event listener for close_btn
			close_btn.addEventListener(MouseEvent.MOUSE_DOWN, removeWinnerScreen);

			//Mouse event listeners for add points
			player1AddPoint_btn.addEventListener(MouseEvent.MOUSE_UP, player1AddPointMouse);
			player1AddPoint_btn.addEventListener(MouseEvent.MOUSE_DOWN, addPointChangeColor);
			player2AddPoint_btn.addEventListener(MouseEvent.MOUSE_UP, player2AddPointMouse);
			player2AddPoint_btn.addEventListener(MouseEvent.MOUSE_DOWN, addPointChangeColor);
			player3AddPoint_btn.addEventListener(MouseEvent.MOUSE_UP, player3AddPointMouse);
			player3AddPoint_btn.addEventListener(MouseEvent.MOUSE_DOWN, addPointChangeColor);

			//Mouse event listeners for subtract points
			player1SubPoint_btn.addEventListener(MouseEvent.MOUSE_UP, player1SubtractPoint);
			player1SubPoint_btn.addEventListener(MouseEvent.MOUSE_DOWN, subChangeBackgroundColor);
			player2SubPoint_btn.addEventListener(MouseEvent.MOUSE_UP, player2SubtractPoint);
			player2SubPoint_btn.addEventListener(MouseEvent.MOUSE_DOWN, subChangeBackgroundColor);
			player3SubPoint_btn.addEventListener(MouseEvent.MOUSE_UP, player3SubtractPoint);
			player3SubPoint_btn.addEventListener(MouseEvent.MOUSE_DOWN, subChangeBackgroundColor);

			//Touch event listeners for add points
			player1AddPoint_btn.addEventListener(TouchEvent.TOUCH_BEGIN, player1AddPointTouch);
			player2AddPoint_btn.addEventListener(TouchEvent.TOUCH_BEGIN, player2AddPointTouch);
			player3AddPoint_btn.addEventListener(TouchEvent.TOUCH_BEGIN, player3AddPointTouch);

			//Touch Event listeners for subtract points
			player1SubPoint_btn.addEventListener(TouchEvent.TOUCH_BEGIN, player1SubtractPointTouch);
			player1SubPoint_btn.addEventListener(TouchEvent.TOUCH_END, subChangeBackgroundColor);
			player2SubPoint_btn.addEventListener(TouchEvent.TOUCH_BEGIN, player2SubtractPointTouch);
			player2SubPoint_btn.addEventListener(TouchEvent.TOUCH_END, subChangeBackgroundColor);
			player3SubPoint_btn.addEventListener(TouchEvent.TOUCH_BEGIN, player3SubtractPointTouch);
			player3SubPoint_btn.addEventListener(TouchEvent.TOUCH_END, subChangeBackgroundColor);

			//event listener for game over
			gameOver_btn.addEventListener(TouchEvent.TOUCH_BEGIN, gameOver);
			gameOver_btn.addEventListener(MouseEvent.MOUSE_UP, gameOver);
			
			//timer listener
			myTimer.addEventListener(TimerEvent.TIMER, defaultColor);
			
			//listener for player3Name_txt
			player3Name_txt.addEventListener(MouseEvent.CLICK, condenseForKeyBoard);
			player3Name_txt.addEventListener(TouchEvent.PROXIMITY_BEGIN, condenseForKeyBoardTouch);
			player3Name_txt.addEventListener(MouseEvent.ROLL_OUT, resetDefaultUiLocations);
			player3Name_txt.addEventListener(TouchEvent.PROXIMITY_OUT, resetDefaultUiLocationsTouch);

		} //end constructor
		
		function resetDefaultUiLocations (e:MouseEvent):void
		{
		//move ui controls back to default
			player2Name_txt.y = 360.45;
			player2Points_lbl.y = 408.4;
			player2AddPoint_btn.y = 402.6;
			player2SubPoint_btn.y = 402.6;
			
			
			player3Name_txt.y = 597.5;
			player3Points_lbl.y = 645.45;
			player3AddPoint_btn.y = 636.55;
			player3SubPoint_btn.y = 636.55;
		}
		function resetDefaultUiLocationsTouch (e:TouchEvent):void
		{
		//move ui controls back to default
			player2Name_txt.y = 360.45;
			player2Points_lbl.y = 408.4;
			player2AddPoint_btn.y = 402.6;
			player2SubPoint_btn.y = 402.6;
			
			
			player3Name_txt.y = 597.5;
			player3Points_lbl.y = 645.45;
			player3AddPoint_btn.y = 636.55;
			player3SubPoint_btn.y = 636.55;
		}

		function condenseForKeyBoard (e:MouseEvent): void
		{
			// move player 2 ui controls up	
			player2Name_txt.y = 251.25;
			player2Points_lbl.y = 299.2;
			player2AddPoint_btn.y = 293.4;
			player2SubPoint_btn.y = 293.4;
			
			//move player 3 ui controls up
			player3Name_txt.y = 380.5;
			player3Points_lbl.y = 428.45;
			player3AddPoint_btn.y = 419.55;
			player3SubPoint_btn.y = 419.55;
		}
		function condenseForKeyBoardTouch (e:MouseEvent): void
		{
			// move player 2 ui controls up	
			player2Name_txt.y = 251.25;
			player2Points_lbl.y = 299.2;
			player2AddPoint_btn.y = 293.4;
			player2SubPoint_btn.y = 293.4;
			
			//move player 3 ui controls up
			player3Name_txt.y = 380.5;
			player3Points_lbl.y = 428.45;
			player3AddPoint_btn.y = 419.55;
			player3SubPoint_btn.y = 419.55;
		}
		
		function defaultColor (e:TimerEvent):void
		{
			myColorTransform.color = 0X999999;
			color_bg.transform.colorTransform = myColorTransform;
		}

		function subChangeBackgroundColor(e: MouseEvent): void
		{
			myColorTransform.color = 0XD20000;
			color_bg.transform.colorTransform = myColorTransform;
		} //end function

		function addPointChangeColor(e: MouseEvent): void
		{
			myColorTransform.color = 0X337900;
			color_bg.transform.colorTransform = myColorTransform;
		} //end function
		
		function removeWinnerScreen(e:MouseEvent):void
		{
			trace("close_btn pressed");
			winnerScreen.visible = false;
			winner_lbl.visible = false;
			winnerName_lbl.visible = false;
			close_btn.visible = false;
		}

		//game over function
		function gameOver(e: MouseEvent): void
		{
			trace("game over");
			var player1Final = player1Points_lbl.text;
			var player2Final = player2Points_lbl.text;
			var player3Final = player3Points_lbl.text;

			if (player1Final > player2Final && player1Final > player3Final)
			{
				trace("player one wins");
				winnerScreen.visible = true;
				winner_lbl.visible = true;
				winnerName_lbl.visible = true;
				winner_lbl.text = "Won the Game";
				close_btn.visible = true;
				winnerName_lbl.text = player1Name_txt.text;
				trace(winnerName_lbl.text);
			} //end if
			else if (player2Final > player1Final && player2Final > player3Final)
			{
				trace("player 2 wins");
				winnerScreen.visible = true;
				winner_lbl.visible = true;
				winnerName_lbl.visible = true;
				winnerName_lbl.text = player2Name_txt.text;
				winner_lbl.text = "Won the Game";
				close_btn.visible = true;
				trace(winnerName_lbl.text);
			} //end else if
			else if (player3Final > player1Final && player3Final > player2Final)
			{
				trace("player 3 wins");
				winnerScreen.visible = true;
				winner_lbl.visible = true;
				winnerName_lbl.visible = true;
				close_btn.visible = true;
				winnerName_lbl.text = player3Name_txt.text;
				winner_lbl.text = "Won the Game";
				trace(winnerName_lbl.text);
			} //end else if
			else if (player1Final == player2Final || player1Final == player3Final)
			{
				trace("player 1 and 2 tie");
				winnerScreen.visible = true;
				winner_lbl.visible = true;
				winnerName_lbl.visible = true;
				close_btn.visible = true;
				if(player1Final == player2Final)
				{
					winnerName_lbl.text = player1Name_txt.text + " & " + player2Name_txt.text;
					winner_lbl.text = "Tie";
				}
				else if (player1Final == player3Final)
				{
					winnerName_lbl.text = player1Name_txt.text + " & " + player3Name_txt.text;
					winner_lbl.text = "Tie";
				}
				trace(winnerName_lbl.text);
			} //end else if
			else if (player1Final == player2Final || player1Final == player3Final || player2Final == player3Final)
			{
				winnerScreen.visible = true;
				winner_lbl.visible = true;
				winnerName_lbl.visible = true;
				close_btn.visible = true;
				if(player1Final == player2Final)
				{
				winnerName_lbl.text = player1Name_txt.text + " " + player2Name_txt.text;
					winner_lbl.text = "Tie";
				}
				else if (player1Final == player3Final)
				{
					winnerName_lbl.text = player1Name_txt.text + " " + player3Name_txt.text;
					winner_lbl.text = "Tie";
				}
				else if (player2Final == player3Final)
				{
					winnerName_lbl.text = player2Name_txt.text + " " + player3Name_txt.text;
					winner_lbl.text = "Tie";
				}
				trace(winnerName_lbl.text);
			} //end else if
			if(player1Final == player2Final && player1Final==player3Final)
			{
				winnerName_lbl.text = player1Name_txt.text + " " + player2Name_txt.text + " " + player3Name_txt.text;
				winner_lbl.text = "Tie";
			}
			
			//set points lbl to 0
			player1Points_lbl.text = String(0);
			player2Points_lbl.text = String(0);
			player3Points_lbl.text = String(0);
			//set player points to 0
			player1Points = 0;
			player2Points = 0;
			player3Points = 0;
			
		} //end function

		//subtract point functions for players
		function player1SubtractPoint(e: MouseEvent): void
		{
			trace("point subtracted from player 1 score");
			player1Points = player1Points - 1;
			trace(player1Points);
			player1Points_lbl.text = String(player1Points);
			myTimer.start();

		} //end subtract point
		function player1SubtractPointTouch(e: TouchEvent): void
		{
			trace("point subtracted from player 1 score");
			player1Points = player1Points - 1;
			trace(player1Points);
			player1Points_lbl.text = String(player1Points);
			myTimer.start();

		} //end subtract point

		function player2SubtractPoint(e: MouseEvent): void
		{
			trace("point subtracted from player 2 score");
			player2Points = player2Points - 1;
			trace(player2Points);
			player2Points_lbl.text = String(player2Points);
			myTimer.start();
			
		} //end subtract point
		function player2SubtractPointTouch(e: TouchEvent): void
		{
			trace("point subtracted from player 2 score");
			player2Points = player2Points - 1;
			trace(player2Points);
			player2Points_lbl.text = String(player2Points);
			myTimer.start();
		} //end subtract point

		function player3SubtractPoint(e: MouseEvent): void
		{
			trace("point subtracted from player 3 score");
			player3Points = player3Points - 1;
			trace(player3Points);
			player3Points_lbl.text = String(player3Points);
			myTimer.start();
		} //end subtract point
		function player3SubtractPointTouch(e: TouchEvent): void
		{
			trace("point subtracted from player 3 score");
			player3Points = player3Points - 1;
			trace(player3Points);
			myTimer.start();
		} //end subtract point

		//add point functions for players
		function player1AddPointTouch(e: TouchEvent): void
		{
			trace("point added to player 1 score");
			player1Points = player1Points + 1;
			trace(player1Points);
			player1Points_lbl.text = String(player1Points);
			myTimer.start();
		} //end addPoint

		function player1AddPointMouse(e: MouseEvent): void
		{
			trace("point added to player 1 score");
			player1Points = player1Points + 1;
			trace(player1Points);
			player1Points_lbl.text = String(player1Points);
			myTimer.start();
		} //end addPoint

		function player2AddPointTouch(e: TouchEvent): void
		{
			trace("point added to player 2 score");
			player2Points = player2Points + 1;
			trace(player2Points);
			player2Points_lbl.text = String(player2Points);
			myTimer.start();
		} //end addPoint

		function player2AddPointMouse(e: MouseEvent): void
		{
			trace("point added to player 2 score");
			player2Points = player2Points + 1;
			trace(player2Points);
			player2Points_lbl.text = String(player2Points);
			myTimer.start();
		} //end addPoint

		function player3AddPointTouch(e: TouchEvent): void
		{
			trace("point added to player 3 score");
			player3Points = player3Points + 1;
			trace(player3Points);
			player3Points_lbl.text = String(player3Points);
			myTimer.start();
		} //end addPoint

		function player3AddPointMouse(e: MouseEvent): void
		{
			trace("point added to player 3 score");
			player3Points = player3Points + 1;
			trace(player3Points);
			player3Points_lbl.text = String(player3Points);
			myTimer.start();
		} //end addPoint



	} //end class

} //end package