#define SD_RED_COLOUR 's_rednums.dmi'
#define SD_blue_COLOUR 's_bluenums.dmi'
#define SD_WHITE_COLOUR 's_whitenums.dmi'

proc/s_damage(num as num,trg as mob|obj|turf)
	var/icon


	var/String = num2text(num)
	var/first_char
	var/second_char
	var/third_char
	var/fourth_char
	var/obj/s_damage_num/first
	var/obj/s_damage_num/second
	var/obj/s_damage_num/third
	var/obj/s_damage_num/fourth


	if(lentext(String) == 1)
		first_char = copytext(String,1,2)
		first = new

	if(lentext(String) == 2)
		second_char = copytext(String,1,2)
		second = new
		first_char = copytext(String,2,3)
		first = new

	if(lentext(String) == 3)
		third_char = copytext(String,1,2)
		third = new
		second_char = copytext(String,2,3)
		second = new
		first_char = copytext(String,3,4)
		first = new

	if(lentext(String) == 4)
		fourth_char = copytext(String,1,2)
		fourth = new
		third_char = copytext(String,2,3)
		third = new
		second_char = copytext(String,3,4)
		second = new
		first_char = copytext(String,4,5)
		first = new

	var/target
	target = trg
	if(ismob(trg) || isobj(trg))
		target = trg:loc
	if(first)
		first.loc = target
	if(second)
		second.loc = target
	if(third)
		third.loc = target
	if(fourth)
		fourth.loc = target

	if(first)
		first.icon = icon
		flick("---[first_char]",first)
	if(second)
		second.icon = icon
		flick("--[second_char]-",second)
	if(third)
		third.icon = icon
		flick("-[third_char]--",third)
	if(fourth)
		fourth.icon = icon
		flick("[fourth_char]---",fourth)

	spawn(6)
		if(first)
			del first
		if(second)
			del second
		if(third)
			del third
		if(fourth)
			del fourth


obj/s_damage_num
	layer = 5
	icon_state = ""