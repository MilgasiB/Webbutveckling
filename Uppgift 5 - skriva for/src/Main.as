package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Benjamin
	 */
	public class Main extends Sprite 
	{
		public var battleLog:TextField = new TextField();
		public var gameRounds:int = 0;
		
		private var playerHP:int = 100;
		private var playerDMG:int = 20;
		
		
		
		private var enemyHP:int = 100;
		private var enemyDMG:int = 20;
		
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		
			
			
			battleLog.border = true;
			battleLog.width = 1000;
			battleLog.height = 1000;
			addChild(battleLog);
			
			
			for (gameRounds; gameRounds < 5; gameRounds++)
			{
				var playerTotalDamage:int = (playerDMG + Math.random()*10);
				var enemyTotalDamage:int = (enemyDMG + Math.random() * 10);
				
				battleLog.appendText("Round" + String(gameRounds + 1) + " \n");
				if (playerHP || enemyHP > 0)
				{
				    enemyHP -= playerTotalDamage;
					battleLog.appendText( "You have dealt " + playerTotalDamage +"damage to the monster.The monster is at " + enemyHP + "health.\n" );
					
					if (enemyHP > 0)
					{
						playerHP -= enemyTotalDamage;
						battleLog.appendText( "The monster has dealt " + enemyTotalDamage + "damage to you. You have" + playerHP + "health left.\n\n");
						if (playerHP <= 0)
						{
							battleLog.appendText("You have been slain.")
							break;
						}
						
					}	
					else 
					{
						battleLog.appendText( "You are victorious!");
						break;
					}
				
				}
			}		
		}
	}
}