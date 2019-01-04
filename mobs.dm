atom/movable
	var
		powerlevel
		maxpowerlevel
		maxpowerdam
		powerdam
		Str
		Def
		XP
		MaxXP
		mother
		father
		skin
		move
		fusepl = 0
		fusepd = 0
		bebi
		orem
		kiblastlearn
		oicon
		oname
		overlay
		transform
		ssj4learn
		ssj3learn
		ssj2learn
		ssj5learn
		ssj6learn
		ssjlearn
		oozaru
		arena
		racing
		time = 0
		dball1
		dball2
		dball3
		dball4
		dball5
		dball6
		dball7
		N1
		N2
		npc1
		pet
		following
		Muted
		Master
		ooc
		rhair = 0
		flevel
		chose
		ntalk
		en
		entime
		trainpl
		talky
		tayio
		bhair = 0
		ghair = 0
		ack
		gm
		moon
		hash = 0
		farkd
		customred
		customblue
		customgreen
		aura
		ooh
		gave
		follow
		plarper
		poratta
		training
		absorb
		kame = 0
		fuse
		medtime
		angered
		kak
		npc
		befriend
		ragename
		faceicon
		slap
		maxbase
		klevel
		plevel
		opl
		gonessj
		counter
		ssj
		bloodline
		mystic
		unlock
		tapion
		oldzenni
		ofaceicon
		gainzenni
		rage
		ased
		stamina
		heal
		state
		talk
		tech
		safe
		maxstamina
		will
		bubbles
		honor
		purity
		race
		alignment
		title
		npp
		gravtime
		zenni
		kaioken
		prefix
		powered
		ko
		blocking
		spar
		ptime
		kiloc
		kiin
		dead
		focustech
		focustechlearn
		focused
		shadowlearn
		shadow
		worn
		attribute
		adminroom

		grav
		kitech
		auratech
		kicolor
		combo
		focus
		kitechlearn
		auratechlearn
		kicolorlearn
		focuslearn
		kaiolearn
		spiritlearn
		itlearn
		style
		stylename
		hair
		majined
		majin
		lift
		random
		meditate
		flight
		flightlearn

mob/proc
	updatee()
		usr.powerlevel += 0
		usr.icon = usr.icon
		sleep(5)

mob
	Stat()
		statpanel("[src]'s Statistics")
		stat(src)
		stat("")
		stat("[src.name] [title]", "")
		stat("")
		stat("Powerlevel:", "[num2text(powerlevel,100)]")
		stat("Maximum Powerlevel:", "[num2text(maxpowerlevel,100)]")
		stat("Power Dam:", "[powerdam]/[maxpowerdam]")
		stat("Stamina:","[stamina]%")
		stat("Fighting Status:","[flevel]")
		stat("Strength:","[Str]")
		stat("Defence:","[Def]")
		stat("Will:", "[will]")
		stat("Honor:","[honor]")
		stat("Purity:", "[purity]")
		stat("Experience:","[XP]/[MaxXP]")
		stat("Zenni:", "[zenni]")
		if(usr.plevel > usr.klevel)
			usr.flevel = "Experienced in Punching"
		if(usr.plevel < usr.klevel)
			usr.flevel = "Experienced in Kicking"
		if(usr.plevel == usr.klevel)
			usr.flevel = "Balanced"

mob
	proc
		meditate()
			if(usr.meditate == 0)
				usr.powerlevel += 0
			if(usr.meditate == 1)
				usr.stamina += rand(1,7)
				usr.random = rand(1,2)
				if(usr.random == 2)
					usr.maxpowerlevel += rand(1,10)
					usr.maxpowerdam += rand(2,8)
				usr.random = rand(1,30)
				if(usr.random == 30)
					usr << "<b><font size = 2>You feel more purified."
					usr.purity += 1
					usr.random = rand(1,29)
					usr.maxpowerdam += rand(2,18)
				if(usr.random == 29)
					usr << "<b><font size = 2>You feel more honor enter your blood."
					usr.honor += 1
					usr.random = rand(1,28)
					usr.maxpowerdam += rand(12,18)
				if(usr.random == 28)
					usr << "<b><font size = 2>You get more will to fight."
					usr.will += 1
					usr.maxpowerdam += rand(2,8)
				usr.XP += rand(1,2)
				usr.LearnAll()
				usr.XP()
				if(usr.stamina >= 100)
					usr.stamina = 100
				sleep(50)
				usr.meditate()
mob
	verb
		Meditate()
			set category = "Emotions and Training"
			if(usr.flight == 1)
				usr << "Not while flying."
			if(usr.flight == 0)
				if(usr.meditate == 1)
					if(usr.medtime == 1)
						usr << "You need to wait 10 seconds before continuing meditating."
					if(usr.medtime == 0||usr.medtime == null)
						usr << "<b>You stop meditating."
						usr.medtime = 1
						usr.move = 1
						usr.icon_state = ""
						sleep(100)
						usr.meditate = 0
						usr.medtime = 0

				else
					usr << "<b>You begin meditating."
					usr.icon_state = "meditate"
					usr.move = 0
					usr.meditate = 1
					usr.meditate()

mob
	verb

		NewbieChat(msg as text)
			set category = "Communication"
			set name = "Newbie"
			if(usr.Muted)
				usr <<"You are muted!"
			else
				world <<"<font color = red>{{<font color = white>Newbie<font color = red>}}<font color = blue><tt>{{<font color = red>[usr]<font color = blue>}}<font color = white> : [Safe_Guard(msg)]"

		OOC(msg as text)
			set category = "Communication"
			if(usr.Muted)
				usr <<"You are muted!"
			else
				if(usr.npp == 0)
					if(usr.gm == 0||usr.gm == null)
						world <<"<font color = teal>{{<font color = white>OOC<font color = teal>}}<font color = green><tt>{{<font color = red>[usr]<font color = green>}}<font color = white> : [Safe_Guard(msg)]"

					if(usr.gm == 1)
						world<<"<font color = teal>{{<font color = white>GM<font color = teal>}}<font color = green><tt>{{<font color = red>[usr]<font color = green>}}<font color = white> OOCs:<font color = red> [msg]"
				else
					usr << "You are a newbie. You cannot."

		RolePlay(msg as text)
			set category = "Communication"
			if(usr.Muted)
				usr <<"You are muted!"
			else
				if(usr.talk == 1)
					world << "*<font color = blue><tt>[usr] [Safe_Guard(msg)]</tt><font color = white>*"
				else
					usr.powerlevel += 0

		Who()
			set category = "Communication"
			for(var/mob/characters/M in world)
				if(M.plarper == 1)
					usr << "[M.prefix] <b><u><font color = blue>[M.name]<font color = white></u></b>[M.suffix]<font color = red> [M.title]<font color = white> ([M.key])"
					usr.counter += 1
				if(M.plarper == 0)
					usr.counter += 0
			usr << "<br><u>Players Online</u>: <b>[counter]"
			usr.counter = 0

		Credits()
			set category = "Communication"
			usr<<browse(HtmlLayout())


mob
	verb
		drop_gold()
			set category = "Communication"
			set name = "Drop Zenni"
			var/dropgold = input("How much you want to drop?","Drop Gold",) as num
			if(dropgold<=0)
				usr << "You have to drop ATLEAST 1 zenni!"
				return
			if(dropgold>usr:zenni)
				usr << "You dont have that much zenni to drop."
				return
			else
				var/O = new /obj/goldbag(usr.loc)
				O:zenni = dropgold
				usr.zenni -= dropgold
				usr << "You drop  <B>[dropgold]</b> zenni"
				view(6) << "[usr] drops <b>[dropgold] zenni."
				return
		Give_Zenni(mob/M as mob in oview(1),how_much as num)
			set category = "Communication"
			if(how_much <= usr.zenni && how_much > 0) // if the amount isnt greater than users gold, and is greater than 0..
				M.zenni += how_much // give the mob you are giving the gold to, the amount of gold specified.
				usr.zenni -= how_much //take away the amount of gold from the user
			else
				usr << "You cant give that amount of Zenni"

obj/goldbag
	name="Gold Bag"
	icon='gold.dmi'
	verb
		Get()
			set src in oview(0)
			usr << "You get <b>[src.zenni]</b> zenni."
			usr:zenni += src.zenni
			del(src)
mob
	verb
		Befriend(mob/characters/M in oview(6))
			set name = "Befriend"
			set category = "Communication"
			if(usr.befriend == null)
				if(M.move == 1)
					switch(input("Are you sure you want to befriend him? You can only befriend one person.","Befriend",text) in list ("Yes","No"))
						if("Yes")
							usr.befriend = M.name
							M << "[usr] has befriended you!"
			else
				usr << "You have befriended already."


		HelpBook()
			set category = "Communication"
			set name = "Help Book"
			switch(input("What topic do you wish to learn about?" , "Book of Knowlage", text) in list ("Skills","How do I...","Super Forms","Rules"))
				if("Skills")
					alert("Here are the following natural skills you learn:")
					alert("Flight (Bukujutsu): 100 max powerlevel")
					alert("Power Up: 375 max powerlevel")
					alert("Focus: 425 max powerlevel")
					alert("Ki Tech: 150 max powerlevel")
					alert("Aura: 375 max powerlevel")
					alert("Ki Blast: 800 max powerlevel")
				if("How do I...")
					alert("How do I...")
					alert("Get a house?  Save up 25,000 Zenni then contact a Neo!")
					alert("Become admin?  If a Neo, or GW sees you helping the community they may make you an admin!  It helps if you are powerful, and on a lot of the time!")
					alert("Become a Super form for my race?  Get the required powerlevel, and you will learn it automatically!")
					alert("Get more zenni?  Kill people, or use the punching contest machine!")
				if("Super Forms")
					alert("SSJ : 320000 max powerlevel.")
					alert("SSJ2 : 800000 max powerlevel.")
					alert("SSJ3 : 8000000 max powerlevel.")
					alert("SSJ4 : 80000000 max powerlevel.")
					alert("Changeling Form 2 : 350000 max powerlevel.")
					alert("Changeling Form 3 : 900000 max powerlevel.")
					alert("Changeling Form 4 : 9000000 max powerlevel.")
					alert("Super Android : 320000 max powerlevel.")
					alert("Super Human : 310000 max powerlevel.")
					alert("Super Human 2 : 775000 max powerlevel.")
					alert("Super Namek : 300000 max powerlevel.")
					alert("Super Namek 2 : 750000 max powerlevel.")
				if("Rules")
					alert("Rules:")
					alert("No Otherworld killing!")
					alert("No killing in 100 mil room or someones house!")
					alert("Person Killing, is allowed EVERYWHERE apart from the two previous areas!")
					alert("Person Kill Festing is allowed, but may be frowned upon!")
					alert("If an admin abuses his power report him/her, but do not flame/spam the game or him/her!")



		Look(mob/characters/M in view(6))
			set category = "Communication"
			view(6) << "<font color = yellow>*<font color = red>[usr] looks at [M].<font color = yellow>*"
			usr << "<font color = red><center>[M.name]</red></center>"
			usr << "<font color = blue>Current Fighting Style: <IMG CLASS=icon SRC=\ref[usr.style]'> [M.stylename]"
			usr << "<font color = blue>Special Attributes: He is a(n) [M.attribute]."
			if(M.will >= 20 && M.honor >= 20 && M.purity >= 20)
				usr << "<font color = blue>You sense a great hidden power in him."
			if(M.powerlevel > usr.powerlevel)
				usr << "<font color = blue>You sense that [M] is stronger than you."
			if(M.powerlevel >= usr.powerlevel-1000&&M.powerlevel <= usr.powerlevel+1000)
				usr << "<font color = blue>[M] has the same powerlevel as you."
			if(M.powerlevel < usr.powerlevel)
				usr << "<font color = blue>You sense that [M] is weaker than you."
			if(usr.will >= 20 && usr.honor >= 20 && usr.purity >= 20)
				usr << "<font color = blue>You sense that [M] is at [num2text(M.powerlevel,100)]."
			usr << "<font color = blue>He seems to be a [M.race]."
			usr << "<font color = blue>They appear to be [M.state]."
			if(M.powerlevel >= M.maxpowerlevel)
				usr << "<font color = silver><font face = Arial>You sense that [M] is at full power."
			if(M.powerlevel < M.maxpowerlevel && M.powerlevel > (M.maxpowerlevel / 2))
				usr << "<font color = silver><font face = Arial>You sense that [M] is less than his maximum power."
			if(M.powerlevel <= (M.maxpowerlevel / 2) && M.powerlevel > (M.maxpowerlevel / 4))
				usr << "<font color = silver><font face = Arial>You sense that [M] is hiding most of their power."
			if(M.powerlevel <= (M.maxpowerlevel / 4) && M.powerlevel > (M.maxpowerlevel / 8))
				usr << "<font color = silver><font face = Arial>You sense that [M] is hiding almost all of his power."
			if(M.powerlevel <= (M.maxpowerlevel / 8))
				usr << "<font color = silver><font face = Arial>You sense that [M] has compeletly hidden their power."
			usr << "<font color = black><center>------------------------"
			usr << "<font color = blue><center>(OOC Information)"
			usr << "<font color = blue><center>[M]'s Key: [M.key]"
			if(M.key == "GokuSS4Neo")
				usr << "<font color = blue><center><i><u>Bow before GokuSS4Neo, for he is a God."
			usr << "<font color = black><center>------------------------"
			if(M.key == "Enimen_Mitch")
				usr << "<font color = blue><center><i><u>Bow before Akira, for he is a God."
			usr << "<font color = black><center>------------------------"
		Finish(mob/characters/M in oview(1))
			set category = "Fighting"
			if(usr.safe == 1)
				usr << "<b>Not in a safe zone!!</b>"
			if(usr.safe == 0)
				if(M.ko == 0)
					usr << "<b>He isn't knocked out!"
				if(M.ko == 1)
					if(usr.Guild == M.Guild)
						usr<<"They are in your Guild! You cannot attack them!"
					else
						usr.random = rand(1,4)
						if(usr.random == 1)
							view(6) << "<b><font color = blue>[usr] picks up [M] by the throat, and snaps his neck."
							M.powerlevel = 0
							M.Die()
							usr.move = 0
							sleep(30)
							usr.move = 1
						if(usr.random == 2)
							view(6) << "<b><font color = blue>[usr] stomps down on [M]'s stomach, killing him."
							M.powerlevel = 0
							M.Die()
							usr.move = 0
							sleep(30)
							usr.move = 1
						if(usr.random == 3)
							view(6) << "<b><font color = blue>[usr] stomps down on [M]'s neck, breaking his neck and killing him.."
							M.powerlevel = 0
							M.Die()
							usr.move = 0
							sleep(30)
							usr.move = 1
						if(usr.random == 4)
							view(6) << "<b><font color = blue>[usr] punches right through [M]'s stomach, killing him!."
							M.powerlevel = 0
							M.Die()
							usr.move = 0
							sleep(30)
							usr.move = 1



		AttackMob(mob/M in oview(1))
			set category = "Fighting"
			set name = "Attack"
			if(usr.Guild == M.Guild)
				usr<<"They are in your Guild! You cannot attack them!"
			else
				if(M.npp == 1)
					usr << "<b>They are a newbie."
				else
					if(usr.npp == 1)
						usr << "<b>You are a newbie - you cannot."
					else
						if(M.npc == 1)
							usr << "They are an NPC"
						if(M.npc == 0||M.npc == null)
							if(usr.npp == 1)
								usr << "Not while being a newbie."
							if(usr.npp == 0)
								if(M.npp == 1)
									usr << "They are a newbie."
								if(M.npp == 0)
									if(M.ko == 1)
										usr << "<b>You need to finish him for that."
									if(M.ko == 0)
										if(usr.ko == 1)
											usr << "<b>Not while you are knocked out."
										if(usr.ko == 0)
											if(usr.safe == 1)
												usr << "<b>Not while in a safe area."
											if(usr.safe == 0)
												if(M.safe == 1)
													usr << "<b>They are in a safe area."
												if(M.safe == 0)
													usr.random= rand(1,7)
													if(usr.random == 1)
														view(6) << "<font color = blue><i>[usr] throws a fury of punches at [M]!"
														flick("sparfury",usr)
														M.powerlevel -= (usr.powerlevel * (rand(0.2,0.9)))
														M.powerlevel = round(M.powerlevel)
														M.plevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()
													if(usr.random == 2)
														view(6) << "<font color = blue><i>[usr] jump-kicks [M]!"
														flick("sparkick",usr)
														M.powerlevel -= (usr.powerlevel * (rand(0.2,0.9)))
														M.powerlevel = round(M.powerlevel)
														M.klevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()

													if(usr.random == 3)
														view(6) << "<font color = blue><i>[usr] uppercuts [M]!!"
														flick("sparfury",usr)
														M.powerlevel -= (usr.powerlevel * (rand(0.2,0.6)))
														M.powerlevel = round(M.powerlevel)
														M.plevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()

													if(usr.random == 4)
														view(6) << "<font color = blue><i>[usr] sweeps [M]'s feet!"
														flick("sparkick",usr)
														M.powerlevel -= (usr.powerlevel * (rand(0.2,0.6)))
														M.powerlevel = round(M.powerlevel)
														M.klevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()


													if(usr.random == 5)
														view(6) << "<font color = blue><i>[usr] jabs [M] in the stomach!"
														flick("sparpunch",usr)
														M.powerlevel -= (usr.powerlevel * (rand(0.2,0.6)))
														M.powerlevel = round(M.powerlevel)
														M.plevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()

													if(usr.random == 6)
														view(6) << "<font color = blue><i>[usr] staggers, and misses [M]!"
														flick("sparpunch",usr)
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
													if(usr.random == 7)
														view(6) << "<font color = blue><i>[usr] kicks at [M], and misses [M]!"
														flick("sparkick",usr)
														M.klevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()




						if(M.npc == 1)
							usr << "They are an NPC"
						if(M.npc == 0||M.npc == null)
							if(usr.npp == 1)
								usr << "Not while being a newbie."
							if(usr.npp == 0)
								if(M.npp == 1)
									usr << "They are a newbie."
								if(M.npp == 0)
									if(M.ko == 1)
										usr << "<b>You need to finish him for that."
									if(M.ko == 0)
										if(usr.ko == 1)
											usr << "<b>Not while you are knocked out."
										if(usr.ko == 0)
											if(usr.safe == 1)
												usr << "<b>Not while in a safe area."
											if(usr.safe == 0)
												if(M.safe == 1)
													usr << "<b>They are in a safe area."
												if(M.safe == 0)
													usr.random= rand(1,7)
													if(usr.random == 1)
														view(6) << "<font color = blue><i>[usr] throws a fury of punches at [M]!"
														flick("sparfury",usr)
														M.powerlevel -= (usr.powerlevel * (rand(0.2,0.9)))
														M.powerlevel = round(M.powerlevel)
														M.plevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()
													if(usr.random == 2)
														view(6) << "<font color = blue><i>[usr] jump-kicks [M]!"
														flick("sparkick",usr)
														M.powerlevel -= (usr.powerlevel * (rand(0.2,0.9)))
														M.powerlevel = round(M.powerlevel)
														M.klevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()

													if(usr.random == 3)
														view(6) << "<font color = blue><i>[usr] uppercuts [M]!!"
														flick("sparfury",usr)
														M.powerlevel -= (usr.powerlevel * (rand(0.2,0.6)))
														M.powerlevel = round(M.powerlevel)
														M.plevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()

													if(usr.random == 4)
														view(6) << "<font color = blue><i>[usr] sweeps [M]'s feet!"
														flick("sparkick",usr)
														M.powerlevel -= (usr.powerlevel * (rand(0.2,0.6)))
														M.powerlevel = round(M.powerlevel)
														M.klevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()


													if(usr.random == 5)
														view(6) << "<font color = blue><i>[usr] jabs [M] in the stomach!"
														flick("sparpunch",usr)
														M.powerlevel -= (usr.powerlevel * (rand(0.2,0.6)))
														M.powerlevel = round(M.powerlevel)
														M.plevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()

													if(usr.random == 6)
														view(6) << "<font color = blue><i>[usr] staggers, and misses [M]!"
														flick("sparpunch",usr)
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
													if(usr.random == 7)
														view(6) << "<font color = blue><i>[usr] kicks at [M], and misses [M]!"
														flick("sparkick",usr)
														M.klevel += 1
														usr.maxpowerlevel += rand(0,1)
														usr.maxpowerdam += rand(0,2)
														M.KO()

mob
	tester
		dummy1
			icon = 'male.dmi'
			icon_state = "sparstand"
			powerlevel = 100
			maxpowerlevel = 100
			blocking = 0
			ko = 0
			alignment = "Good"
			npc = 1
			dead = 0
			spar = 1

		dummy2
			icon = 'male.dmi'
			icon_state = "sparblock"
			powerlevel = 100
			maxpowerlevel = 100
			blocking = 1
			npc = 1
			ko = 0
			alignment = "Good"
			spar = 1
mob
	bubb
		bubbles
			name = "Bubbles the Monkey"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "bubbles"
			step_rand()
			verb
				Catch()
					set src in oview(1)
					set category = "Emotions and Training"
					usr<<"Well done, you caught me!"
					usr.bubbles =1
mob
	kaio
		westkaio
			name = "West Kaio"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "westkaio"
			verb
				Talk()
					set category = "Communication"
					set src in oview(1)
					if(usr.maxpowerlevel >= 10000000&&usr.kaiolearn == null)
						switch(input("Would you like me to teach you Kaio Kanattack, I am afraid I am the only remaining Kaio who can remember how to teach it.  So I am the ONLY person you can learn it from!","West Kaio", text) in list ("Yes Please","No thanks"))
							if("Yes Please")
								usr.contents += new /obj/Kaioken
								usr << "<b>I have taught you Kaio Kanattack!"
								usr.kaiolearn = 1
								usr.kaioken = 0
							if("No thanks")
								usr<<"Suit yourself!"
					else
						usr<<"Sorry, either you already know Kaioken, or you are too weak to learn it!"


mob
	tester
		kingkai
			name = "North Kaio"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "northkaio"
			bubbles=0
			verb
				Train()
					set name = "Training"
					set category = "Emotions and Training"
					set src in oview(1)
					if(usr.talky == null||usr.talky == 0)
						alert("Greetings, I am North Kaio")
						alert("You will now need to train with me before I can help you free yourself.")
						usr.Move(usr,SOUTH)
						usr.Move(usr,EAST)
						usr.icon_state = "sparfury"
						sleep(20)
						usr.icon_state = "meditate"
						sleep(10)
						usr.icon_state = "sparfury"
						sleep(20)
						usr.icon_state = "meditate"
						sleep(10)
						usr.icon_state = "sparfury"
						sleep(20)
						underlays+=icon('ping.dmi')
						sleep(10)
						underlays-=icon('ping.dmi')
						usr.icon_state = ""
						alert("You show great potential.  Your Training is finished!")
						usr.talky = 1
						usr.maxpowerlevel += 250
						usr.maxpowerdam += rand(250,2000)


				Return_To_Earth()
					set name = "Return To Earth"
					set category = "Emotions and Training"
					set src in oview(1)
					if(usr.talky == 0||usr.talk == null)
						usr << "<b>Let me Train you first"
					if(usr.bubbles==0||usr.bubbles == null)
						usr<<"Catch Bubbles!"
					if(usr.talky == 1 && usr.bubbles == 1)
						usr << "<b>You may now return to earth!"
						if(usr.powerlevel >= 100000)
							if(usr.spiritlearn == null)
								usr.contents += new /obj/spiritbomb
								usr << "<b>Before you leave, I will teach you Spirit Bomb."
								usr.spiritlearn = 1
								usr.kame = 0
						if(usr.powerlevel >= 310000)
							if(usr.itlearn == null)
								usr.contents += new /obj/it
								usr << "<b>Before you leave, I will teach you Instant Translocation."
								usr.itlearn = 1
						usr.loc=locate(46,16,2)
						usr.talky = 0
						usr.safe = 0
						usr.overlays -= 'halo.dmi'
						usr.overlays -= /obj/halo
						usr.overlays -= 'halo.dmi'
						usr.overlays -= /obj/halo
						usr.overlays -= 'halo.dmi'
						usr.overlays -= /obj/halo
						usr.dead = 0

mob
	other
		ache
			icon = 'mobs.dmi'
			icon_state = "ache"
			powerlevel = 5
			npc = 1
			maxpowerlevel = 7
			race = "Human-jin"
			verb
				Talk()
					set category = "Communication"
					set src in oview(3)
					alert("Welcome to Redland Hectares! If you want to buy a house, contact a Neo")
					alert("One House is 25,000 zenni.")
					alert("Each house can come with a password of your choice, or not!")
					alert("You may even have it with no password, but only lets certain people in!")
mob
	other
		bar
			icon = 'mobs.dmi'
			icon_state = "bar"
			powerlevel = 5
			npc = 1
			maxpowerlevel = 7
			race = "Human-jin"
			verb
				Talk()
					set category = "Communication"
					set src in oview(3)
					usr<<"Want a beer?"
					sleep(5)
					usr<<"It costs 150 zenni, but you have to drink it here!"
					if(usr.zenni>=150)
						switch(input("Want a beer?","Barkeeper",text) in list ("Yes","No thanks"))
							if("Yes")
								usr<<"Here you go mate!"
								usr.zenni -= 150
								usr.random = rand(1,4)
								if(usr.random == 1)
									world<<"<font color = green>*hick*BEER!!!*hick* <font color = white>[usr] is drunk!!"
								if(usr.random == 2)
									world<<"<font color = green>*slurp*You know, in a certain light Namekians are pretty hott!!*hick* <font color = white>[usr] is drunk!!"
								if(usr.random == 3)
									world<<"<font color = green>ALL OF YOU GO AWAY!!!YOU, YOU, YOU and ... THUMP*[usr] fell on the floor* <font color = white>[usr] is drunk!!"
								if(usr.random == 4)
									world<<"<font color = green>Where am I?....*HICKUP*...Who are you?...Who am I? And why am I wearin a dress? <font color = white>[usr] is drunk!!"
mob
	melp
		Shopkeeper2
			icon = 'mobs.dmi'
			icon_state = "shoptwo"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			race = "Human-jin"
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Orange Gi","Blue Underclothing","Right Class IV Scouter"))
						if("Orange Gi")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Orange Gi!"
								usr.contents += new /obj/orangegi
								usr.zenni -= 150

						if("Blue Underclothing")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Orange Gi!"
								usr.contents += new /obj/blueunder
								usr.zenni -= 150

						if("Right Class IV Scouter")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
							if(usr.zenni >= 10000)
								usr << "<b>You get a Orange Gi!"
								usr.contents += new /obj/yellow_scouter_right
								usr.zenni -= 10000
mob
	melp
		Shopkeeper3
			icon = 'mobs.dmi'
			icon_state = "shopthree"
			npc = 1
			powerlevel = 25
			maxpowerlevel = 29
			race = "Namek-jin"
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Left Class I Scouter","Left Class II Scouter","Left Class III Scouter","Left Class IV Scouter","Left Class IV Scouter"))
						if("Left Class I Scouter")
							if(usr.zenni <= 1999)
								usr << "<b>You need 2000 zenni!"
							if(usr.zenni >= 2000)
								usr << "<b>You get Class I Scouter!"
								usr.contents += new /obj/blue_scouter_left
								usr.zenni -= 2000
						if("Left Class II Scouter")
							if(usr.zenni <= 3999)
								usr << "<b>You need 4000 zenni!"
							if(usr.zenni >= 4000)
								usr << "<b>You get Class II Scouter!"
								usr.contents += new /obj/red_scouter_left
								usr.zenni -= 4000
						if("Left Class III Scouter")
							if(usr.zenni <= 7999)
								usr << "<b>You need 8000 zenni!"
							if(usr.zenni >= 8000)
								usr << "<b>You get Class III Scouter!"
								usr.contents += new /obj/green_scouter_left
								usr.zenni -= 8000
						if("Left Class IV Scouter")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
							if(usr.zenni >= 10000)
								usr << "<b>You get a Orange Gi!"
								usr.contents += new /obj/yellow_scouter_left
								usr.zenni -= 10000
mob
	melp
		Shopkeeper
			icon = 'mobs.dmi'
			icon_state = "store"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			race = "Changling"
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Black Gi","Blue Underclothing","Black Underclothing","Turben","Cape","Namek Gi","White Boots and Gloves","Boxing Gloves","Right Class I Scouter","Right Class II Scouter","Right Class III Scouter", "Senzu Bean","Elite Saiyajin Armor", "Elite Saiyajin Armor (Black)","Elite Saiyajin Armor (Blue)","Royal Saiyajin Armor", "Saiyajin Armor"))
						if("Black Gi")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Black Gi!"
								usr.contents += new /obj/blackgi
								usr.zenni -= 150
						if("Blue Underclothing")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get a Blue Underclothing!"
								usr.contents += new /obj/blueunder
								usr.zenni -= 50
						if("Black Underclothing")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get a Black Underclothing!"
								usr.contents += new /obj/blackunder
								usr.zenni -= 50
						if("White Boots and Gloves")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get White Boots and Gloves!"
								usr.contents += new /obj/bootglove
								usr.zenni -= 50
						if("Boxing Gloves")
							if(usr.zenni <= 99)
								usr << "<b>You need 100 zenni!"
							if(usr.zenni >= 100)
								usr << "<b>You get Boxing Gloves!"
								usr.contents += new /obj/boxingglove
								usr.zenni -= 100
						if("Right Class I Scouter")
							if(usr.zenni <= 1999)
								usr << "<b>You need 2000 zenni!"
							if(usr.zenni >= 2000)
								usr << "<b>You get Class I Scouter!"
								usr.contents += new /obj/blue_scouter_right
								usr.zenni -= 2000
						if("Right Class II Scouter")
							if(usr.zenni <= 3999)
								usr << "<b>You need 4000 zenni!"
							if(usr.zenni >= 4000)
								usr << "<b>You get Class II Scouter!"
								usr.contents += new /obj/red_scouter_right
								usr.zenni -= 4000
						if("Right Class III Scouter")
							if(usr.zenni <= 7999)
								usr << "<b>You need 8000 zenni!"
							if(usr.zenni >= 8000)
								usr << "<b>You get Class III Scouter!"
								usr.contents += new /obj/green_scouter_right
								usr.zenni -= 8000

						if("Turben")
							if(usr.zenni <= 499)
								usr << "<b>You need 500 zenni!"
							if(usr.zenni >= 500)
								usr << "<b>You get a Turben!"
								usr.contents += new /obj/turben
								usr.zenni -= 500

						if("Cape")
							if(usr.zenni <= 499)
								usr << "<b>You need 500 zenni!"
							if(usr.zenni >= 500)
								usr << "<b>You get a Cape!"
								usr.contents += new /obj/cape
								usr.zenni -= 500


						if("Namek Gi")
							if(usr.zenni <= 499)
								usr << "<b>You need 500 zenni!"
							if(usr.zenni >= 500)
								usr << "<b>You get a Cape!"
								usr.contents += new /obj/namekgi
								usr.zenni -= 500

						if("Senzu Bean")
							if(usr.zenni <= 4999)
								usr << "<b>You need 5000 zenni!"
							if(usr.zenni >= 5000)
								usr << "<b>You get a Senzu Bean!"
								usr.contents += new /obj/senzubean
								usr.zenni -= 5000
						if("Saiyajin Armor")
							if(usr.zenni < 2000)
								usr << "<b>You need 2000 zenni!"
							if(usr.zenni >= 2000)
								usr << "<b>You get a Saiya-jin Armor!"
								usr.contents += new /obj/saiyanarmor
								usr.zenni -= 2000
						if("Elite Saiyajin Armor")
							if(usr.zenni < 3000)
								usr << "<b>You need 3000 zenni!"
							if(usr.zenni >= 3000)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/elitesaiyanarmor
								usr.zenni -= 3000
						if("Royal Saiyajin Armor")
							if(usr.zenni < 4500)
								usr << "<b>You need 4500 zenni!"
							if(usr.zenni >= 4500)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/royalsaiyan
								usr.zenni -= 4500
						if("Elite Saiyajin Armor (Blue)")
							if(usr.zenni < 3000)
								usr << "<b>You need 3000 zenni!"
							if(usr.zenni >= 3000)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/blueelite
								usr.zenni -= 3000
						if("Elite Saiyajin Armor (Black)")
							if(usr.zenni < 3000)
								usr << "<b>You need 3000 zenni!"
							if(usr.zenni >= 3000)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/blackelite
								usr.zenni -= 3000

mob
	melp
		Shopkeeper4
			icon = 'mobs.dmi'
			icon_state = "shopfour"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			race = "Human-jin"
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Orange Gi","Blue Underclothing","Right Class IV Scouter"))
						if("Orange Gi")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Orange Gi!"
								usr.contents += new /obj/orangegi
								usr.zenni -= 150

						if("Blue Underclothing")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Orange Gi!"
								usr.contents += new /obj/blueunder
								usr.zenni -= 150

						if("Right Class IV Scouter")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
							if(usr.zenni >= 10000)
								usr << "<b>You get a Orange Gi!"
								usr.contents += new /obj/yellow_scouter_right
								usr.zenni -= 10000

mob
	melp
		Petkeeper
			icon = 'mobs.dmi'
			icon_state = "aztec"
			npc = 1
			powerlevel = 500
			maxpowerlevel = 700
			race = "Human-jin"
			verb
				Buy_a_pet()
					set src in oview(1)
					set category = "Communication"
					if(usr.following == 0||usr.following == null)
						switch(input("Hello! Do you like my collection of exotic pets?  Which one would you like?", "Petkeeper",text) in list ("Zebba(the blue fly) is 15,000","Lamass(the white round thing) is 2,000","Tauros(the red bull) is 11,000","White Bunny is 3,000","Red Bunny is 6,000","Blue Bunny is 6,000","Rainbow Bunny is 16,000"))
							if("Zebba(the blue fly) is 15,000")
								if(usr.zenni <= 14999)
									usr << "<b>You need 15000 zenni!"
								if(usr.zenni >= 15000)
									usr << "<b>You get a Zebba!"
									usr.zenni -= 15000
									usr.npc1 = 1//You recieve a NPC
									following=1//You now cannot have 2
									usr.pet=new/mob/pet/Zebba(locate(usr.x+1,usr.y,usr.z))
							if("Lamass(the white round thing) is 2,000")
								if(usr.zenni <= 1999)
									usr << "<b>You need 2000 zenni!"
								if(usr.zenni >= 2000)
									usr << "<b>You get a Lamass!"
									usr.zenni -= 2000
									usr.npc1 = 1//You recieve a NPC
									following=1//You now cannot have 2
									usr.pet=new/mob/pet/Lamass(locate(usr.x+1,usr.y,usr.z))
							if("Tauros(the red bull) is 11,000")
								if(usr.zenni <= 10999)
									usr << "<b>You need 11000 zenni!"
								if(usr.zenni >= 11000)
									usr << "<b>You get a Tauros!"
									usr.zenni -= 11000
									usr.npc1 = 1//You recieve a NPC
									following=1//You now cannot have 2
									usr.pet=new/mob/pet/Tauros(locate(usr.x+1,usr.y,usr.z))
							if("White Bunny is 3,000")
								if(usr.zenni <= 2999)
									usr << "<b>You need 3000 zenni!"
								if(usr.zenni >= 3000)
									usr << "<b>You get a White Bunny!"
									usr.zenni -= 3000
									usr.npc1 = 1//You recieve a NPC
									following=1//You now cannot have 2
									usr.pet=new/mob/pet/WhiteBunny(locate(usr.x+1,usr.y,usr.z))
							if("Red Bunny is 6,000")
								if(usr.zenni <= 5999)
									usr << "<b>You need 6000 zenni!"
								if(usr.zenni >= 6000)
									usr << "<b>You get a Red Bunny!"
									usr.zenni -= 6000
									usr.npc1 = 1//You recieve a NPC
									following=1//You now cannot have 2
									usr.pet=new/mob/pet/RedBunny(locate(usr.x+1,usr.y,usr.z))
							if("Blue Bunny is 6,000")
								if(usr.zenni <= 5999)
									usr << "<b>You need 6000 zenni!"
								if(usr.zenni >= 6000)
									usr << "<b>You get a Blue Bunny!"
									usr.zenni -= 6000
									usr.npc1 = 1//You recieve a NPC
									following=1//You now cannot have 2
									usr.pet=new/mob/pet/BlueBunny(locate(usr.x+1,usr.y,usr.z))
							if("Rainbow Bunny is 16,000")
								if(usr.zenni <= 15999)
									usr << "<b>You need 16000 zenni!"
								if(usr.zenni >= 16000)
									usr << "<b>You get a Rainbow Bunny!"
									usr.zenni -= 16000
									usr.npc1 = 1//You recieve a NPC
									following=1//You now cannot have 2
									usr.pet=new/mob/pet/RainbowBunny(locate(usr.x+1,usr.y,usr.z))
						usr<<"Your pet cannot leave this area, but it will follow you around!  If you leave I will look after it!"
					else
						usr<<"You already have a pet!"
mob
	pet
		Zebba
			icon = 'Pets.dmi'
			icon_state = "Zebba"
			density = 1

mob
	pet
		Lamass
			icon = 'Pets.dmi'
			icon_state = "Lamass"
			density = 1

mob
	pet
		Tauros
			icon = 'Pets.dmi'
			icon_state = "Tauros"
			density = 1

mob
	pet
		RedBunny
			icon = 'bunny.dmi'
			icon_state = "red"
			density = 1

mob
	pet
		BlueBunny
			icon = 'bunny.dmi'
			icon_state = "blue"
			density = 1
mob
	pet
		WhiteBunny
			icon = 'bunny.dmi'
			icon_state = "white"
			density = 1

mob
	pet
		RainbowBunny
			icon = 'bunny.dmi'
			icon_state = "rainbow"
			density = 1

client//States the client
	Northeast()//For the Northeast key...
		return//It won't do anything
	Northwest()//For the Northwest key...
		return//Won't do anything either
	Southeast()//For the Southeast key...
		return//Not doing anything
	Southwest()//For the Southwest key..
		return//It is disabled so nothings happening here(The reason for the above is to disable the NPC from being stranded since I didn't insert the diagnal directions for the NPC's movement)
	North()//When you use north...
		if(usr:npc1==1)//It will first check if you have a NPC with you
			step(usr,NORTH)//Then it will move you north 1 space
			walk_to(usr:pet,usr.loc,1,1)//This is to move the NPC to make it go north too
			return//After this go back to normal activity
		else//If you don't have a NPC...
			step(usr,NORTH)//You move north and that's all
			return//After moving, nothing special happens

//Note:Just read the above because I don't feel like typing it up again (My clipboard won't work with BYOND)

	South()
		if(usr:npc1==1)
			step(usr,SOUTH)
			walk_to(usr:pet,usr.loc,1,1)
			return
		else
			step(usr,SOUTH)
			return
	East()
		if(usr:npc1==1)
			step(usr,EAST)
			walk_to(usr:pet,usr.loc,1,1)
			return
		else
			step(usr,EAST)
			return
	West()
		if(usr:npc1==1)
			step(usr,WEST)
			walk_to(usr:pet,usr.loc,1,1)
			return
		else
			step(usr,WEST)
			return


mob
	proc
		BunnyDance()
			for(var/mob/maniack/bunny/M in world)
				M.icon_state = "breakdance"

mob
	maniack
		bunny
			icon = 'bunny.dmi'
			icon_state = "white"
			powerlevel = 5000
			npc = 1
			maxpowerlevel = 9999
			race = "Bunny"
			verb
				Catch()
					set src in oview(1)
					set category = "Manerk"
					usr <<"Yeh caught a bunny!"
					del(src)
					Move(usr)
					usr.verbs += /mob/maniack/bunny/verb/Drop_Bunny
				Drop_Bunny()
					set category = "Manerk"
					usr <<"Yeh drop a bunny!"
					usr.verbs -= /mob/maniack/bunny/verb/Drop_Bunny

		verb
			BreakDance()
				set category = "Emotions and Training"
				src<<"[usr] pulls out his sheet and begins to break dance!"
				flick("breakdance", usr)
		verb
			Hack()
				set category = "Emotions and Training"
				usr.icon_state = "hack"
				view(6) <<"<b>[usr] startsa hackin'!!"
				var/meeb= input("What meeb?","Uh-Mee-Bah") in typesof(/mob)
				new meeb(locate(usr.x,usr.y-1,usr.z))
				usr.icon_state = ""
				view(30) << "<u><font face = ariel>[usr]: HACK A WHEEEZE!!!!!! <font face = Ariel>Plap plap plap plap!!!!!"
				view(6) << "<font color = red>Oh dear jeebs! [usr] has caffed up sumfin!"


mob
	other
		tapion
			icon = 'tapion.dmi'
			icon_state = "play"
			powerlevel = 999999999999999999999999999999999999999999999999999999
			npc = 1
			maxpowerlevel = 9999999999999999999999999999999999999999999999999999999
			race = "Konac-sei-jin"
			name = "Tapion"
		master
			icon = 'mobs.dmi'
			icon_state = "master"
			npc = 1
			name = "Unknown"
			powerlevel = 1
			maxpowerlevel = 1
			name = "The Unknown"
		Kinjin
			icon = 'mobs.dmi'
			icon_state = "kinjin"
			powerlevel = 9999999999999999999999999999999999999999999999999999999
			npc = 1
			maxpowerlevel = 99999999999999999999999999999999999999999999999999999
			race = "Unknown"
			name = "Kinjin"
			verb
				Talk()
					set src in oview(6)
					set category = "Communication"
					if(usr.alignment == "Good")
						usr << "<b>For being good hearted, you may continue to Snake Way."
						usr.loc=locate(38,48,4)
					if(usr.alignment == "Evil")
						usr << "<b>You evil fiend....You can go the long way around Snake Way</b>"
						view(6) << "<b>Kinjin smirks as [usr] gets dragged to the end of Snake Way."
						usr.loc=locate(39,9,4)
					else
						usr<<"<B>King kaio is just at the end of snake way!"
						usr.loc=locate(38,48,4)

		Dummy
			icon = 'mobs.dmi'
			icon_state = "dummy"
			race = "Dummy (Class I)"
			npc = 1
			name = "Class I Dummy"
			verb
				Train()
					set name = "Train"
					set category = "Emotions and Training"
					set desc = ".."
					set src in oview(1)
					switch(input("What do you want to train?","Training",text) in list ("Punches","Kicks","Ki","None"))
						if("Punches")
							if(usr.training == 1)
								usr << "<b>You are currently training. Please select 'None' on the training screen."
							if(usr.training == 0||null)
								usr.training = 1
								usr << "<b>You begin training your punches."
								usr.move = 0
								usr.punchcheck()
						if("Kicks")
							if(usr.training == 1)
								usr << "<b>You are currently training. Please select 'None' on the training screen."
							if(usr.training == 0||null)
								usr.training = 1
								usr.move = 0
								usr << "<b>You begin training your kicks."
								usr.kickcheck()
						if("Ki")
							if(usr.training == 1)
								usr << "<b>You are currently training. Please select 'None' on the training screen."
							if(usr.training == 0||null)
								usr.training = 1
								usr.move = 0
								usr << "<b>You begin training your ki."
								usr.kicheck()
						if("None")
							usr.training = 0
							usr << "<b>You stop training."
							usr.move = 1
mob
	proc
		punchcheck()
			if(usr.training == 1)
				if(usr.stamina <= 0)
					usr << "<b>You are too tired!</b>"
					usr.stamina = 0
				if(usr.stamina >= 1)
					flick("sparfury", usr)
					usr.stamina -= (rand(1,5))
					usr.random = rand(1,2)
					if(usr.random == 2)
						usr.maxpowerlevel += (rand(1,5))
						usr.maxpowerdam += rand(0,7)
					else
						usr.powerlevel += 0
					sleep(15)
					usr.punchcheck()
			if(usr.training == 0)
				usr.powerlevel += 0

			else
				return

mob
	proc
		kickcheck()
			if(usr.training == 1)
				if(usr.stamina <= 0)
					usr << "<b>You are too tired!</b>"
					usr.stamina = 0
				if(usr.stamina >= 1)
					flick("sparkick", usr)
					usr.stamina -= (rand(1,5))
					usr.random = rand(1,2)
					if(usr.random == 2)
						usr.maxpowerlevel += (rand(1,5))
						usr.maxpowerdam += rand(0,6)
					else
						usr.powerlevel += 0
					sleep(15)
					usr.kickcheck()
			if(usr.training == 0)
				usr.powerlevel += 0

			else
				return



mob
	proc
		kicheck()
			if(usr.training == 1)
				if(usr.stamina <= 0)
					usr << "<b>You are too tired!</b>"
					usr.stamina = 0
				if(usr.stamina >= 1)
					usr.stamina -= (rand(1,7))
					usr.random = rand(1,2)
					if(usr.random == 2)
						usr.maxpowerlevel += (rand(1,7))
						usr.maxpowerdam += rand(0,12)
					else
						usr.powerlevel += 0
					sleep(15)
					usr.kicheck()
			if(usr.training == 0)
				usr.powerlevel += 0

			else
				return

mob
	other
		Kid
			name = "Gifted Kid"
			icon = 'mobs.dmi'
			icon_state = "Kid"
			race = "Human-jin"
			npc = 1
			powerlevel = 5000
			maxpowerlevel = 5000
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("Greetings, I am a Gifted Kid.")
					switch(input("Hello...I have been told ever since I was born I was gifted!  I am now 7 years old with more power than the entire Earth Army!  Do you want to learn my most valuble techniques?", "Gifted Kid",text) in list ("Yes","No","Offers"))
						if("Yes")
							usr<<"Click learn to learn my techniques!"
						if("Offers")
							alert("You can learn currently: Rapid Fire and Super Rapid Fire")
				Learn()
					set src in oview(1)
					set category = "Communication"
					switch(input("Which technique would you like to learn, 'Rapid Fire', 'Rekenzu Energy Dan'?" , "Gifted Kid", text) in list ("Rapid Fire","Super Rapid Fire"))
						if("Rapid Fire")
							if(usr.maxpowerlevel < 15000)
								usr << "You need to be a stronger."
							if(usr.maxpowerlevel >= 15000)
								usr.contents += new /obj/RapidFire
								alert("The Gifted Kid teaches you the Rapid Fire technique!")
						if("Rekenzu Energy Dan")
							if(usr.maxpowerlevel < 34000)
								usr << "You need to be a stronger."
							if(usr.maxpowerlevel >= 34000)
								usr.contents += new /obj/RekenzuEnergyDan
								alert("The Gifted Kid teaches you the Rekenzu Energy Dan technique!")
mob
	other
		Tienshinhan
			name = "Tienshinhan"
			icon = 'mobs.dmi'
			icon_state = "tienshinhan"
			race = "Human-jin"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 5
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					usr<<"Greetings, I am Tienshinhan."
					usr<<"Wow, someone finally found my resting place."
					switch(input("Do you wish to learn from 'Tienshinhan'?", "Tienshinhan",text) in list ("Yes","No","Offers"))
						if("Yes")
							set src in oview(1)
							set category = "Communication"
							switch(input("Which technique do you want to learn?" , "Tienshinhan", text) in list ("Tayioken","Super Tayioken","No"))
								if("Tayioken")
									if(usr.maxpowerlevel < 3000)
										usr << "You need to be a bit stronger."
									if(usr.maxpowerlevel >= 3000)
										usr.contents += new /obj/Tayioken
										alert("Tienshinhan teaches Tayioken")
								if("Super Tayioken")
									if(usr.maxpowerlevel < 7000)
										usr << "You need to be a bit stronger."
									if(usr.maxpowerlevel >= 7000)
										usr.contents += new /obj/SuperTayioken
										alert("Tienshinhan teaches Super Tayioken")
						if("Offers")
							alert("You can learn currently: Tayioken, Super Tayioken")


		Goku
			name = "Kakarotto"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Saiya-jin"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "Goku"
			rhair = 40
			ghair = 80
			bhair = 255
			poratta = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("Greetings, I am Goku.")
					switch(input("Do you want to know what I can teach you?", "Goku",text) in list ("Yes","No"))
						if("Yes")
							alert("You can learn currently: Inner Strength , Kamikaze Suicide Blast , Chou Kame Hame Ha")

				Learn()
					set src in oview(1)
					set category = "Communication"
					switch(input("Which move do you wish to learn?", "Goku",text) in list ("Inner Strength","Kamikaze Suicide Blast","Chou Kame Hame Ha"))
						if("Inner Strength")
							if(usr.unlock == 1)
								usr << "I have already released your inner strength!"
							if(usr.unlock == 0||usr.unlock == null)
								if(usr.maxpowerlevel < 10000)
									usr << "You need to be a bit stronger."
								if(usr.maxpowerlevel >= 10000&&usr.maxpowerlevel <= 25000)
									usr.unlock = 1
									usr.maxpowerlevel = (usr.maxpowerlevel * (rand(2,3)))
									usr << "You feel your hidden power be unlocked!"
								else
									usr<<"You have no inner strength that I can release!"
						if("Kamikaze Suicide Blast")
							if(usr.maxpowerlevel >= 10000000)
								usr.contents += new /obj/sui
								usr<<"You now know Kamikaze Suicide Blast!"
							else
								usr<<"You need to be a bit stronger!"
						if("Chou Kame Hame Ha")
							if(usr.maxpowerlevel < 1500000)
								usr << "You need to be stronger."
							if(usr.maxpowerlevel >= 1500000)
								if(usr.will >= 40 && usr.honor >= 40 && usr.purity >= 40)
									usr.contents += new /obj/ChouKamehameha
									usr.kame = 0
								else
									usr << "<b>You need to be at least 40 will, honor, and purity,"

		Kame
			name = "Kamé-sennin"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Human"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "roshi"
			verb
				Learn()
					set src in oview(1)
					set category = "Communication"
					switch(input("Do you wish to learn the technique, 'Kame Hame Ha wave'?" , "Kame", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 100000)
								usr << "You need to be stronger."
							if(usr.maxpowerlevel >= 100000)
								if(usr.will >= 20 && usr.honor >= 20 && usr.purity >= 20)
									usr.contents += new /obj/Kamehameha
									usr.kame = 0
								else
									usr << "<b>You need to be at least 20 will, honor, and purity,"
		Trunks
			name = "Trunks"
			powerlevel = 500000
			maxpowerlevel = 500000
			race = "Halfbreed"
			icon = 'trunks.dmi'
			npc = 1
			icon_state = "trunks"
			verb
				Learn()
					set src in oview(1)
					set category = "Communication"
					switch(input("Do you wish to learn the technique, 'Enrage'?" , "Trunks", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 155000)
								usr << "You need to be stronger."
							if(usr.maxpowerlevel >= 155000)
								alert("I shall now teach you Enrage.")
								flick("rage", src)
								usr << "<font color = green>{{<font color = white>Trunks<font color = green>}}<font color = white>: You need to focus your ki, and remember the hateful things in the past. For example, the recent death of [usr.ragename]."
								usr.contents += new /obj/enrage
		Barber
			name = "Bob the Barber"
			race = "Human"
			powerlevel = 3
			maxpowerlevel = 3
			icon = 'mobs.dmi'
			icon_state = "barber"
			npc = 1
			verb
				Cut_my_hair()
					set src in oview(2)
					set category = "Communication"
					usr.overlays -= 'hair_black_long.dmi'
					usr.overlays -= 'hair_goku.dmi'
					usr.overlays -= 'hair_vegeta.dmi'
					usr.overlays -= 'hair_black_spikey.dmi'
					usr.overlays -= 'hair_black_short.dmi'
					switch(input("What hair style do you want?", "Barber", text) in list ("Long","Spikey","Short","Goku","Vegeta","Bald"))
						if("Bald")
							usr.hair = "Bald"
						if("Short")
							usr.hair = "Short"
							usr.overlays += 'hair_black_short.dmi'
						if("Spikey")
							usr.hair = "Spikey"
							usr.overlays += 'hair_black_spikey.dmi'
						if("Long")
							usr.hair = "Long"
							usr.overlays += 'hair_black_long.dmi'
						if("Vegeta")
							usr.hair = "Vegeta"
							usr.overlays += 'hair_vegeta.dmi'
						if("Goku")
							usr.hair = "Goku"
							usr.overlays += 'hair_goku.dmi'

		Piccolo
			name = "Piccolo"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Namek"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "piccolo"
			verb
				Learn()
					set src in oview(1)
					set category = "Communication"
					switch(input("Do you wish to learn the technique, 'Special Beam Cannon'?" , "Piccolo", text) in list ("Yes","No"))
						if("Yes")
							if(usr.race == "Namek-jin")
								if(usr.maxpowerlevel < 55000)
									usr << "You need to be stronger."
								if(usr.maxpowerlevel >= 55000)
									alert("I shall now teach you Special Beam Cannon.")
									usr<<"You now know Special Beam Cannon!"
									usr.contents += new /obj/Sbc
							else
								usr<<"Only Nameks can learn this technique!"
					switch(input("Do you wish to learn the technique, 'Regeneration'?" , "Piccolo", text) in list ("Yes","No"))
						if("Yes")
							if(usr.race == "Namek-jin")
								if(usr.maxpowerlevel < 190000)
									usr << "You need to be stronger."
								if(usr.maxpowerlevel >= 190000)
									alert("I shall now teach you Regeneration.")
									usr<<"You now know Regeneration!"
									usr.contents += new /obj/regen
							else
								usr<<"Only Nameks can learn this technique!"
		Krillin
			name = "Krillin"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Human"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "krillin"
			verb
				Learn()
					set src in oview(1)
					set category = "Communication"
					switch(input("Do you wish to learn the technique, 'Destructo Disc'?" , "Krillin", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 95000)
								usr << "You need to be stronger."
							if(usr.maxpowerlevel >= 95000)
								usr.contents += new /obj/kienzan
								usr.kame = 0
		FireIce
			name = "Fire and Ice Warden"
			powerlevel = 5000000
			maxpowerlevel = 5000000
			race = "Other"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "fireice"
			verb
				Learn()
					set src in oview(1)
					set category = "Communication"
					switch(input("Which technique do you wish to learn?" , "Fire and Ice Warden", text) in list ("Flame Spinner Attack","Ice Spinning Attack"))
						if("Flame Spinner Attack")
							if(usr.maxpowerlevel < 250000)
								usr << "You need to be stronger."
							if(usr.maxpowerlevel >= 250000)
								usr.contents += new /obj/FireSpin
								usr.kame = 0
						if("Ice Spinning Attack")
							if(usr.maxpowerlevel < 250000)
								usr << "You need to be stronger."
							if(usr.maxpowerlevel >= 250000)
								usr.contents += new /obj/IceSpin
								usr.kame = 0
		Shadow
			name = "Shadow Stalker"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Shadow"
			icon = 'shadow.dmi'
			icon_state = "s"
			npc = 1
			verb
				Learn()
					set src in oview(3)
					set category = "Communication"
					switch(input("Do you wish to learn the technique, 'Shadow Hide'?" , "Shadow Stalker", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 200000)
								usr << "You need to be stronger."
							if(usr.maxpowerlevel >= 200000)
								usr.contents += new /obj/Shadow
								usr.kame = 0

		Mystic
			name = "Mystic"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Unknown"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "Mystic"
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					if(mystic == 0|| mystic == null)
						usr<<"Peaceful out here isn't it?  I love just to stand here watching the waves..."
						mystic = 1
						switch(input("Would you like to join me and meditate?", text) in list ("Yes","No"))
							if("Yes")
								usr.icon_state = "meditate"
								sleep(1200)
								usr<<"Woah, I think being out here did some real good for you!"
								usr.maxpowerlevel += (usr.maxpowerlevel/ rand(50,100)) * rand (1,4)
								usr.icon_state = ""
								mystic = 0
		DeadN1
			name = "Dead Namek"
			powerlevel = 1
			maxpowerlevel = 75000
			race = "Namek"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "deadn"
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					if(usr.race=="Namek")
						if(usr.N1==0||usr.N1==null)
							usr<<"*Cough*Kill*cough*FREIZA!!*cough*"
							sleep(12)
							usr<<"FUSE WITH ME!!! IT'S THE ONLY WAY!!"
							switch(input("FUSE?", text) in list ("Ok","No, I'm fine"))
								if("Ok")
									usr<<"May Freiza ROT IN HFIL!"
									usr<<"You have fused, your PL has risen!"
									usr.maxpowerlevel += 75000
									usr.Str += 6
									usr.Def += 7
									usr.maxpowerdam += 80000
								if("No, I'm fine")
									usr<<"You BLITHERING POMPOUS IDIOT, we are ALL going to die!!"
						else
							usr<<"You cannot talk with a dead body!"
					else
						usr<<"GET ME A NAMEKIAN!"

		DeadN2
			name = "Dead Namek"
			powerlevel = 1
			maxpowerlevel = 55000
			race = "Namek"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "deadn"
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					if(usr.race=="Namek")
						if(usr.N2==0||usr.N2==null)
							usr<<"*Cough*We*cough*have to*cough*kill...*cough*FREIZA!!*cough*"
							sleep(12)
							usr<<"YOU MUST FUSE WITH ME!!! IT'S THE ONLY WAY!! LOOK AT WHAT THAT WHITE AND PURPLE BAR STEWARD HAS DONE TO OUR WORLD!!!"
							switch(input("FUSE?", text) in list ("Ok","No, I'm fine"))
								if("Ok")
									usr<<"May Freiza ROT IN HFIL for all he has done!"
									usr<<"You have fused, your PL has risen!"
									usr.maxpowerlevel += 55000
									usr.Str += 13
									usr.Def += 15
									usr.maxpowerdam += 60000
								if("No, I'm fine")
									usr<<"You POMPOUS BLITHERING IDIOT, we are ALL going to die!!"
						else
							usr<<"You cannot talk with a dead body!"
					else
						usr<<"GET ME A NAMEKIAN!"
		Gero
			name = "Gero"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Android"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "gero"
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("Greetings, I am Doctor Gero.")
					if(usr.race == "Android"||usr.race == "Biological Android")
						usr<<"I created you!"
						usr<<"You are MY masterpiece!!!"
					else
						usr<<"Hmm..a creation of nature...you disgust me!"
				Learn()
					set src in oview(1)
					set category = "Communication"
					if(usr.race == "Android"||usr.race == "Biological Android")
						switch(input("Do you wish to learn the technique, 'Power Flying'?" , "Gero", text) in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 1000)
									usr << "Weak."
								if(usr.maxpowerlevel >= 1000)
									usr.contents += new /obj/bukujutsu
						switch(input("Do you wish to learn the technique, 'World Scan'?" , "Gero", text) in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 10000)
									usr << "You need to be a bit stronger."
								if(usr.maxpowerlevel >= 10000)
									usr.contents += new /obj/worldscan
						switch(input("Do you wish to learn the technique, 'Ki Absorb'?" , "Gero", text) in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 50000)
									usr << "You need to be a bit stronger."
								if(usr.maxpowerlevel >= 50000)
									usr.contents += new /obj/kiabsorb
						switch(input("Do you wish to learn the technique, 'Tech. Workings'?" , "Gero", text) in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 100000)
									usr << "You need to be a bit stronger."
								if(usr.maxpowerlevel >= 100000)
									usr.contents += new /obj/techwork
					else
						alert("You are not my creation!")

mob
	monsters
		Green_Saibaman
			Str = 2
			Def = 2
			powerlevel = 100
			maxpowerlevel = 100
			dead = 0
			icon = 'saiba.dmi'
			npp = 0
			ko = 0
			safe = 0
			race = "Saibaman"
			state = "Normal"
		Red_Saibaman
			Str = 8
			Def = 8
			powerlevel = 240
			maxpowerlevel = 240
			dead = 0
			icon = 'saiba.dmi'
			icon_state = "red"
			npp = 0
			ko = 0
			safe = 0
			race = "Saibaman"
			state = "Normal"
		Blue_Saibaman
			Str = 3
			Def = 3
			powerlevel = 120
			maxpowerlevel = 120
			dead = 0
			icon = 'saiba.dmi'
			icon_state = "blue"
			npp = 0
			ko = 0
			safe = 0
			race = "Saibaman"
			state = "Normal"
mob
	pets
		Lamass
			icon='Pets.dmi'
			icon_state = "Lamass"
			npp = 0
		Zebba
			icon='Pets.dmi'
			icon_state = "Zebba"
			npp = 0
		Tauros
			icon='Pets.dmi'
			icon_state = "Tauros"
			npp = 0
		BlueBunny
			icon='bunny.dmi'
			icon_state = "blue"
			npp = 0
		RedBunny
			icon='bunny.dmi'
			icon_state = "red"
			npp = 0
		WhiteBunny
			icon='bunny.dmi'
			icon_state = "white"
			npp = 0
		RainbowBunny
			icon='bunny.dmi'
			icon_state = "rainbow"
			npp = 0


mob
	monsters
		Radditz
			Str = 16
			Def = 17
			powerlevel = 1250
			maxpowerlevel = 1250
			dead = 0
			icon = 'raditzsagamobs.dmi'
			icon_state = "raditz"
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			race = "Saiya-jin (NPC)"
			state = "Normal"
		Vegeta
			Str = 39
			Def = 34
			powerlevel = 12500
			maxpowerlevel = 12500
			dead = 0
			icon = 'vegeta.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			race = "Vegeta (NPC)"
			state = "Normal"
		SanShenron
			Str = 98
			Def = 117
			powerlevel = 1120500
			maxpowerlevel = 1120500
			dead = 0
			icon = 'sanshenron.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			race = "San-Shenron (NPC)"
			state = "Cold"
		SuuShenron
			Str = 98
			Def = 117
			powerlevel = 1100500
			maxpowerlevel = 1100500
			dead = 0
			icon = 'suushenron.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			race = "Suu-Shenron (NPC)"
			state = "Hot"
		SSJVegeta
			Str = 70
			Def = 76
			powerlevel = 120500
			maxpowerlevel = 120500
			dead = 0
			icon = 'vegeta.dmi'
			icon_state = "ssj"
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			race = "SSJVegeta (NPC)"
			state = "Super Saiya-jin"
		Freiza
			Str = 65
			Def = 64
			powerlevel = 112000
			maxpowerlevel = 112000
			dead = 0
			icon = 'changling.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			race = "Freiza (NPC)"
			state = "Normal"
		Buu
			Str = 312
			Def = 298
			powerlevel = 950000
			maxpowerlevel = 950000
			dead = 0
			icon = 'buu.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			race = "Buu (NPC)"
			state = "Normal"
mob
	monsters
		bman
			Str = 1
			Def = 10
			powerlevel = 1000
			maxpowerlevel = 1000
			dead = 0
			icon = 'bman.dmi'
			ko = 0
			safe = 0

			race = "Scottish Cheese"
			state = "Fecked"
mob
	other
		drbriefs
			name = "Dr. Briefs"
			npp = 1
			npc = 1
			icon = 'mobs.dmi'
			icon_state = "briefs"
			verb
				Learn()
					set src in oview(1)
					set name = "Learn"
					set category = "Communication"
					if(usr.maxpowerlevel >= 300000)
						if(usr.race == "Earth-sei-jin"||usr.race == "Android"||usr.race == "Biological Android"||usr.race == "Namekian")
							switch(input("Do you wish to learn Create?", "Create", text) in list ("Yes","No"))
								if("Yes")
									usr.contents += new /obj/Create
						else
							usr << "I cannot teach you."
					else
						usr << "You must be stronger."





obj/sense/verb
	Sense()
		set category = "Fighting"
		var/huge = 0
		var/strong = 0
		var/weak = 0
		var/ext = 0
		var/mob/M
		usr << "<b>\red Fellow Players:"
		for(M as mob in world)
			if(M.client)
				if(M.powerlevel >= 50000000)
					ext += 1
				if(M.powerlevel >= 10000 && M.powerlevel < 50000000)
					huge += 1
				if(M.powerlevel >= 1000 && M.powerlevel < 10000)
					strong += 1
				if(M.powerlevel < 1000)
					weak += 1
		spawn(3)
			usr << "<b>\cyan [huge] <font color = yellow>Huge Powers detected! [M]"
			usr << "---------------------------------------"
			usr << "<b>\cyan [strong] <font color = green>Strong Powers detected!"
			usr << "---------------------------------------"
			usr << "<b>\cyan [weak] <font color = white>Weak Powers detected!"
			if(ext >= 1)
				usr << "---------------------------------------"
				usr << "<b>\yellow [ext] <font color = yellow>Extremely Huge Powers can be detected!"

mob
	master
		icon = 'mobs.dmi'
		icon_state = "master"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings! You are now in the newbie central,I'll send you into the world of Zeta.")
				usr.loc=locate(47,27,2)
				alert("If Admin do not like your name they can/will boot, rename, or vape you!")
mob
	TeleHelper1
		icon = 'mobs.dmi'
		icon_state= "TeleHelper"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				usr << "This island was erected recently to support the power of Teleportation! Now you can teleport to different planets!!  Planet Tium on the left, Planet Namek on the right!"
mob
	TeleHelper2
		icon = 'mobs.dmi'
		icon_state= "TeleHelper"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				usr<<"Earth Teleport on the left, Namek on the right!"
mob
	TeleHelper3
		icon = 'mobs.dmi'
		icon_state= "TeleHelper"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				usr<<"Earth Teleport on the right, Tium on the left!"
mob
	Bebi
		icon = 'mobs.dmi'
		icon_state= "Bebi"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				if(usr.maxpowerlevel >= 1000000)
					if(usr.bebi == 0||usr.bebi == null)
						usr << "Yum!! A body!!!  You look really lonely in there, may I join you? I will increase your pl...but you may be stuck with me forever!"
					else
						usr<<"You here a voice in your head...'My old body...'"
				else
					usr<<"You are very weak..I would hate to be stuck in a body so weak!"
			Fuse()
				set src in oview(1)
				set category = "Communication"
				if(usr.bebi == 0||usr.bebi == null)
					if(usr.maxpowerlevel>= 1000000)
						switch(input("If you let me join you in your body, I'll boost your Pl...but I'll remain in there forever!", "Fuse with Bebi", text) in list ("Yes", "No"))
							if("Yes")
								usr.bebi = 1
								usr.maxpowerlevel += 150000
								usr.overlays += icon('mobs.dmi',"bebifuse")
								if(usr.hair == "Spikey")
									usr.overlays += 'hair_black_spikey.dmi'
								if(usr.hair == "Long")
									usr.overlays += 'hair_black_long.dmi'
								if(usr.hair == "Short")
									usr.overlays += 'hair_black_short.dmi'
								if(usr.hair == "Goku")
									usr.overlays += 'hair_goku.dmi'
								if(usr.hair == "Vegeta")
									usr.overlays += 'hair_vegeta.dmi'
								usr<<"You here a voice inside your head..'Yum, this body is perfect for me!'"
							if("No")
								usr<<"GET OUT, IF YOU'RE NOT GONNA LET ME STAY IN YOUR BODY I DON'T WANT YOU IN MY HOUSE!!!"
					else
						usr<<"ME, enter YOU??? I believe your pitiful body couldn't hold my vast power for more than 2 seconds!"
				else
					usr<<"You here a voice inside your head...'You can't fuse with my old body!'"

mob
	helperone
		icon = 'mobs.dmi'
		icon_state = "helper one"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Welcome to the Akira Chronicles! Glad to have you with us! Continue Forward, and talk to all of the helpers.")
				usr << "[src] gives you something..."
				usr.contents += new /obj/blackgi

mob
	gohan
		icon = 'mobs.dmi'
		icon_state = "gohan"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings. How are you today?")

	videl
		icon = 'mobs.dmi'
		icon_state = "videl"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings. I hope Pans OK!")
mob
	helpertwo
		icon = 'mobs.dmi'
		icon_state = "helper two"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Welcome to Dragonball Zeta!")
				if(usr.gave == null)
					usr << "[src] gives you 5000 zenni."
					usr.zenni += 5000
					usr.gave = 1
				if(usr.gave == 1)
					usr.powerlevel += 0

mob
	helperthree
		icon = 'mobs.dmi'
		icon_state = "helper"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				if(usr.chose == 1)
					usr << "You have spoken to me already."
				if(usr.chose == 0||usr.chose == null)
					usr.chose = 1
					switch(input("What alignment do you want? (Its important you know the advantages/disadvantages of each alignment.", "Character Creation", text) in list ("Good", "Evil"))
						if("Good")
							usr.random = rand(1,1000)
							if(usr.random == 1000)
								if(usr.race == "Saiya-jin")
									world << "<b><font color = green>A new Super Saiya-jin has been born."
									usr.overlays = 0
									alert("Your character was born a Super Saiya-jin. Do not delete this character.")
									usr.powerlevel = 3000000
									usr.maxpowerlevel = 3000000
									usr.attribute = "Legendary Super Saiya-jin"
								else
									world << "<b><font color = green>A god has arrived."
									usr.powerlevel = 100000
									usr.maxpowerlevel = 100000
									alert("Your character was born a legend. Do not delete this character.")
									usr.attribute = "Legend"

							if(usr.random < 999 && usr.random >= 899)

								alert("Elite: You are superiorly strong. You were born in an Elite Family, which gives you advantage. But you will gain will and honor slower.")
								usr.maxpowerlevel += rand(1,1000)
								usr.purity -= rand(1,2)
								usr.honor -= rand(1,2)
								usr.will -= rand(1,2)
								usr.powerlevel = usr.maxpowerlevel
								usr.attribute = "Elite Warrior"
							if(usr.random < 898 && usr.random >= 700)

								alert("High-Class Warrior: You are a high-class warrior.You have excellent strength, but you are extremely weak in Ki.")
								usr.maxpowerlevel += rand(1,105)
								usr.powerlevel = usr.maxpowerlevel
								usr.purity += 1
								usr.honor += 1
								usr.will += 1
								usr.attribute = "High-Class Warrior"
							if(usr.random < 699 && usr.random >= 400)
								alert("Medium-Class Warrior: You are a medium-class warrior.You are equal in both Ki and Strength.")
								usr.maxpowerlevel += rand(1,30)
								usr.purity += rand(1,2)
								usr.honor += rand(1,2)
								usr.will += rand(1,2)
								usr.powerlevel = usr.maxpowerlevel
								usr.attribute = "Medium-Class Warrior"
							if(usr.random < 399 && usr.random >= 100)
								alert("Low-Class Warrior: You are a low-class warrior. You are weak at start, but will become stronger than most. You have good Will, Honor, and Purity.")
								usr.maxpowerlevel += rand(1,5)
								usr.purity += rand(3,5)
								usr.honor += rand(3,5)
								usr.will += rand(3,5)
								usr.powerlevel = usr.maxpowerlevel
								usr.attribute = "Low-Class Warrior"
							if(usr.random < 99 && usr.random >= 1)
								alert("Peasant Warrior: You are a peasant warrior. You are very weak at start, but will become stronger than most. You have awesome Will, Honor, and Purity. The legendary Kakarotto was this.")
								usr.purity += rand(5,10)
								usr.honor += rand(5,10)
								usr.will += rand(5,10)
								usr.powerlevel = usr.maxpowerlevel
								usr.attribute = "Peasant Warrior"


						if("Evil")
							usr.random = rand(1,1000)
							if(usr.random == 1000)
								if(usr.race == "Saiya-jin")
									world << "<b><font color = green>A new Super Saiya-jin has been born."
									usr.overlays = 0
									alert("Your character was born a Super Saiya-jin. Do not delete this character.")
									usr.powerlevel = 100000
									usr.maxpowerlevel = 100000
									usr.attribute = "Legendary Super Saiya-jin"
								else
									world << "<b><font color = green>The eternal darkness has arrived."
									usr.powerlevel = 100000
									usr.maxpowerlevel = 100000
									alert("Your character was born a legend. Do not delete this character.")
									usr.attribute = "Legend"
							if(usr.random < 999 && usr.random >= 899)

								alert("Elite: You are superiorly strong. You were born in an Elite Family, which gives you advantage. But you will gain will and honor slower.")
								usr.maxpowerlevel += rand(1,1000)
								usr.purity -= rand(1,2)
								usr.honor -= rand(1,2)
								usr.will -= rand(1,2)
								usr.powerlevel = usr.maxpowerlevel
								usr.attribute = "Elite Warrior"
							if(usr.random < 898 && usr.random >= 700)

								alert("High-Class Warrior: You are a high-class warrior.You have excellent strength, but you are extremely weak in Ki.")
								usr.maxpowerlevel += rand(1,25)
								usr.powerlevel = usr.maxpowerlevel
								usr.purity += 1
								usr.honor += 1
								usr.will += 1
								usr.attribute = "High-Class Warrior"
							if(usr.random < 699 && usr.random >= 400)
								alert("Medium-Class Warrior: You are a medium-class warrior.You are equal in both Ki and Strength.")
								usr.maxpowerlevel += rand(1,10)
								usr.purity += rand(1,2)
								usr.honor += rand(1,2)
								usr.will += rand(1,2)
								usr.powerlevel = usr.maxpowerlevel
								usr.attribute = "Medium-Class Warrior"
							if(usr.random < 399 && usr.random >= 100)
								alert("Low-Class Warrior: You are a low-class warrior. You are weak at start, but will become stronger than most. You have good Will, Honor, and Purity.")
								usr.maxpowerlevel += rand(1,5)
								usr.purity += rand(3,5)
								usr.honor += rand(3,5)
								usr.will += rand(3,5)
								usr.powerlevel = usr.maxpowerlevel
								usr.attribute = "Low-Class Warrior"
							if(usr.random < 99 && usr.random >= 1)
								alert("Peasant Warrior: You are a peasant warrior. You are very weak at start, but will become stronger than most. You have awesome Will, Honor, and Purity. The legendary Kakarotto was this.")
								usr.purity += rand(5,10)
								usr.honor += rand(5,10)
								usr.will += rand(5,10)
								usr.powerlevel = usr.maxpowerlevel
								usr.attribute = "Peasant Warrior"
					usr.chose = 1

mob
	kaioshin
		icon = 'mobs.dmi'
		icon_state = "kaioshin"
		name = "Kaio-shin"
		verb
			Talk(src in oview(1))
				if(usr.race == "Half-Saiyan")
					if(usr.maxpowerlevel >= 9000000)
						switch(input("Would you like be to release your hidden power?", "Kaioshin", text) in list ("Yes Please", "No"))
							if("Yes Please")
								switch(input("Are you sure?  It can take more than 15 minutes of gameplay!","Kaioshin",  text) in list ("Yes", "Maybe not then..."))
									if("Yes")
										usr<<"OK here we go!"
										usr<<"First, sit down!"
										usr.icon_state = "meditate"
										usr<<"OK, now I will go to work!"
										sleep(100)
										usr<< "Rikki Rikki Rikki"
										sleep(200)
										usr<< "Shala Hala Thalhalam"
										sleep(300)
										usr<< "Sukna Habidi Unasektahn"
										sleep(600)
										usr<< "Laaa Nappa Asrelza"
										sleep(1200)
										usr<< "Rakka Rakka Rakka"
										sleep(2400)
										usr<< "Saiamekumandroid"
										sleep(2400)
										usr<< "SHALAI HILI THALAIHOLOM!"
										sleep(1200)
										usr<<"RIKKI RIKKI RIKKI SHALA HALA THALHALAM SUKNA HABIDI UNASEKTAHN LAA NAPPA ASRELZA RAKKA RAKKA RAKKA SAIAMEKUMANDROID SHALAI HILI THALAIHOLOM!"
										sleep(50)
										usr<<"I believe you are finished!"
										usr.icon_state = ""
										usr.maxpowerlevel = usr.maxpowerlevel * 1.2
										usr.maxpowerdam = usr.maxpowerdam * 1.21
							if("No")
								usr<<"OK! Come back if you change your mind!"
					else
						usr<<"I have the innate ability to release the hidden POWER of a person, I can change a kitten to a lion, or a small lizard to a dinosaur!  But I only work on special people! Maybe when you're older, or stronger!"
				else
					usr<<"I have the innate ability to release the hidden POWER of a person, I can change a kitten to a lion, or a small lizard to a dinosaur! But I sense no inner POWER in you that you cannot already access..."

mob
	Fighter1/New()
		while(src)
			icon = 'mobs.dmi'
			icon_state = "Fighter1"
			sleep(5)
			src.loc = locate(src.x + 3,src.y + 3,src.z)
			sleep(5)
			src.loc = locate(src.x + 2,src.y - 7,src.z)
			sleep(5)
			src.loc = locate(src.x - 5,src.y + 4,src.z)
mob
	Fighter2/New()
		while(src)
			icon = 'mobs.dmi'
			icon_state = "Fighter2"
			sleep(5)
			src.loc = locate(src.x + 3,src.y + 3,src.z)
			sleep(5)
			src.loc = locate(src.x + 2,src.y - 7,src.z)
			sleep(5)
			src.loc = locate(src.x - 5,src.y + 4,src.z)