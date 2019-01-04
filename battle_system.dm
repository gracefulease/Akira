mob
	var
		lifecycle_delay = 10
		movement_probability = 50


	Move()
		if (isDead())
			return 0
		return ..()

	proc
		Attack(mob/M)
			var/damage = (usr.Str * 2)/(M.Def * 2)
			M.TakeDamage(src, damage)
		TakeDamage(mob/attacker, damage)
			if (istype(src, /mob/other))
				usr << "<font color=red>No..."
			else
				if(src.npp == 1|null)
					src.powerlevel += 0
				if(src.npp == 0)
					src.Die()
					attacker.powerlevel += rand(0,1)
					attacker.random = rand(1,3)
					if(src.powerlevel >= 1)
						if(attacker.random == 1)
							view(6) << "<font color = blue><i>[attacker.name] punches [src] in the face."
							src.powerlevel -= round(damage+1)
						if(attacker.random == 2)
							view(6) << "<font color = blue><i>[attacker.name] kicks [src]."
							src.powerlevel -= round(damage + 5)
						if(attacker.random == 3)
							view(6) << "<font color = blue><i>[attacker.name] stumbles and misses [src]."
							src.powerlevel -= 0

		isDead()
			if (move == 0)
				return 1
			return 0

		LifeCycle()
			if (client || isDead())
				return 1

			if (prob(movement_probability))
				step_rand(src)

			spawn(lifecycle_delay)
				LifeCycle()

		Powerdamup()
			if(usr.powerdam < usr.maxpowerdam)
				usr.powerdam += round((usr.maxpowerdam/100)/(rand(1,20))*(rand(1,2)))
			if(usr.powerdam >= usr.maxpowerdam)
				usr.powerdam = usr.maxpowerdam
			sleep(35)
			Powerdamup()

		PetLifeCycle()
			if (client || isDead())
				return 1

			if (prob(movement_probability))
				step_rand(src)

			spawn(lifecycle_delay)
				PetLifeCycle()


		NPP()
			if(usr.maxpowerlevel >= 500)
				usr.npp = 0
			else
				usr.npp = 1

		FlightLearn()
			if(usr.maxpowerlevel >= 100)
				if(usr.flightlearn == 0)
					usr.flightlearn = 1
					usr.contents += new /obj/bukujutsu
					usr << "<font color = red><b><i>You have aquired the knowledge of <u>Bukujutsu</u></font>!"
					usr.maxpowerdam += 50
				else
					usr.maxpowerlevel += 0
			else
				usr.maxpowerlevel += 0

		KiTechLearn()
			if(usr.maxpowerlevel >= 150)
				if(usr.kitechlearn == 0)
					usr.kitech = "Aquired"
					usr.kitechlearn = 1
					usr << "<font color = red><b><i>You have aquired the knowledge of <u>Ki Tech.</u></font>!"
					usr.maxpowerdam += 20
				else
					usr.maxpowerlevel += 0
			else
				usr.maxpowerlevel += 0

		AuraTechLearn()
			if(usr.maxpowerlevel >= 375)
				if(usr.auratechlearn == 0)
					usr.auratech = "Aquired"
					usr.auratechlearn = 1
					usr << "<font color = red><b><i>You have aquired the knowledge of <u>Aura Tech.</u></font>!"
					usr.maxpowerdam += 40
					usr.contents += new /obj/aura
					usr.contents += new /obj/sense
				else
					usr.maxpowerlevel += 0
			else
				usr.maxpowerlevel += 0

		AuraMake()
			if(usr.maxpowerlevel >= 2500)
				if(usr.aura == 0||usr.aura == null)
					alert("You will now be able to choose your aura color.")
					usr.underlays -= /obj/whiteaura
					usr.aura = 1
					var/cred = input("How much red do you want in your aura? (0,0,0 = White Aura, 255,255,255 = Black Aura)") as num
					var/cgreen = input("How much green do you want in your aura? (0,0,0 = White Aura, 255,255,255 = Black Aura)") as num
					var/cblue = input("How much blue do you want in your aura? (0,0,0 = White Aura, 255,255,255 = Black Aura)") as num
					usr.customred = cred
					usr.customgreen = cgreen
					usr.customblue = cblue



		techcheck()
			if(usr.powerlevel >= usr.maxpowerlevel)
				usr.powerlevel += 0
			if(usr.powerlevel < usr.maxpowerlevel)
				if(usr.tech == 0)
					usr.powerlevel += 0
				if(usr.tech == 1)
					usr.powerlevel += ((usr.maxpowerlevel/usr.powerlevel) + rand(1,(usr.powerlevel/10)))
					sleep(4)
					usr.techcheck()


		bitchslap()
			if(src.slap == 0)
				src.powerlevel += 0
			if(src.slap == 1)
				src << "God: BITCH! *God smacks you!*"
				src.maxpowerlevel -= src.maxpowerlevel / 8
				src.will -= 1
				src.honor -= 1
				src.purity -= 1


		XP()
			if(usr.XP>=usr.MaxXP)
				if(usr.MaxXP <= 10)
					usr.XP=usr.MaxXP-usr.XP
					usr.MaxXP=round(usr.MaxXP*2)
					usr.Str+=1
					usr.Def+=1
					usr.maxpowerlevel += rand(1,1000)
					usr.maxpowerdam += rand(2,800)
				if(usr.MaxXP <= 100)
					usr.XP=usr.MaxXP-usr.XP
					usr.MaxXP=round(usr.MaxXP*1.5)
					usr.Str+=1
					usr.Def+=1
					usr.maxpowerlevel += rand(1,1000)
					usr.maxpowerdam += rand(20,1200)
				if(usr.MaxXP <= 500)
					usr.XP=usr.MaxXP-usr.XP
					usr.MaxXP=round(usr.MaxXP*1.1)
					usr.Str+=1
					usr.Def+=1
					usr.maxpowerlevel += rand(1,1000)
					usr.maxpowerdam += rand(80,5000)
				if(usr.MaxXP >= 500)
					usr.XP=usr.MaxXP-usr.XP
					usr.MaxXP=round(usr.MaxXP*1.01)
					usr.Str+=1
					usr.Def+=1
					usr.maxpowerlevel += rand(1,1000)
					usr.maxpowerdam += rand(200,8000)


		FocusLearn()
			if(usr.maxpowerlevel >= 425)
				if(usr.focustechlearn == 0)
					usr.focustech = "Aquired"
					usr.focustechlearn = 1
					usr.focused = 0
					usr << "<font color = red><b><i>You have aquired the knowledge of <u>Focus Tech.</u></font>!"
					usr.contents += new /obj/focus
					usr.maxpowerdam += 200
				else
					usr.maxpowerlevel += 0
			else
				usr.maxpowerlevel += 0

		KiBlastLearn()
			if(usr.maxpowerlevel >= 800)
				if(usr.kiblastlearn == 0||usr.kiblastlearn == null)
					usr.kiblastlearn = 1
					usr << "<font color = red><b><i>You have aquired the knowledge of <u>Ki blasts!.</u></font>!"
					usr.contents += new/obj/KiBlast
				else
					usr.maxpowerlevel += 0
			else
				usr.maxpowerlevel += 0

		//-------------------------------------------------
		//IMPORTANT//
		LearnAll()
			usr.FlightLearn()
			usr.KiTechLearn()
			usr.AuraTechLearn()
			usr.FocusLearn()
			usr.KiBlastLearn()
			usr.SSJ()
			usr.SSJ2()
			usr.SSJ3()
			usr.SSJ4()
			usr.SSJ5()
			usr.SSJ6()
			usr.HSSJ()
			usr.HSSJ2()
			usr.SH()
			usr.SH2()
			usr.SN()
			usr.SN2()
			usr.NPP()
			usr.XP()
			usr.C2()
			usr.C3()
			usr.C4()
			usr.SuperAnd()

		C2()
			if(usr.maxpowerlevel >= 350000)
				if(usr.race=="Changeling")
					if(usr.ssjlearn ==0||usr.ssjlearn == null)
						usr.ssjlearn = 1
						usr.verbs+=(/mob/verb/Transform)
						usr<<"<font color = red><b><i>You can move to your <u>Second Form</u></font>!!!"
		C3()
			if(usr.maxpowerlevel >= 900000)
				if(usr.race=="Changeling")
					if(usr.ssj2learn ==0||usr.ssj2learn == null)
						usr.ssj2learn = 1
						usr.verbs+=(/mob/verb/Transform)
						usr<<"<font color = red><b><i>You can move to your <u>Third Form</u></font>!!!"
		C4()
			if(usr.maxpowerlevel >= 9000000)
				if(usr.race=="Changeling")
					if(usr.ssj3learn ==0||usr.ssj3learn == null)
						usr.ssj3learn = 1
						usr.verbs+=(/mob/verb/Transform)
						usr<<"<font color = red><b><i>You can move to your <u>Final Form</u></font>!!!"

		SuperAnd()
			if(usr.maxpowerlevel >= 320000)
				if(usr.race=="Android")
					if(usr.ssjlearn ==0||usr.ssjlearn == null)
						usr.ssjlearn = 1
						usr.verbs+=(/mob/verb/Transform)
						usr<<"<font color = red><b><i>You can go to <u>Super Android</u></font>!!!"
		SH()
			if(usr.maxpowerlevel >= 310000)
				if(usr.race == "Human")
					if(usr.ssjlearn ==0||usr.ssjlearn == null)
						usr.ssjlearn = 1
						usr.ssj = 0
						usr << "<font color = red><b><i>You can go <u>Super Human</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)

		SH2()
			if(usr.maxpowerlevel >= 775000)
				if(usr.race == "Human")
					if(usr.ssj2learn ==0||usr.ssj2learn == null)
						usr.ssj2learn = 1
						usr << "<font color = red><b><i>You can go <u>Super Human 2</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)
		SN()
			if(usr.maxpowerlevel >= 300000)
				if(usr.race == "Namek-jin")
					if(usr.ssjlearn ==0||usr.ssjlearn == null)
						usr.ssjlearn = 1
						usr << "<font color = red><b><i>You can go <u>Super Namek</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)
		SN2()
			if(usr.maxpowerlevel >= 750000)
				if(usr.race == "Namek-jin")
					if(usr.ssjlearn ==0||usr.ssjlearn == null)
						usr.ssj2learn = 1
						usr << "<font color = red><b><i>You can go <u>Super Namek 2</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)
		HSSJ()
			if(usr.maxpowerlevel >= 320000)
				if(usr.ssjlearn ==0||usr.ssjlearn == null)
					if(usr.race=="Half-Saiyan")
						usr.ssjlearn = 1
						usr << "<font color = red><b><i>You can go <u>Super Saiyan</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)
		HSSJ2()
			if(usr.maxpowerlevel >= 800000)
				if(usr.ssj2learn ==0||usr.ssj2learn == null)
					if(usr.race=="Half-Saiyan")
						usr.ssj2learn = 1
						usr << "<font color = red><b><i>You can go <u>Ascended Super Saiyan</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)
		SSJ()
			if(usr.maxpowerlevel >= 320000)
				if(usr.ssjlearn ==0||usr.ssjlearn == null)
					if(usr.race=="Saiya-jin")
						usr.ssjlearn = 1
						usr << "<font color = red><b><i>You can go <u>Super Saiyan</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)
		SSJ2()
			if(usr.maxpowerlevel >= 800000)
				if(usr.ssj2learn ==0||usr.ssj2learn == null)
					if(usr.race=="Saiya-jin")
						usr.ssj2learn = 1
						usr << "<font color = red><b><i>You can go <u>Ascended Super Saiyan</u></font>!!!"

		SSJ3()
			if(usr.maxpowerlevel >= 8000000)
				if(usr.ssj3learn ==0||usr.ssj3learn == null)
					if(usr.race=="Saiya-jin")
						usr.ssj3learn = 1
						usr << "<font color = red><b><i>You can go <u>Super Saiyan 3</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)
		SSJ4()
			if(usr.maxpowerlevel >= 80000000)
				if(usr.ssj4learn ==0||usr.ssj4learn == null)
					if(usr.race=="Saiya-jin")
						usr.ssj4learn = 1
						usr << "<font color = red><b><i>You can go <u>Super Saiyan 4</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)
		SSJ5()
			if(usr.maxpowerlevel >= 200000000)
				if(usr.ssj5learn ==0||usr.ssj5learn == null)
					if(usr.race=="Saiya-jin")
						usr.ssj5learn = 1
						usr << "<font color = red><b><i>You can go <u>Super Saiyan 5</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)
		SSJ6()
			if(usr.maxpowerlevel >= 5000000000)
				if(usr.ssj6learn ==0||usr.ssj6learn == null)
					if(usr.race=="Saiya-jin")
						usr.ssj6learn = 1
						usr << "<font color = red><b><i>You can go <u>Super Saiyan 6</u></font>!!!"
						usr.verbs+=(/mob/verb/Transform)
		LogSN()
			if(usr.maxpowerlevel >= 300000)
				if(usr.race=="Namek-jin")
					usr.ssjlearn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogSN2()
			if(usr.maxpowerlevel >= 750000)
				if(usr.race=="Namek-jin")
					usr.ssj2learn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogSuperAnd()
			if(usr.maxpowerlevel >= 320000)
				if(usr.race=="Android")
					usr.ssjlearn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogSH()
			if(usr.maxpowerlevel >= 310000)
				if(usr.race=="Human")
					usr.ssjlearn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogSH2()
			if(usr.maxpowerlevel >= 775000)
				if(usr.race=="Human")
					usr.ssj2learn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogHSSJ()
			if(usr.maxpowerlevel >= 320000)
				if(usr.race=="Half-Saiyan")
					usr.ssjlearn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogHSSJ2()
			if(usr.maxpowerlevel >= 800000)
				if(usr.race=="Half-Saiyan")
					usr.ssj2learn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogSSJ()
			if(usr.maxpowerlevel >= 320000)
				if(usr.race=="Saiya-jin")
					usr.ssjlearn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogSSJ2()
			if(usr.maxpowerlevel >= 800000)
				if(usr.race=="Saiya-jin")
					usr.ssj2learn = 1
					usr.verbs+=(/mob/verb/Transform)

		LogSSJ3()
			if(usr.maxpowerlevel >= 8000000)
				if(usr.race=="Saiya-jin")
					usr.ssj3learn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogSSJ4()
			if(usr.maxpowerlevel >= 80000000)
				if(usr.race=="Saiya-jin")
					usr.ssj4learn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogSSJ5()
			if(usr.maxpowerlevel >= 200000000)
				if(usr.race=="Saiya-jin")
					usr.ssj5learn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogSSJ6()
			if(usr.maxpowerlevel >= 5000000000)
				if(usr.race=="Saiya-jin")
					usr.ssj6learn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogC2()
			if(usr.maxpowerlevel >= 350000)
				if(usr.race=="Changeling")
					usr.ssjlearn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogC3()
			if(usr.maxpowerlevel >= 900000)
				if(usr.race=="Changeling")
					usr.ssj2learn = 1
					usr.verbs+=(/mob/verb/Transform)
		LogC4()
			if(usr.maxpowerlevel >= 9000000)
				if(usr.race=="Changeling")
					usr.ssj3learn = 1
					usr.verbs+=(/mob/verb/Transform)
		Die()

			if(src.powerlevel <= 0)
				if(src.npp == 1||src.npp == null)
					src << "<b>You are about to die, but the letters <i>N P P</i>   appear in your brain."
				if(src.npp == 0)
					if(src.race == "Saibaman")
						usr.zenni += 50
						usr << "<b>You get 50 zenni from that kill."
						usr.maxpowerlevel += (rand(1,10))
						usr.maxpowerdam += rand(1,5)
						usr.XP += rand(1,4)
						src.loc=locate(0,0,0)
						sleep(100)
						del(src)
					if(src.race == "Oozaru")
						usr.zenni += 5000
						usr << "<b>You get 5000 zenni from that kill."
						usr.maxpowerlevel += (rand(1,10))
						usr.XP += rand(10,400)
						src.loc=locate(0,0,0)
						sleep(100)
						del(src)
					if(src.race == "Frieza (NPC)")
						usr.zenni += 5000
						usr << "<b>You get 5000 zenni from that kill."
						usr.maxpowerlevel += (rand(100,10000))
						usr.maxpowerdam += rand(100,5000)
						usr.XP += rand(10,400)
						del(src)
					if(src.race == "Saiya-jin (NPC)")
						usr.zenni += 2500
						usr << "<b>You get 2500 zenni from that kill."
						usr.maxpowerlevel += (rand(10,200))
						usr.maxpowerdam += rand(2,100)
						usr.XP += rand(4,8)
						del(src)
						sleep(500)
						new /mob/monsters/Radditz(locate(25,138,1))
					if(src.race == "Scottish Cheese")
						del(src)
					if(src.race == "Buu (NPC)")
						usr.XP += rand(25,50)
						usr.zenni += 5000
						usr << "<b>You get 5000 zenni from that kill."
						usr.maxpowerlevel += (rand(9000,10000))
						usr.maxpowerdam += rand(5000,10000)
						del(src)
					if(src.race == "Suu-Shenron")
						usr.XP += rand(30,60)
						usr.zenni +=5600
						usr << "<b>You get 5600 zenni from that kill."
						usr.maxpowerlevel += (rand(9900,19000))
						usr.maxpowerdam += rand(1000,8000)
						del(src)
					if(src.race == "Vegeta (NPC)")
						usr.XP += rand(20,50)
						usr.zenni += 5000
						usr << "<b>You get 5000 zenni from that kill."
						usr.maxpowerlevel += (rand(900,1000))
						usr.maxpowerdam += rand(50,780)
						src.loc=locate(0,0,0)
						if(usr.maxpowerlevel >= 95000)
							switch(input("You are worthy of my attack. Do you wish to learn 'Big Bang Attack'?", "Vegeta", text) in list ("Yes","No"))
								if("Yes")
									usr.contents += new /obj/BigBang
									alert("You learn Big Bang attack!")
									usr.kame = 0
						del(src)
						sleep(2000)
						new /mob/monsters/Vegeta(locate(93,103,5))
					if(src.race == "SSJVegeta (NPC)")
						usr.XP += rand(35,80)
						usr.zenni += 6000
						usr << "<b>You get 6000 zenni from that kill."
						usr.maxpowerlevel += (rand(2000,2200))
						usr.maxpowerdam += rand(150,1780)
						src.loc=locate(0,0,0)
						if(usr.maxpowerlevel >= 95000)
							switch(input("You are worthy of my attack. Do you wish to learn 'Big Bang Attack'?", "Vegeta", text) in list ("Yes","No"))
								if("Yes")
									usr.contents += new /obj/BigBang
									alert("You learn Big Bang attack!")
									usr.kame = 0
						del(src)
						sleep(2000)
						new /mob/monsters/SSJVegeta(locate(100,100,5))
					else
						if(src.race == "Android")
							src.loc=locate(0,0,0)
							src << "<b>You get blown to pieces, and you begin to get built by Dr. Gero!"
							sleep(50)
							src.loc=locate(82,7,1)
							src.powerdam = src.maxpowerdam
							src.powerlevel = src.maxpowerlevel
							if(src.arena == 1)
								world <<"[src] lost the arena fight to [usr]!"
								usr.loc=locate(46,16,2)
								usr<<"Congratulations!"
								usr.arena = 0
								src.arena = 0
						else
							if(src.arena == 1)
								world <<"[src] lost the arena fight to [usr]!"
								usr.loc=locate(46,16,2)
								usr<<"Congratulations!"
								usr.arena = 0
								src.arena = 0
							if(src.dead == 1)
								src << "You have died again!"
								src.icon_state = ""
								src.spar = 0
								src.dead = 1
								src.safe = 1
								src.ko = 0
								src.loc=locate(38,36,4)
								src.powerdam = src.maxpowerdam
								src.grav = 0
								src.density = 1
								src.powerlevel = src.maxpowerlevel

							if(src.dead == 0)
								if(src.name == usr.name)
									view(6) << "<font color = red><i>[src] dies right infront of you!"
									world << "<font color = red><b>Info: [src] has killed himself."
									usr<< 'tazlaugh.wav'
								else
									view(6) << "<font color = red><i>[src] dies right infront of you!"
									world << "<font color = red><b>Info: [src] has been killed by [usr]."

								src.loc=locate(38,36,4)
								src.powerlevel = src.maxpowerlevel
								src.icon_state = ""
								src.spar = 0
								src.safe = 1
								src.dead = 1
								src.overlays += 'halo.dmi'
								src.grav = 0
								src.density = 1
								src.ko = 0
								for(var/mob/characters/M in oview(6))
									if(usr.befriend == M.name)
										if(M.angered == 1)
											usr.powerlevel += 0
										if(M.angered == 0)
											view(10) << "<b><font color = blue>[M.name]: THATS ENOUGH!!!!!!!!!!!!"
											view(10) << "<i><b><font color = red>[M.name] explodes in anger as he sees his best friend die!"
											M.underlays += /obj/whiteaura
											M.powerlevel = (M.powerlevel * 4)
											M.purity += 5
											M.will += 5
											M.ragename = src.name
											M.angered= 1
											M.honor += 5
											M << "<font color = red><font size = 5>Hate <font color = blue>fills your soul as you see your best friend, [src.name], die infront of you."
											sleep(600)
											M.underlays -= /obj/whiteaura
											M.angered = 0
											if(M.powerlevel <= M.maxpowerlevel)
												M.powerlevel += 0
											if(M.powerlevel > M.maxpowerlevel)
												M.powerlevel = M.maxpowerlevel
									else
										if(usr.angered == 1)
											usr.powerlevel += 0
										if(usr.angered == 0)
											view(6) << "<b><font color = blue>[M.name]: aaaAAAHHHHH!!!!!!!!!!"
											view(6) << "<i><b><font color = red>[M.name] explodes in anger as a huge aura surrounds him!"
											M.underlays += /obj/whiteaura
											M.powerlevel = (M.powerlevel * 2)
											M.purity += 1
											M.angered = 1
											M.ragename = src.name
											M.will += 1
											M.honor += 1
											sleep(100)
											M.underlays -= /obj/whiteaura
											M.angered = 0
											if(M.powerlevel <= M.maxpowerlevel)
												M.powerlevel += 0
											if(M.powerlevel > M.maxpowerlevel)
												M.powerlevel = M.maxpowerlevel
							else
								usr.powerlevel += 0

		KO()
			if(src.powerlevel <= 0)
				view(6) << "<b>[src] is knocked out!!</b>"
				src.ko = 1
				src.move = 0
				src.grav = 0
				sleep(100)
				src.ko = 0
				src.move = 1
				src.powerlevel = 5
				src.random = rand(1,3)
				if(src.random == 3)
					src.maxpowerlevel += rand(1,2)
				if(src.random == 2)
					src.maxpowerlevel += rand(0,1)
				if(src.random == 1)
					src.powerlevel += 0
			else
				src.powerlevel += 0

mob/monsters
	New()
		Chase()
	Bump(mob/M)
		if (istype(M,/mob/characters))//set this to your PLAYER TYPE
			Attack(M)

mob/monsters
	proc
		Wander(mob/monsters as mob, lag as num) // A quick Wander() proc I made for use with your NPCs.
			while(monsters) // While the NPC exists..
				sleep(lag)
				var/random_direction = pick(NORTH,SOUTH,EAST,WEST) // Pick a random direction
				step(monsters,random_direction) // And make it go that way.
		Chase(lag as num)
			var/mob/characters/P//Set this to your player TYPE
			while(src)
				if(P in oview(5))         //if a Player comes in 5 steps pf him
					step_towards(src,P)   //Chase him!
					sleep(lag)
					for(P in oview(1))
						break
					for(P in oview(2))
						break
					for(P in oview(3))
						break
					for(P in oview(4))
						break
				else
					step_rand(src)
					sleep(10)
					for(P in oview(5))
						break
				sleep(5)
			spawn(5)
				Chase()

mob/characters
	New()
		..()
		spawn(10)
			Powerdamup()

	LifeCycle()
		if (client || isDead())
			return

		var/action_taken

		for (var/mob/other_mob in oview(1, src))
			if (istype(other_mob, /mob/monsters) || other_mob.isDead())
				continue

			Attack(other_mob)
			action_taken = 1

		for (var/mob/other_mob in oview(3, src))
			if (istype(other_mob, /mob/monsters) || other_mob.isDead())
				continue
				step_towards(src, other_mob)
				action_taken = 1


		if (action_taken)
			spawn(lifecycle_delay)
				LifeCycle()
			return
		..()

mob/pets
	New()
		..()
		spawn(rand(10))
			PetLifeCycle()
		return

	PetLifeCycle()
		if (client || isDead())
			return

		var/action_taken

		for (var/mob/other_mob in oview(1, src))
			if (istype(other_mob, /mob/monsters) || other_mob.isDead())
				continue

		if (action_taken)
			spawn(lifecycle_delay)
				PetLifeCycle()
			return
		..()