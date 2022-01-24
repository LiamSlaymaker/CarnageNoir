if (pos == 0)
{
	if (counter == 0)
	room_goto_next();
	else if (counter == 1 )
	{
		if (read)
			read = -2;
		else if (read == -1)
		{
			NewTextBox("Controls\n WASD: Movement\n Mouse: Aim/Shoot/Inspect/Continue Dialogue\n Enter: Restart Level", -1);
		}
		read++;
	}
	else if (counter == 2)
	{
		if (read2)
			read2 = -3
		else if (read2 == -1)
		{
			NewTextBox("Select Your Difficulty",["20:Easy", "21:Hard"]);
		}
		read2++;
	}

	else if (counter == 3)
		game_end();
	}