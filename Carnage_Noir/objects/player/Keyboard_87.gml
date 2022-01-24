/*if move = 2 or move = 6
{
	move=6
	direction=45
	if place_free(x+1,y-1) x+=1 y-=1
	index+=0.25
}

else if move = 1 or move = 7
{
	move=7
	direction=135
	if place_free(x-1,y-1) x-=1 y-=1
	index+=0.25
}

else if move=0 or move=3
{
move=3
direction=90
if place_free(x,y-2) y-=2
index+=0.25
}
*/
if move
	index+=0.25