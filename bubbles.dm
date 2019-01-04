#define ICON_NAME 'bubbles.dmi'

mob
	var
		obj/s_bubble/s_bubble
	proc
		BubbleHappy(duration = 10)
			src.BubbleCustom(ICON_NAME,"happy",duration)

		BubbleAngry(duration = 10)
			src.BubbleCustom(ICON_NAME,"anger",duration)

		BubbleSigh(duration = 10)
			src.BubbleCustom(ICON_NAME,"sigh",duration)

		BubbleX(duration = 10)
			src.BubbleCustom(ICON_NAME,"X",duration)

		BubbleO(duration = 10)
			src.BubbleCustom(ICON_NAME,"O",duration)

		BubbleSad(duration = 10)
			src.BubbleCustom(ICON_NAME,"sad",duration)

		BubbleFrown(duration = 10)
			src.BubbleCustom(ICON_NAME,"mad",duration)

		BubbleExclaim(duration = 10)
			src.BubbleCustom(ICON_NAME,"!",duration)

		BubbleQuery(duration = 10)
			src.BubbleCustom(ICON_NAME,"?",duration)

		BubbleLove(duration = 10)
			src.BubbleCustom(ICON_NAME,"love",duration)

		BubbleIdea(duration = 10)
			src.BubbleCustom(ICON_NAME,"idea",duration)

		BubbleSing(duration = 10)
			src.BubbleCustom(ICON_NAME,"sing",duration)

		BubbleGrin(duration = 10)
			src.BubbleCustom(ICON_NAME,"grin",duration)

		BubbleTongue(duration = 10)
			src.BubbleCustom(ICON_NAME,"tongue",duration)

		BubbleLaugh(duration = 10)
			src.BubbleCustom(ICON_NAME,"laugh",duration)

		BubbleWink(duration = 10)
			src.BubbleCustom(ICON_NAME,"wink",duration)

		BubbleCustom(icon as icon,icon_state as text,duration = 10)
			del(src.s_bubble)
			src.s_bubble = new
			spawn() src.s_bubble.Display(src,icon,icon_state,duration)

obj/s_bubble/proc/Display(mob/M,icon,icon_state,duration)
	src.layer = 6
	var/turf/T = locate(M.x,M.y+1,M.z)
	if(T)
		src.loc = T
	else
		src.loc = M.loc
	src.icon = icon
	flick("popup",src)
	sleep(2)
	src.icon_state = icon_state
	sleep(duration)
	flick("popdown",src)
	sleep(2)
	del(src)

mob/Move()
	. = ..()
	if(src.s_bubble)
		var/turf/T = locate(src.x,src.y+1,src.z)
		if(T)
			src.s_bubble.loc = T
		else
			src.s_bubble.loc = src.loc
	return .

mob
	verb/Laugh()
		set category = "Emotions and Training"
		src.BubbleLaugh()
	verb/Grin()
		set category = "Emotions and Training"
		src.BubbleGrin()
	verb/Smile()
		set category = "Emotions and Training"
		src.BubbleHappy()
	verb/Stick_out_tongue()
		set category = "Emotions and Training"
		src.BubbleTongue()
	verb/Exclaim(T as text)
		set category = "Communication"
		src.BubbleExclaim()
		world << "\blue \<[src.name] exclaims:> [T]"
	verb/Say(T as text)
		set category = "Communication"
		if(usr.Muted)
			usr <<"You are muted!"
		else
			if(usr.talk == 1)
				view(6) << "<font size = 5>{<IMG CLASS=icon SRC=\ref[usr.faceicon]>}<font size = 2> [usr]<font color=white> says: <tt>[T]</tt>"
	verb/Ask(T as text)
		set category = "Communication"
		src.BubbleQuery()
		world << "\blue \<[src.name] asks:> [T]"
	verb/Be_angry()
		set category = "Emotions and Training"
		src.BubbleAngry()
	verb/Frown()
		set category = "Emotions and Training"
		src.BubbleFrown()
	verb/Be_in_love()
		set category = "Emotions and Training"
		src.BubbleLove()
	verb/Wink()
		set category = "Emotions and Training"
		src.BubbleWink()
	verb/Sing(T as text)
		set category = "Emotions and Training"
		src.BubbleSing()
		world << "\blue \<[src.name] sings:> [T]"