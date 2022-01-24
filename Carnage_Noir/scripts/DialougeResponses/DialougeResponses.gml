// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DialougeResponses(argument0){


	switch(argument0)
	{
		case 0:
			break;
		case 1: 
			NewTextBox("Maybe the victims aren't so innocent, either...", -1);
			break;
		case 2: 
			NewTextBox("Hilarous, dude.", -1);
			break;
		case 3: 
			NewTextBox("Very troubling indeed.", -1);
			break;
		case 4: 
			NewTextBox("Ew, gross.", -1);
			break;
		case 5: 
			NewTextBox("So maybe whoever started shooting came out of here?", -1);
			break;
		case 6: 
			NewTextBox("Are you really trying to impress the voice in your head?", -1);
			break;
		case 7:
			NewTextBox("Wherever this warehouse is, I better get there fast.", -1);
			break;
		case 8:
			NewTextBox("More like WHERE is your sense of professionalism?", -1);
			break;
		case 9:
			NewTextBox("So the killer must have some sort of connection to the mob.", -1);
			break;
		case 10:
			NewTextBox("I'm pretty sure that's racist, dude.", -1);
			break;
		case 11:
			NewTextBox("The Mafia has been making serious moves on their competitors. But who carried out the killings?", -1);
			break;
		case 12:
			NewTextBox("This is a student game, man, you can't say that shit.", -1);
			break;
		case 13:
			NewTextBox("If they're planning to take out one of their rivals, there'll be a war in the streets.", -1);
			break;
		case 14:
			NewTextBox("You really are a horrible detective, aren't you.", -1);
			break;
		case 15:
			NewTextBox("Is it possible the killer was trying to stop this?", -1);
			break;
		case 16:
			NewTextBox("I uh... I got nothing to say to that.", -1);
			break;
		case 17:
			NewTextBox("And he doesn't seem very happy about being stabbed in the back.", -1);
			break;
		case 18:
			NewTextBox("Yeah, man, they're literally spelling it out for you.", -1);
			break;
			
		case 20:
			difficult = false;
			break;
		case 21:
			difficult = true;
			break;
	}
}