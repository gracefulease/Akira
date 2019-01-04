
obj
	enrage
		verb
			Enrage()
				set category = "Fighting"
				if(usr.entime == 1)
					usr << "You are still too angry..."
				if(usr.entime == null||usr.entime == 0)
					usr << "<font face = Arial><font size = 2><font color = silver>You begin to get enraged....remembering all the hateful things in your past......"
					usr.powerlevel += 1
					usr.entime = 1
					usr.icon_state = "ssj"
					usr.powerlevel += (rand(1,(usr.maxpowerlevel)))
					sleep(40)
					usr.icon_state = ""
					sleep(rand(1,1200))
					usr.entime = 0
					usr << "You begin to calm..."


obj
	Tayioken
		verb
			Tayioken()
				set category = "Fighting"
				if(usr.tayio == 1)
					usr << "You need to wait..."
				if(usr.tayio == null||usr.tayio == 0)
					view(6) << "<b><font color = red>TAYIOKEN!!!"
					usr.tayio = 1
					for(var/mob/characters/M in oview(6))
						M << "<font color = green>You are blinded by [usr]'s Tayioken!"
						M:sight = 1
					sleep(rand(1,100))
					for(var/mob/M in world)
						M:sight = 0
					usr.tayio = 0
obj
	SuperTayioken
		verb
			Super_Tayioken()
				set category = "Fighting"
				if(usr.tayio == 1)
					usr << "You need to wait..."
				if(usr.tayio == null||usr.tayio == 0)
					view(6) << "<b><font color = red>SUPER!!!"
					sleep(7)
					view(6) << "<b><font color = red>TAYIOKEN!!!"
					usr.tayio = 1
					for(var/mob/characters/M in oview(12))
						M << "<font color = green>You are blinded by [usr]'s Tayioken!"
						M:sight = 1
					sleep(rand(1,100))
					for(var/mob/M in world)
						M:sight = 0
					for(var/mob/characters/M in oview(6))
						M:sight = 1
					sleep(rand(1,100))
					for(var/mob/M in world)
						M:sight = 0
					usr.tayio = 0

obj
	Shadow
		verb
			Shadow_Stalk()
				set category = "Fighting"
				if(shadow == 0||shadow == null)
					usr.shadow = 1
					view(6)<<"[usr] disappears!"
					flick('shadow.dmi',usr)
					sleep(5)
					usr.invisibility = 1
					sleep(rand(20,100))
					usr.shadow = 0
					view(6)<<"[usr] reappears!"
					usr.invisibility = 0
obj
	user
		icon = 'male.dmi'
obj
	telepath
		verb
			Telepath(mob/characters/M in oview(150), msg as text)
				set category = "Communication"
				usr << "<b>----><font color = blue>{{<font color = white>Telepathy<font color = blue>}}<font color = red>:<font color = white> [msg]"
				M << "<b><----<font color = blue>{{<font color = white>Telepathy<font color = blue>}}<font color = red>[usr]:<font color = white> [msg]"
obj
	senzubean
		name = "Senzu Bean"
		icon = 'weight-objs.dmi'
		icon_state = "senzu"
		verb
			Eat_Senzu_Bean()
				set category = "Inventory"
				usr << "You eat the senzu bean"
				sleep(10)
				usr << "You feel fully revived!!"
				usr.powerdam = usr.maxpowerdam
				usr.powerlevel = usr.maxpowerlevel
				usr.stamina = 100
				del(src)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
obj
	fusion
		name = "Poratta Earrings"
		icon = 'poratta.dmi'
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'poratta.dmi'
					usr << "You remove the [src.name]."
					usr.poratta = 0
				else
					src.worn = 1
					usr.overlays += 'poratta.dmi'
					usr << "You wear the [src.name]."
					usr.poratta = 1
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
			Fuse(mob/characters/M in oview(1))
				set category = "Fighting"
				if(M.race == usr.race)
					if(usr.poratta == 1)
						if(M.fuse == 0||M.fuse == null||usr.fuse ==0||usr.fuse == null)
							if(M.name == usr.name)
								usr.powerlevel += 0
							else
								switch(input("Do you want to fuse with [M]", "Fuse with [M]", text) in list ("Yes", "No"))
									if("Yes")
										switch(input(M,"[usr] wants to fuse with you, do you want to fuse with [src]?","Fuse with [src]", text) in list ("Yes", "No"))
											if("Yes")
												usr.move = 0
												M.move = 0
												view(5)<<"<font size = 5>{<IMG CLASS=icon SRC=\ref[usr.faceicon]>}<font size = 2> [usr]<font color=white> says: Uh-oh!"
												view(5)<<"<font size = 5>{<IMG CLASS=icon SRC=\ref[M.faceicon]>}<font size = 2> [M]<font color=white> says: Here we go..."
												view(5)<<"<font size = 5>{<IMG CLASS=icon SRC=\ref[usr.faceicon]>}<font size = 2> [usr]<font color=white> says: AAAAAAH"
												M.fuse = 1
												usr.fuse = 1
												M.maxpowerlevel += usr.maxpowerlevel
												usr.maxpowerlevel += M.maxpowerlevel
												usr.maxpowerdam += M.maxpowerdam
												M.maxpowerdam += usr.maxpowerdam
												M.fusepl = usr.maxpowerlevel
												M.fusepd = usr.maxpowerdam
												usr.fusepl = M.maxpowerlevel
												usr.fusepd = M.maxpowerdam
												flick("flash",M)
												flick("flash",usr)
												usr.overlays += 'hairstrip.dmi'
												M.overlays += 'hairstrip.dmi'
												usr.move = 1
												M.move = 1
												sleep(3000)
												usr << "You feel odd..."
												M << "You feel odd..."
												sleep(20)
												M.maxpowerlevel -= M.fusepl
												usr.maxpowerlevel -= usr.fusepl
												M.powerlevel -= M.fusepl
												usr.powerlevel -= usr.fusepl
												usr.maxpowerdam -= usr.fusepd / 1.11
												M.maxpowerdam -= M.fusepd / 1.11
												usr.overlays -= 'hairstrip.dmi'
												M.overlays -= 'hairstrip.dmi'
												usr.fuse = 0
												M.fuse = 0
												usr << "You have unfused!!!"
												M << "You have unfused!!!"
												M.Die()
												usr.Die()
											if("No")
												usr<< "You do not fuse with [M]"
									if("No")
										usr<< "You do not fuse with [M]"

						else
							usr<<"You are already fused!"
					else
						usr<<"You need to put on the earrings first!"
				else
					usr<<"They needs to be the same race as you!"
mob
	verb
		Plain_Arena_Challenge(mob/characters/M in world)
			set category = "Communication"
			usr<<"src = [src]"
			if(!src.arena && M.arena == 0)
				world<<"[usr] challenges [M] to a fight"
				switch(input(M,"[src] wants to fight you, do you wish to fight [src]?","Fight with [src]", text) in list ("Yes", "No"))
					if("Yes")
						world<<"[M] has agreed to fight [src]!"
						M.loc=locate(54,23,1)
						M.arena = 1
						usr.loc=locate(75,23,1)
						usr.arena = 1
					if("No")
						world<<"[M] has declined a fight with [src]!"
						M<<"Coward"
			else
				usr<<"You cannot fight them!"
mob
	verb
		Water_Arena_Challenge(mob/characters/M in world)
			set category = "Communication"
			if(src.npp == 0 && usr.safe == 0 && src.safe == 0 && usr.npp == 0 && src.arena == 0 && usr.arena == 0 && src.adminroom == 0 && usr.adminroom == 0)
				world<<"[usr] challenges [M] to a fight"
				switch(input(M,"[src] wants to fight you, do you wish to fight [src]?","Fight with [src]", text) in list ("Yes", "No"))
					if("Yes")
						world<<"[M] has agreed to fight [src]!"
						M.loc=locate(66,39,1)
						M.arena = 1
						usr.loc=locate(55,39,1)
						usr.arena = 1
					if("No")
						world<<"[M] has declined a fight with [src]!"
						M<<"Coward"
			else
				usr<<"You cannot fight them!"
mob
	verb
		Fire_Arena_Challenge(mob/characters/M in world)
			set category = "Communication"
			if(src.npp == 0 && usr.safe == 0 && src.safe == 0 && usr.npp == 0 && src.arena == 0 && usr.arena == 0 && src.adminroom == 0 && usr.adminroom == 0)
				world<<"[usr] challenges [M] to a fight"
				switch(input(M,"[src] wants to fight you, do you wish to fight [src]?","Fight with [src]", text) in list ("Yes", "No"))
					if("Yes")
						world<<"[M] has agreed to fight [src]!"
						M.loc=locate(87,58,1)
						M.arena = 1
						usr.loc=locate(122,59,1)
						usr.arena = 1
					if("No")
						world<<"[M] has declined a fight with [src]!"
						M<<"Coward"
			else
				usr<<"You cannot fight them!"
mob
	verb
		Grass_Arena_Challenge(mob/characters/M in world)
			set category = "Communication"
			if(src.npp == 0 && usr.safe == 0 && src.safe == 0 && usr.npp == 0 && src.arena == 0 && usr.arena == 0 && src.adminroom == 0 && usr.adminroom == 0)
				world<<"[usr] challenges [M] to a fight"
				switch(input(M,"[src] wants to fight you, do you wish to fight [src]?","Fight with [src]", text) in list ("Yes", "No"))
					if("Yes")
						world<<"[M] has agreed to fight [src]!"
						M.loc=locate(78,51,1)
						M.arena = 1
						usr.loc=locate(79,34,1)
						usr.arena = 1
					if("No")
						world<<"[M] has declined a fight with [src]!"
						M<<"Coward"
			else
				usr<<"You cannot fight them!"

mob
	flerp
		race = "Earth-sei-jin"
		name = "Freaky"
		maxpowerlevel = 75000
		icon = 'mobs.dmi'
		icon_state = "vegetto"

obj
	Sally
		icon = 'weight-objs.dmi'
		icon_state = "Sally"

obj
	oozaruleft
		icon='oozaru.dmi'
		icon_state = "2"
		layer = MOB_LAYER // defines the layer
		density = 1 //defines the dinsity
		New() //New() proc
			pixel_x = 31
			density =1
mob
	proc
		kaiokenstrain()
			if(usr.kaioken == 1)
				sleep(rand(10,20))
				usr.stamina -= (rand(5,15))
				if(usr.stamina <= 0)
					usr << "<b>You feel the strain of Kaioken."
					usr.stamina = 0
					usr.powerlevel = 1
					usr.underlays -= 'kaioaura.dmi'
					usr.kaioken = 0
					usr.KO()
				if(usr.stamina >= 1)
					usr.kaiokenstrain()



obj
	tail
		icon = 'tail.dmi'
		layer = MOB_LAYER + 5


obj
	flute
		icon = 'turfs.dmi'
		icon_state = "flute"
		name = "Tapion's Flute"
		verb
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				usr.tapion = 0
				Move(usr)
			Play()
				set category = "Inventory"
				if(usr.tapion == 1)
					usr << "<b>But you feel soothed already..."
				if(usr.tapion == 0)
					usr.icon_state = "play"
					usr.tapion = 1
					usr.underlays += /obj/whiteaura
					usr << 'tapion.mid'
					usr.move = 1
					for(var/mob/M in view(6))
						M << "<b><font color = silver><font size = 1>You feel a chill go down your spine as the calming melody of Tapion is played by [usr]."
						M << 'tapion.mid'
						M.powerlevel *= 1.1
						M.powerlevel = round(M.powerlevel)
						sleep(100)
						M << "<b>The melody drives into your heart. It fills your body with good."
						sleep(1020)
						M << "<b>As the melody stops, you feel your body reguivinate."
						M.powerlevel = M.maxpowerlevel
						M.stamina = 100
						M.icon_state = ""
						M.tapion = 0







obj
	tay
		icon = 'tayioken.bmp'
		layer = MOB_LAYER + 99999999999999999999999999999999

obj
	ray
		icon = 'ray.dmi'
		layer = MOB_LAYER + 99999999999999999999
area
	outside	// lay this area on the map anywhere you want it to change from night to day
		layer = 6
area
	lightning	// lay this area on the map anywhere you want it to change from night to day
		layer = 7
obj
	dball1
		icon = 'dballs.dmi'
		icon_state = "1"
		name = "Dragonball 1"
		verb
			Drop()
				set category = "Inventory"
				var/X = rand(1,150)
				var/Y = rand(1,150)
				src.loc=locate(X,Y,2)
				usr.dball1 = 0
				sleep(20)
			Get()
				set category = "Inventory"
				set src in oview(1)
				if(usr.dball1==null||usr.dball1 == 0)
					Move(usr)
					usr.dball1 = 1
				else
					usr<<"You already have this Dragonball!"
			Summon_Shenron()
				set category = "Inventory"
				if(usr.dball1 == 1 && usr.dball2 == 1 && usr.dball3 == 1 && usr.dball4 == 1 && usr.dball5 == 1 && usr.dball6 == 1 && usr.dball7 == 1)
					world << "<font size = 5><font color = red><B><I>The Mighty Shenron Has Been Summoned!!!</font></font></B></I>"
					view(12) << "[usr] has summoned Shenron!!!"
					usr << "THE MIGHTY SHENRON APPEARS BEFORE YOU!"
					var/area/outside/O=locate()
					if(!O) return
					O.overlays += icon('black.dmi',"1")
					var/area/lightning/A=locate()
					if(!A) return
					A.overlays += icon('black.dmi',"2")
					spawn(200) A.overlays -= icon('black.dmi',"2")
					spawn(200) O.overlays -= icon('black.dmi',"1")
					switch(input("You have awoken me from my slumber!!! What are your 3 wishes???","Shenron",text)in list("I wish for Strength!","I wish for Defense!","I wish for Soul!","I wish for Money!","I wish for Power!"))
						if("I wish for Strength!")
							usr.Str += 35
							usr<<"Your first wish has been granted!"
						if("I wish for Defense!")
							usr.Def += 35
							usr<<"Your first wish has been granted!"
						if("I wish for Soul!")
							usr.purity += 15
							usr.will += 15
							usr.honor += 15
							usr<<"Your first wish has been granted!"
						if("I wish for Money!")
							usr.zenni += 35000
							usr<<"Your first wish has been granted!"
						if("I wish for Power!")
							usr.maxpowerlevel += rand(50000,1000000)
							usr.maxpowerdam += rand(100000,2000000)
							usr<<"Your first wish has been granted!"
					switch(input("This is your second wish!!! What do you wish for???","Shenron",text)in list("I wish for Strength!","I wish for Defense!","I wish for Soul!","I wish for Money!","I wish for Power!"))
						if("I wish for Strength!")
							usr.Str += 35
							usr<<"Your first wish has been granted!"
						if("I wish for Defense!")
							usr.Def += 35
							usr<<"Your first wish has been granted!"
						if("I wish for Soul!")
							usr.purity += 15
							usr.will += 15
							usr.honor += 15
							usr<<"Your first wish has been granted!"
						if("I wish for Money!")
							usr.zenni += 35000
							usr<<"Your first wish has been granted!"
						if("I wish for Power!")
							usr.maxpowerlevel += rand(50000,1000000)
							usr.maxpowerdam += rand(100000,2000000)
							usr<<"Your second wish has been granted!"
					switch(input("This is your final wish!!! What do you wish for???","Shenron",text)in list("I wish for Strength!","I wish for Defense!","I wish for Soul!","I wish for Money!","I wish for Power!"))
						if("I wish for Strength!")
							usr.Str += 35
							usr<<"Your first wish has been granted!"
						if("I wish for Defense!")
							usr.Def += 35
							usr<<"Your first wish has been granted!"
						if("I wish for Soul!")
							usr.purity += 15
							usr.will += 15
							usr.honor += 15
							usr<<"Your first wish has been granted!"
						if("I wish for Money!")
							usr.zenni += 35000
							usr<<"Your first wish has been granted!"
						if("I wish for Power!")
							usr.maxpowerlevel += rand(50000,1000000)
							usr.maxpowerdam += rand(100000,2000000)
							usr<<"Your final wish has been granted!"
					usr<<"Now I must return to my slumber!"
					usr.dball1 = 0
					usr.dball2 = 0
					usr.dball3 = 0
					usr.dball4 = 0
					usr.dball5 = 0
					usr.dball6 = 0
					usr.dball7 = 0
					for(var/obj/dball1 in usr)
						del dball1
						var/Y = rand(1,150)
						var/X = rand(1,150)
						new dball1(locate(X,Y,2))
					for(var/obj/dball2 in usr)
						del dball2
						var/Y = rand(1,150)
						var/X = rand(1,150)
						new dball2(locate(X,Y,2))
					for(var/obj/dball3 in usr)
						del dball3
						var/Y = rand(1,150)
						var/X = rand(1,150)
						new dball3(locate(X,Y,2))
					for(var/obj/dball4 in usr)
						del dball4
						var/Y = rand(1,150)
						var/X = rand(1,150)
						new dball4(locate(X,Y,2))
					for(var/obj/dball5 in usr)
						del dball5
						var/Y = rand(1,150)
						var/X = rand(1,150)
						new dball5(locate(X,Y,2))
					for(var/obj/dball6 in usr)
						del dball6
						var/Y = rand(1,150)
						var/X = rand(1,150)
						new dball6(locate(X,Y,2))
					for(var/obj/dball7 in usr)
						del dball7
						var/Y = rand(1,150)
						var/X = rand(1,150)
						new dball7(locate(X,Y,2))
obj
	dball2
		icon = 'dballs.dmi'
		icon_state = "2"
		name = "Dragonball 2"
		verb
			Drop()
				set category = "Inventory"
				var/X = rand(1,150)
				var/Y = rand(1,150)
				src.loc=locate(X,Y,2)
				usr.dball2 = 0
				sleep(20)
			Get()
				set category = "Inventory"
				set src in oview(1)
				if(usr.dball2==null||usr.dball2 == 0)
					Move(usr)
					usr.dball2 = 1
				else
					usr<<"You already have this Dragonball!"
obj
	dball3
		icon = 'dballs.dmi'
		icon_state = "3"
		name = "Dragonball 3"
		verb
			Drop()
				set category = "Inventory"
				var/X = rand(1,150)
				var/Y = rand(1,150)
				src.loc=locate(X,Y,2)
				usr.dball3 = 0
				sleep(20)
			Get()
				set category = "Inventory"
				set src in oview(1)
				if(usr.dball3==null||usr.dball3 == 0)
					Move(usr)
					usr.dball3 = 1
				else
					usr<<"You already have this Dragonball!"
obj
	dball4
		icon = 'dballs.dmi'
		icon_state = "4"
		name = "Dragonball 4"
		verb
			Drop()
				set category = "Inventory"
				var/X = rand(1,150)
				var/Y = rand(1,150)
				src.loc=locate(X,Y,2)
				usr.dball4 = 0
				sleep(20)
			Get()
				set category = "Inventory"
				set src in oview(1)
				if(usr.dball4==null||usr.dball4 == 0)
					Move(usr)
					usr.dball4 = 1
				else
					usr<<"You already have this Dragonball!"
obj
	dball5
		icon = 'dballs.dmi'
		icon_state = "5"
		name = "Dragonball 5"
		verb
			Drop()
				set category = "Inventory"
				var/X = rand(1,150)
				var/Y = rand(1,150)
				src.loc=locate(X,Y,2)
				usr.dball5 = 0
				sleep(20)
			Get()
				set category = "Inventory"
				set src in oview(1)
				if(usr.dball5==null||usr.dball5 == 0)
					Move(usr)
					usr.dball5 = 1
				else
					usr<<"You already have this Dragonball!"
obj
	dball6
		icon = 'dballs.dmi'
		icon_state = "6"
		name = "Dragonball 6"
		verb
			Drop()
				set category = "Inventory"
				var/X = rand(1,150)
				var/Y = rand(1,150)
				src.loc=locate(X,Y,2)
				usr.dball6 = 0
				sleep(20)
			Get()
				set category = "Inventory"
				set src in oview(1)
				if(usr.dball6==null||usr.dball6 == 0)
					Move(usr)
					usr.dball6 = 1
				else
					usr<<"You already have this Dragonball!"
obj
	dball7
		icon = 'dballs.dmi'
		icon_state = "7"
		name = "Dragonball 7"
		verb
			Drop()
				set category = "Inventory"
				var/X = rand(1,150)
				var/Y = rand(1,150)
				src.loc=locate(X,Y,2)
				usr.dball7 = 0
				sleep(20)
			Get()
				set category = "Inventory"
				set src in oview(1)
				if(usr.dball7==null||usr.dball7 == 0)
					Move(usr)
					usr.dball7 = 1
				else
					usr<<"You already have this Dragonball!"
obj
	wover
		icon = 'turfs.dmi'
		icon_state = "wover"
		density = 0
		layer = MOB_LAYER + 99999
obj
	ki
		icon = 'skills.dmi'
		icon_state = "ki"
		layer = MOB_LAYER + 99
obj
	WeightTraining100
		icon = 'weight-objs.dmi'
		icon_state = "w100"
		lift = 0
		layer = MOB_LAYER + 99
		verb
			Lift()
				set category = "Emotions and Training"
				set src in oview(0)
				if(src.lift == 0)
					if(usr.stamina >= 5)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar100"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 1
								usr.maxpowerdam += 2
							else
								usr.maxpowerlevel += 0
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 1
								usr.maxpowerdam += 2
							else
								usr.maxpowerlevel += 0
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 1
								usr.maxpowerdam += 2
							else
								usr.maxpowerlevel += 0
							src.lift = 0
							usr.move = 1
							src.icon_state = "w100"
							usr.icon_state = ""
							usr.XP += rand(2,4)
							usr.LearnAll()
					if(usr.stamina <= 4)
						usr << "You feel to weak too."
				else
					usr << "Its being lifted already."



obj
	MeditationPad
		icon = 'turfs.dmi'
		icon_state = "whitefloor"
		verb
			Meditate()
				set category = "Emotions and Training"
				set src in oview(1)
				if(usr.meditate == 1)
					usr << "You are currently meditating."
				else
					if(usr.flight == 1)
						usr << "Not while flying."
					if(usr.flight == 0)
						usr.meditate = 1
						usr.icon_state = "meditate"
						usr.move = 0
						sleep(50)
						usr.random = rand(1,4)
						if(usr.random == 1)
							usr << "You have not gained any knowledge from that."
							usr.move = 1
							usr.icon_state = ""
							usr.meditate = 0
							usr.XP += 1
						if(usr.random == 4)
							usr << "You have not gained any knowledge from that."
							usr.move = 1
							usr.icon_state = ""
							usr.meditate = 0
							usr.XP += 1
						if(usr.random == 2)
							usr << "You feel a bit wiser."
							usr.move = 1
							usr.icon_state = ""
							usr.maxpowerlevel += rand(21,33)
							usr.maxpowerdam += rand(15,22)
							usr.meditate = 0
							usr.XP += 2
						if(usr.random == 3)
							usr << "You have gained superior knowledge."
							usr.move = 1
							usr.icon_state = ""
							usr.maxpowerlevel += rand(32,45)
							usr.maxpowerdam += rand(25,50)
							usr.meditate = 0
							usr.XP += 3
						usr.stamina += 5
						usr.LearnAll()
						if(usr.stamina >= usr.maxstamina)
							usr.stamina = 100
						usr.random = rand(1,30)
						if(usr.random == 30)
							usr << "<b><font size = 4>You feel more purified."
							usr.purity += 1
							usr.random = rand(1,29)
						if(usr.random == 29)
							usr << "<b><font size = 4>You feel more honor enter your blood."
							usr.honor += 1
							usr.random = rand(1,28)
						if(usr.random == 28)
							usr << "<b><font size = 4>You get more will to fight."
							usr.will += 1
						else
							usr.powerlevel += 0
obj
	Racer
		icon = 'weight-objs.dmi'
		icon_state = "racer"
		density = 1
		verb
			Race()
				set category = "Race"
				set src in oview(1)
				usr.move = 0
				usr<<"On your marks..."
				sleep(8)
				usr<<"Get set..."
				sleep(8)
				usr<<"GO!!!"
				usr.move = 1
				usr.racing = 1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
				if(usr.racing == 1)
					sleep(10)
					usr.time +=1
					usr<<"Time UP!!!"
					usr.racing = 0
					usr.time = 0

obj
	RacerEnd
		icon = 'weight-objs.dmi'
		icon_state = "racer2"
		density = 0
		verb
			Finish_Race()
				set category = "Race"
				set src in oview(0)
				if(usr.racing == 1)
					usr.racing = 0
					usr << "Well Done!"
					usr.maxpowerlevel += round((100 / usr.time) * 100)
					usr.maxpowerdam += round((950 / usr.time) * 110)
					usr.time = 0
				else
					usr<<"You are not racing!"

obj
	SpeedBag
		icon = 'weight-objs.dmi'
		icon_state = "speed"
		density = 1
		verb
			HitPunchingBagLikeAMuthaFeckaYeahPeepah()
				set name = "Speed Bag"
				set category = "Emotions and Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if(usr.flight == 0)
					if(usr.dir == 4)
						flick("speedhit",src)
						flick("weight-training-right", usr)
						usr.move = 1
						usr.icon_state = ""
						usr.maxpowerlevel += rand(1,4)
						usr.maxpowerdam += rand(0,6)
						usr.meditate = 0
						usr.XP += rand(1,4)
						usr.LearnAll()
						usr.XP()
					else
						usr << "You must face the speed bag."

obj
	SpeedBag2
		icon = 'weight-objs.dmi'
		icon_state = "speed1"
		density = 1
		verb
			HitPunchingBagLikeAMuthaFeckaYeahPeepah()
				set name = "Speed Bag"
				set category = "Emotions and Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if(usr.flight == 0)
					if(usr.dir == 4)
						flick("speedhit1",src)
						flick("weight-training-right", usr)
						usr.move = 1
						usr.icon_state = ""
						usr.maxpowerlevel += rand(4,8)
						usr.maxpowerdam += rand(2,14)
						usr.meditate = 0
						usr.XP += rand(4,8)
						usr.LearnAll()
						usr.XP()
					else
						usr << "You must face the speed bag."
obj
	SpeedBag3
		icon = 'weight-objs.dmi'
		icon_state = "speed2"
		density = 1
		verb
			HitPunchingBagLikeAMuthaFeckaYeahPeepah()
				set name = "Speed Bag"
				set category = "Emotions and Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if(usr.flight == 0)
					if(usr.dir == 4)
						flick("speedhit2",src)
						flick("weight-training-right", usr)
						usr.move = 1
						usr.icon_state = ""
						usr.maxpowerlevel += rand(6,12)
						usr.maxpowerdam += rand(4,15)
						usr.meditate = 0
						usr.XP += rand(3,6)
						usr.LearnAll()
						usr.XP()
					else
						usr << "You must face the speed bag."
obj
	SpeedBag4
		icon = 'weight-objs.dmi'
		icon_state = "speed3"
		density = 1
		verb
			HitPunchingBagLikeAMuthaFeckaYeahPeepah()
				set name = "Speed Bag"
				set category = "Emotions and Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if(usr.flight == 0)
					if(usr.dir == 4)
						flick("speedhit3",src)
						flick("weight-training-right", usr)
						usr.move = 1
						usr.icon_state = ""
						usr.maxpowerlevel += rand(1,50)
						usr.maxpowerdam += rand(0,60)
						usr.meditate = 0
						usr.XP += rand(4,8)
						usr.LearnAll()
						usr.XP()
					else
						usr << "You must face the speed bag."
obj
	SpeedBag5
		icon = 'weight-objs.dmi'
		icon_state = "speed4"
		density = 1
		verb
			HitPunchingBagLikeAMuthaFeckaYeahPeepah()
				set name = "Speed Bag"
				set category = "Emotions and Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if(usr.flight == 0)
					if(usr.dir == 4)
						flick("speedhit4",src)
						flick("weight-training-right", usr)
						usr.move = 1
						usr.icon_state = ""
						usr.maxpowerlevel += rand(20,80)
						usr.maxpowerdam += rand(0,100)
						usr.meditate = 0
						usr.XP += rand(4,8)
						usr.LearnAll()
						usr.XP()
					else
						usr << "You must face the speed bag."

obj
	Machine
		icon = 'turfs.dmi'
		icon_state = "mach"
		density = 1
		verb
			HitPunchingBagLikeAMuthaFeckaYeahPeepah()
				set name = "Punching Contest"
				set category = "Emotions and Training"
				set src in oview(1)
				set desc = "Win Zenni!"
				if(usr.flight == 1)
					usr << "Not while flying."
				if(usr.flight == 0)
					if(usr.dir == 8)
						if(usr.move == 0)
							usr << "Not now."
						if(usr.move == 1)
							view(6) << "<b>[usr] pulls his arm back..."
							usr.move = 0
							sleep(rand(1,60))
							flick("machhit",src)
							flick("weight-training-right", usr)
							if(usr.move == 0)
								usr.move = 1
								usr.icon_state = ""
								usr.maxpowerlevel += rand(1,4)
								usr.maxpowerdam += rand(0,6)
								usr.XP+= rand(1,8)
								var/damage = (usr.Str / (rand(1,8)))
								damage = round(damage)
								damage += (rand(0,15))
								view(6) << "<font color = blue><i>[usr] hits the machine, doing about [damage] damage to it."
								usr.random = rand(1,4)
								if(usr.random == 1)
									usr.zenni += rand(25,45)
									usr<<"You got zenni from that hit!"
								if(usr.random == 2)
									usr.zenni += rand(1,250)
									usr<<"You got zenni from that hit!"
								if(usr.random == 3)
									usr.zenni += rand(45,70)
									usr<<"You got zenni from that hit!"
								if(usr.random == 4)
									usr<<"You got no zenni from that hit!"
								usr.meditate = 0
								usr.LearnAll()
								usr.XP()
							else
								view(6) << "<font color = blue><i>[usr] his the machine, doing [usr.powerlevel / (rand(2,8))] damage to the machine!"
								usr.maxpowerlevel += 0
								usr.move = 1
								usr.icon_state = ""
								usr.meditate = 0

obj
	machwreck
		icon = 'turfs.dmi'
		icon_state = "machdead"
obj
	DragonballStatue
		icon = 'weight-objs.dmi'
		icon_state = "magicball"
		density = 1

obj
	whiteaura
		icon = 'auras.dmi'
		icon_state = "whiteaura"

obj
	kaioaura
		icon = 'auras.dmi'
		icon_state = "kaioaura"

obj
	spar
		verb
			Punch(mob/characters/M in oview(1))
				set src in oview(1)
				set category = "Fighting"
				if(usr.flight == 1)
					usr << "Not while flying!"
				if(usr.flight == 0)
					if(usr.spar == 0)
						usr << "You need to be sparring!"
					if(usr.spar == 1)
						if(usr.ko == 1)
							usr << "You are knocked out at the moment..."
						if(usr.ko == 0)
							if(usr.blocking == 1)
								usr << "Not while blocking!"
							if(usr.blocking == 0)
								if(M.spar == 0)
									usr << "He's not ready to spar."
								if(M.spar == 1)
									if(M.ko == 1)
										usr << "You can't hit a man when he's down..."
									if(M.ko == 0)
										if(M.blocking == 1)
											usr.random = rand(1,3)
											if(usr.random == 3)
												view(6) << "<font color = blue><i>[usr] breaks [M]'s block and punches him!"
												M.powerlevel -= (usr.maxpowerlevel / rand(8,25))
												M.powerlevel = round(M.powerlevel)
												M.blocking = 0
												flick("sparhit", M)
												flick("sparpunch", usr)
												M.icon_state = "sparstand"
												usr.icon_state = "sparstand"
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)

											else
												view(6) << "<font color = blue><i>[M] blocks [usr]'s attack!"
										if(M.blocking == 0)
											usr.random = rand(1,5)
											if(usr.random == 5)
												usr << "<font color = blue><i>[usr] stumbles and misses!"
											if(usr.random == 4)
												usr << "<font color = blue><i>[usr] smashes [M] right in the face!"
												M.powerlevel -= (usr.powerlevel / rand(15,25))
												M.powerlevel = round(M.powerlevel)
												flick("sparhit", M)
												flick("sparpunch", usr)
												M.icon_state = "sparstand"
												usr.icon_state = "sparstand"
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
											if(usr.random == 3)
												usr << "<font color = blue><i>[M] counters [usr]'s attack and punches him in the face!"
												usr.powerlevel -= (M.maxpowerlevel / rand(15,25))
												usr.powerlevel = round(usr.powerlevel)
												flick("sparhit", usr)
												flick("sparpunch", M)
												M.icon_state = "sparstand"
												usr.icon_state = "sparstand"
												usr.KO()
											if(usr.random == 2)
												usr << "<font color = blue><i>[usr] punches [M] in the shoulder!"
												usr.powerlevel -= (M.maxpowerlevel / rand(15,25))
												usr.powerlevel = round(usr.powerlevel)
												flick("sparhit", usr)
												flick("sparpunch", M)
												M.icon_state = "sparstand"
												usr.icon_state = "sparstand"
												usr.KO()
											else
												usr << "<font color = blue><i>[usr] punches [M] in the stomach."
												M.powerlevel -= (usr.powerlevel / rand(15,20))
												M.powerlevel = round(M.powerlevel)

												flick("sparhit", M)
												flick("sparpunch", usr)
												M.icon_state = "sparstand"
												usr.icon_state = "sparstand"
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)











//kick///


obj
	spar
		verb
			Kick(mob/characters/M in oview(1))
				set src in oview(1)
				set category = "Fighting"
				if(usr.flight == 1)
					usr << "Not while flying!"
				if(usr.flight == 0)
					if(usr.spar == 0)
						usr << "You need to be sparring!"
					if(usr.spar == 1)
						if(usr.ko == 1)
							usr << "You are knocked out at the moment..."
						if(usr.ko == 0)
							if(usr.blocking == 1)
								usr << "Not while blocking!"
							if(usr.blocking == 0)
								if(M.spar == 0)
									usr << "He's not ready to spar."
								if(M.spar == 1)
									if(M.ko == 1)
										usr << "You can't kick a man when he's down..."
									if(M.ko == 0)
										if(M.blocking == 1)
											usr.random = rand(1,3)
											if(usr.random == 3)
												view(6) << "<font color = blue><i>[usr] breaks [M]'s block and kicks him!"
												M.powerlevel -= (usr.maxpowerlevel / rand(15,20))
												M.powerlevel = round(M.powerlevel)
												M.blocking = 0
												flick("sparhit", M)
												flick("sparkick", usr)
												M.icon_state = "sparstand"
												usr.icon_state = "sparstand"
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)

											else
												view(6) << "<font color = blue><i>[M] blocks [usr]'s kick!"
										if(M.blocking == 0)
											usr.random = rand(1,5)
											if(usr.random == 5)
												usr << "<font color = blue><i>[usr] stumbles and misses!"
											if(usr.random == 4)
												usr << "<font color = blue><i>[usr] kick [M] right in the face!"
												M.powerlevel -= (usr.powerlevel / rand(15,30))
												M.powerlevel = round(M.powerlevel)
												flick("sparhit", M)
												flick("sparkick", usr)
												M.icon_state = "sparstand"
												usr.icon_state = "sparstand"
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
											if(usr.random == 3)
												usr << "<font color = blue><i>[M] counters [usr]'s attack and kicks him in the groin!"
												usr.powerlevel -= (M.maxpowerlevel / rand(15,25))
												usr.powerlevel = round(usr.powerlevel)
												flick("sparhit", usr)
												flick("sparkick", M)
												M.icon_state = "sparstand"
												usr.icon_state = "sparstand"
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
											if(usr.random == 2)
												usr << "<font color = blue><i>[usr] kick [M] in the shoulder!"
												usr.powerlevel -= (M.maxpowerlevel / rand(15,25))
												usr.powerlevel = round(usr.powerlevel)
												flick("sparhit", usr)
												flick("sparkick", M)
												M.icon_state = "sparstand"
												usr.icon_state = "sparstand"
												usr.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
											else
												usr << "<font color = blue><i>[usr] kick [M] in the stomach."
												M.powerlevel -= (usr.powerlevel / rand(15,20))
												M.powerlevel = round(M.powerlevel)

												flick("sparhit", M)
												flick("sparkick", usr)
												M.icon_state = "sparstand"
												usr.icon_state = "sparstand"
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)





			Block()
				set src in oview(1)
				set category = "Fighting"
				if(usr.flight == 1)
					usr << "Not while flying."
				if(usr.flight == 0)
					if(usr.spar == 0)
						usr << "You need to be in sparring first."
					if(usr.spar == 1)
						if(usr.blocking == 1)
							usr << "You relieve your blocking."
							view(6) << "<font color = blue><i>[usr] relieves from his blocking."
							usr.blocking = 0
							usr.move = 1
							usr.icon_state = "sparstand"
							usr.style = 'style-calming.dmi'
							usr.stylename = "Calming"
						else
							usr << "You put your guards up."
							view(6) << "<font color = blue><i>[usr] puts his guards up."
							usr.blocking = 1
							usr.move = 0
							usr.icon_state = "sparblock"
							usr.style = 'style-blocking.dmi'
							usr.stylename = "Blocking"

			Spar()
				set src in oview(1)
				set category = "Fighting"
				if(usr.flight == 1)
					usr << "Not while flying."
				if(usr.flight == 0)
					if(usr.spar == 1)
						view(6) << "<font color = blue><i>[usr] is done sparring."
						usr.spar = 0
						usr.icon_state = ""

					else
						view(6) << "<font color = blue><i>[usr] begins sparring."
						usr.spar = 1
						usr.icon_state = "sparstand"


			Kiblast(mob/characters/M in oview(1))
				set src in oview(1)
				set category = "Fighting"
				set name = "Ki Blast"
				if(usr.kiin == 1)
					usr << "You are ki-blasting right now!"
				if(usr.kiin == 0)
					if(usr.flight == 1)
						usr << "Not while flying!"
					if(usr.flight == 0)
						if(usr.spar == 0)
							usr << "You need to be sparring!"
						if(usr.spar == 1)
							if(usr.ko == 1)
								usr << "You are knocked out at the moment..."
							if(usr.ko == 0)
								if(usr.blocking == 1)
									usr << "Not while blocking!"
								if(usr.blocking == 0)
									if(M.spar == 0)
										usr << "He's not ready to spar."
									if(M.spar == 1)
										if(M.ko == 1)
											usr << "You can't kick a man when he's down..."
										if(M.ko == 0)
											if(M.blocking == 1)
												usr.powerlevel -= 100
												usr.kiin = 1
												if(usr.powerlevel <= 0)
													usr.KO()
													usr << "You have been knocked out from a lack of energy."
												if(usr.powerlevel >= 1)
													usr.icon_state = "sparback"

													usr.overlays += /obj/ki
													M.kiloc = M.loc
													sleep(15)
													usr.icon_state = ""
													usr.overlays -= /obj/ki
													usr.random = rand(1,2)
													if(usr.random == 1)
														if(M.loc == M.kiloc)
															s_missile(/obj/ki, usr, M)
															view(6) << "<font color = blue><i>[M] deflects [usr]'s blast!!"
															sleep(5)
															s_missile(/obj/ki, usr, M)

														else
															view(6) << "<font color = blue><i>[M] had stepped out of the way, causing the ki blast to go by him!"
															s_missile(/obj/ki, usr, M)

													if(usr.random == 2)
														if(M.loc == M.kiloc)
															s_missile(/obj/ki, usr, M)
															view(6) << "<font color = blue><i>[M] deflects [usr]'s blast!!"
															sleep(5)
															s_missile(/obj/ki, usr, M)

														else
															view(6) << "<font color = blue><i>[M] gets hit by the ki-blast as his blocking is dispatched!!"
															s_missile(/obj/ki, usr, M)
															M.overlays += /obj/kihit
															sleep(5)
															M.overlays -= /obj/kihit
															M.powerlevel -= 200
															M.KO()

															usr.maxpowerlevel += rand(1,15)
											if(M.blocking == 0)
												usr.icon_state = "sparback"
												usr.loc=locate(usr.x+1,usr.y,usr.z)
												usr.overlays += /obj/ki
												M.kiloc = M.loc
												sleep(15)
												usr.icon_state = ""
												usr.overlays -= /obj/ki
												usr.random = rand(1,2)
												if(M.loc == M.kiloc)
													view(6) << "<font color = blue><i>[M] gets hit by the ki-blast of [usr]!!"
													s_missile(/obj/ki, usr, M)
													M.overlays += /obj/kihit
													sleep(5)
													M.overlays -= /obj/kihit
													M.powerlevel -= 200
													usr.maxpowerlevel += rand(1,15)
													M.KO()
												else
													view(6) << "<font color = blue><i>[M] had stepped out of the way, causing the ki blast to go by him!"
													s_missile(/obj/ki, usr, M)

					usr.kiin = 0

mob/var/list/overlaysave
mob/var/list/underlaysave

obj
	SpaceCraft
		name = "Space Craft"
		icon = 'weight-objs.dmi'
		icon_state = "SpaceCraft"
		verb
			Drop()
				set category = "Inventory"
				src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
			Travel()
				set category = "Inventory"
				switch(input("Where would you like to travel to?", "Planets", text) in list ("Earth","Namek","Tium"))
					if("Tium")
						if(usr.z == 2)
							usr.loc = locate(27,19,1)
							usr<<"Estimated time until Planet Tium : 3 minutes!"
							sleep(600)
							usr<<"Estimated time until Planet Tium : 2 minutes!"
							sleep(600)
							usr<<"Estimated time until Planet Tium : 1 minutes!"
							sleep(600)
							usr<<"We are arriving at Planet Tium!!! We hope you enjoyed your flight!!!"
							usr.loc = locate(55,15,6)
						if(usr.z == 6)
							usr<<"You are already on Planet Tium!"
						if(usr.z == 5)
							usr.loc = locate(27,19,1)
							usr<<"Estimated time until Planet Tium : 2.5 minutes!"
							sleep(300)
							usr<<"Estimated time until Planet Tium : 2 minutes!"
							sleep(600)
							usr<<"Estimated time until Planet Tium : 1 minutes!"
							sleep(600)
							usr<<"We are arriving at Planet Tium!!! We hope you enjoyed your flight!!!"
							usr.loc = locate(55,15,6)
					if("Earth")
						if(usr.z == 2)
							usr<<"You are already on Planet Earth"
						if(usr.z == 5)
							usr.loc = locate(27,19,1)
							usr<<"Estimated time until Planet Earth : 1.5 minutes!"
							sleep(300)
							usr<<"Estimated time until Planet Earth : 1 minutes!"
							sleep(300)
							usr<<"Estimated time until Planet Earth : 0.5 minutes!"
							sleep(300)
							usr<<"We are arriving at Planet Earth!!! We hope you enjoyed your flight!!!"
							usr.loc = locate(115,60,2)
						if(usr.z==6)
							usr.loc = locate(27,19,1)
							usr<<"Estimated time until Planet Earth : 3 minutes!"
							sleep(600)
							usr<<"Estimated time until Planet Earth : 2 minutes!"
							sleep(600)
							usr<<"Estimated time until Planet Earth : 1 minutes!"
							sleep(600)
							usr<<"We are arriving at Planet Earth!!! We hope you enjoyed your flight!!!"
							usr.loc = locate(115,60,2)
					if("Namek")
						if(usr.z == 5)
							usr<<"You are already on Planet Namek!"
						if(usr.z == 6)
							usr.loc = locate(27,19,1)
							usr<<"Estimated time until Planet Namek : 1.5 minutes!"
							sleep(300)
							usr<<"Estimated time until Planet Namek : 1 minutes!"
							sleep(300)
							usr<<"Estimated time until Planet Namek : 0.5 minutes!"
							sleep(300)
							usr<<"We are arriving at Planet Namek!!! We hope you enjoyed your flight!!!"
							usr.loc = locate(25,50,5)
						if(usr.z == 2)
							usr.loc = locate(27,19,1)
							usr<<"Estimated time until Planet Namek : 2.5 minutes!"
							sleep(300)
							usr<<"Estimated time until Planet Namek : 2 minutes!"
							sleep(600)
							usr<<"Estimated time until Planet Namek : 1 minutes!"
							sleep(600)
							usr<<"We are arriving at Planet Namek!!! We hope you enjoyed your flight!!!"
							usr.loc = locate(25,50,5)


obj
	halofront
		icon = 'skills.dmi'
		icon_state = "halofront"
		layer = MOB_LAYER + 50
	haloback
		icon = 'skills.dmi'
		icon_state = "haloback"


	blueunderdmi
		icon = 'clothes-blueunder.dmi'
		layer = MOB_LAYER + 9

	NeoVest
		name = "Neo Vest"
		icon = 'NeoVest.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'NeoVest.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'NeoVest.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	kaioclothe
		name = "Shin Clothing"
		icon = 'kabito_clothes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'kabito_clothes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'kabito_clothes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	blueunder
		name = "Blue Underclothing"
		icon = 'clothes-blueunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'clothes-blueunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'clothes-blueunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	blackunder
		name = "Black Underclothing"
		icon = 'clothes-blackunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'clothes-blackunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'clothes-blackunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	blackgidmi
		icon = 'clothes-blackgi.dmi'
		layer = MOB_LAYER + 11

	blackgi
		name = "Black Gi"
		icon = 'clothes-blackgi.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'clothes-blackgi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'clothes-blackgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	namekgi
		name = "Namekian Gi"
		icon = 'namekgi.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'namekgi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'namekgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	turben
		name = "Turben"
		icon = 'turben.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'turben.dmi'
					usr << "You remove the [src.name]."


				else
					src.worn = 1
					usr.overlays += 'turben.dmi'
					usr << "You wear the [src.name]."

			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	bandana
		name = "Bandana"
		icon = 'bandana.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'bandana.dmi'
					usr << "You remove the [src.name]."


				else
					src.worn = 1
					usr.overlays += 'bandana.dmi'
					usr << "You wear the [src.name]."

			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	cape
		name = "White Cape"
		icon = 'cape.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'cape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'cape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	neocloak
		name = "Neo Cloak"
		icon = 'neo-cloak-under.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'neo-cloak.dmi'
					usr.overlays -= 'neo-gi.dmi'
					usr.underlays -= 'neo-cloak-under.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'neo-gi.dmi'
					usr.overlays += 'neo-cloak.dmi'
					usr.underlays += 'neo-cloak-under.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	orangegi
		name = "Orange Gi"
		icon = 'clothes-orangegi.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'clothes-orangegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'clothes-orangegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	saiyanarmor
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	royalsaiyan
		name = "Royal Saiya-jin Armor"
		icon = 'saiyanarmor4.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor4.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor4.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	blackelite
		name = "Elite Saiya-jin Armor (Black)"
		icon = 'saiyanarmor5.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor5.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor5.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	blueelite
		name = "Elite Saiya-jin Armor (Blue)"
		icon = 'saiyanarmor3.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor3.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor3.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	custom_armor
		name = "Custom Armor"
		icon = 'saiyanarmor2.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor2.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor2.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)



	elitesaiyanarmor
		name = "Elite Saiya-jin Armor"
		icon = 'saiyanarmor2.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor2.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor2.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	bootglovedmi
		icon = 'gloves-boots.dmi'
		layer = MOB_LAYER + 11

	boxingglove
		name = "Boxing Gloves"
		icon = 'boxing.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'boxing.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'boxing.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)


	GogetaArmor
		name = "Gogeta's Vest"
		icon = 'GogetaVest.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'GogetaVest.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'GogetaVest.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	AkiraArmor
		name = "Akira's Armour"
		icon = 'AkiraArmour.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'AkiraArmour.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'AkiraArmour.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	AkiraPants
		name = "Akira's Trousers"
		icon = 'AkiraPants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'AkiraPants.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'AkiraPants.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	bootglove
		name = "White Boots and Gloves"
		icon = 'gloves-boots.dmi'
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'gloves-boots.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'gloves-boots.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
//Gravitron//
obj/GravitronIcon
	icon = 'turfs.dmi'
	icon_state = "gravity"
obj/Gravitron
	icon = 'turfs.dmi'
	icon_state = "gravity"
	density = 1
	verb
		Gravity()
			set category = "Emotions and Training"
			set src in oview(1)
			var/howmuch = input("How much gravity would you like? (Note, it is suggested to be at least 5000 powerlevel before gravity training.)") as num|null
			if(howmuch < 0)
				usr << "<b>Thats not possible."
			if(howmuch == 1||howmuch == 0)
				usr.grav = 0
				usr << "<b>You turn off the gravity...."
			if(howmuch > 1 && howmuch <= 500)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)
					usr.playergravity()
			if(howmuch > 500)
				usr << "<b>The gravitron cannot withstand more than 500x gravity."

obj/Gravitrontwo
	icon = 'turfs.dmi'
	icon_state = "gravity"
	density = 1
	verb
		Gravity()
			set category = "Emotions and Training"
			set src in oview(1)
			var/howmuch = input("How much gravity would you like? (Note, it is suggested to be atleast 1000 powerlevel before gravity training.)") as num|null
			if(howmuch < 0)
				usr << "<b>Thats not possible."
			if(howmuch == 1||howmuch == 0)
				usr.grav = 0
				usr << "<b>You turn off the gravity...."
			if(howmuch > 1 && howmuch <= 10000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)
					usr.playergravity()
			if(howmuch > 10000)
				usr << "<b>The gravitron cannot withstand more than 10000x gravity."

obj/Gravitronthree
	icon = 'turfs.dmi'
	icon_state = "gravity"
	density = 1
	verb
		Gravity()
			set category = "Emotions and Training"
			set src in oview(1)
			var/howmuch = input("How much gravity would you like? (Note, it is suggested to be atleast 1000 powerlevel before gravity training.)") as num|null
			if(howmuch < 0)
				usr << "<b>Thats not possible."
			if(howmuch == 1||howmuch == 0)
				usr.grav = 0
				usr << "<b>You turn off the gravity...."
			if(howmuch > 1 && howmuch <= 100000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)
					usr.playergravity()
			if(howmuch > 100000)
				usr << "<b>The gravitron cannot withstand more than 100000x gravity."


mob
	proc
		playergravity()
			if(usr.grav != 0)
				var/success = rand(1,6)
				if(success == 1 || success == 2)
					usr << "You feel the gravity pull down on you. You seem stronger."
					usr.powerlevel -= usr.grav * (rand(8,20))
					if(usr.powerlevel <= 0)
						usr.Die()
					if(usr.powerlevel >= 1)
						usr.maxpowerlevel += usr.grav / (rand(1,15))
						usr.maxpowerlevel = round(usr.maxpowerlevel)
					spawn(20)
						if(usr.grav == 0)
							usr.powerlevel += 0
						else
							usr.playergravity()
				if(success == 3 || success == 5)
					usr << "You feel yourself getting use to the gravity."
					usr.powerlevel -= usr.grav * (rand(10,37))
					if(usr.powerlevel <= 0)
						usr.Die()
					if(usr.powerlevel >= 1)
						usr.maxpowerlevel += usr.grav / (rand(1,20))
						usr.maxpowerlevel = round(usr.maxpowerlevel)
					spawn(20)
						if(usr.grav == 0)
							usr.powerlevel += 0
						else
							usr.playergravity()
				if(success == 4 || success == 6)
					usr << "You feel the full force of the gravity!!"
					usr.powerlevel -= usr.grav * (rand(14,45))
					if(usr.powerlevel <= 0)
						usr.Die()
					if(usr.powerlevel >= 1)
						usr.maxpowerlevel += usr.grav / (rand(1,10))
						usr.maxpowerlevel = round(usr.maxpowerlevel)
					spawn(20)
						if(usr.grav == 0)
							usr.powerlevel += 0
						else
							usr.playergravity()

				else
					return
				usr.maxpowerlevel += 1
			else
				return


obj
	green_scouter_left
		icon = 'green-scouter.dmi'
		icon_state = "left"
		layer = MOB_LAYER + 5
		name = "Class III Scouter"
		verb
			Wear_on_left()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= icon('green-scouter.dmi',"left")
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += icon('green-scouter.dmi',"left")
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 1000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 1000000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	custom_scouter_left
		icon = 'custom-scouter.dmi'
		icon_state = "left"
		layer = MOB_LAYER + 5
		name = "Custom Scouter"
		verb
			Wear_on_left()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= icon('custom-scouter.dmi',"left")
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays +=icon('custom-scouter.dmi',"left")
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 1000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 1000000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	red_scouter_left
		icon = 'red-scouter.dmi'
		icon_state = "left"
		layer = MOB_LAYER + 5
		name = "Class II Scouter"
		verb
			Wear_on_left()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -=icon('red-scouter.dmi',"left")
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += icon('red-scouter.dmi',"left")
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 100000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 100000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	yellow_scouter_left
		icon = 'yellow-scouter.dmi'
		icon_state = "left"
		layer = MOB_LAYER + 5
		name = "Class IV Scouter"
		verb
			Wear_on_left()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= icon('yellow-scouter.dmi',"left")
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += icon('yellow-scouter.dmi',"left")
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 10000000000000000000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 10000000000000000000000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					usr << "<B>[M.name]'s location: ([M.x],[M.y],[M.z])"

			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	blue_scouter_left
		icon = 'blue-scouter.dmi'
		icon_state = "left"
		layer = MOB_LAYER + 5
		name = "Class I Scouter"
		verb
			Wear_on_left()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= icon('blue-scouter.dmi',"left")
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += icon('blue-scouter.dmi',"left")
					usr << "You wear the [src.name]."

			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 50000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 50000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Search()
				set category = "Inventory"
				if(src.worn == 1)

					usr << "<B>Your location: ([usr.x],[usr.y])"
					for(var/mob/characters/M in world)
						if(M.z == usr.z)
							usr << "<B>[M.name]'s location: ([M.x],[M.y])"
			 			if(M.z != usr.z)
			 				usr << "<b>[M.name]'s location points off into the distance."
				if(src.worn == 0)
					usr << "You must be wearing it."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)


obj
	green_scouter_right
		icon = 'green-scouter.dmi'
		icon_state = "right"
		layer = MOB_LAYER + 5
		name = "Class III Scouter"
		verb
			Wear_on_right()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= icon('green-scouter.dmi',"right")
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += icon('green-scouter.dmi',"right")
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 1000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 1000000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	custom_scouter_right
		icon = 'custom-scouter.dmi'
		icon_state = "right"
		layer = MOB_LAYER + 5
		name = "Custom Scouter"
		verb
			Wear_on_right()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= icon('custom-scouter.dmi',"right")
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays +=icon('custom-scouter.dmi',"right")
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 1000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 1000000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	red_scouter_right
		icon = 'red-scouter.dmi'
		icon_state = "right"
		layer = MOB_LAYER + 5
		name = "Class II Scouter"
		verb
			Wear_on_right()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -=icon('red-scouter.dmi',"right")
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += icon('red-scouter.dmi',"right")
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 100000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 100000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	yellow_scouter_right
		icon = 'yellow-scouter.dmi'
		icon_state = "right"
		layer = MOB_LAYER + 5
		name = "Class IV Scouter"
		verb
			Wear_on_right()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= icon('yellow-scouter.dmi',"right")
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += icon('yellow-scouter.dmi',"right")
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 10000000000000000000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 10000000000000000000000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					usr << "<B>[M.name]'s location: ([M.x],[M.y],[M.z])"

			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	blue_scouter_right
		icon = 'blue-scouter.dmi'
		icon_state = "right"
		layer = MOB_LAYER + 5
		name = "Class I Scouter"
		verb
			Wear_on_right()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= icon('blue-scouter.dmi',"right")
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += icon('blue-scouter.dmi',"right")
					usr << "You wear the [src.name]."

			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 50000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 50000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Search()
				set category = "Inventory"
				if(src.worn == 1)

					usr << "<B>Your location: ([usr.x],[usr.y])"
					for(var/mob/characters/M in world)
						if(M.z == usr.z)
							usr << "<B>[M.name]'s location: ([M.x],[M.y])"
			 			if(M.z != usr.z)
			 				usr << "<b>[M.name]'s location points off into the distance."
				if(src.worn == 0)
					usr << "You must be wearing it."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
obj
	halo
		icon = 'halo.dmi'
		layer = MOB_LAYER + 999
obj
	heal
		icon = 'turfs.dmi'
		icon_state = "healing"
		name = "Healing Pod"
		layer = MOB_LAYER + 9999999999999
		verb
			Heal()
				set category = "Emotions and Training"
				set src in oview(1)
				usr.playerheal()
				usr.heal = 1

mob
	proc
		playerheal()
			if(usr.heal == 0||null)
				usr.powerlevel += 0
			if(usr.heal == 1)
				if(usr.powerlevel >= usr.maxpowerlevel)
					usr.powerlevel = usr.maxpowerlevel
					usr.heal = 0
				if(usr.powerlevel < usr.maxpowerlevel)
					usr.powerlevel += usr.powerlevel/rand(9,10)
					spawn(1)
						usr.playerheal()

obj
	assim
		icon = 'turfs.dmi'
		icon_state = "assim"
		layer = MOB_LAYER + 9999999999999999999999999999999999999999999999

obj
	saibamachine2
		icon = 'turfs.dmi'
		icon_state = "saibameen2"
		density = 1
		ssj = 0
		verb
			Saibaman()
				set category = "Emotions and Training"
				set name = "Saibaman"
				set src in oview(1)
				new /mob/monsters/Green_Saibaman(locate(src.x+1,src.y,src.z))
				new /mob/monsters/Green_Saibaman(locate(src.x-1,src.y,src.z))
				sleep(300)
obj
	ki
		icon = 'skills.dmi'
		icon_state = "ki"
		layer = MOB_LAYER + 99
obj
	kihit
		icon = 'skills.dmi'
		icon_state = "kihit"
		layer = MOB_LAYER + 99
obj/ssbomb
	icon = 'Sbomb.dmi'
	icon_state = "1234"


obj/ssbomb1
	pixel_y = 32
	icon = 'Sbomb.dmi'
	icon_state = "1"
	layer = MOB_LAYER + 99
obj/ssbomb2
	pixel_y = 32
	pixel_x = 32
	icon = 'Sbomb.dmi'
	icon_state = "2"
	layer = MOB_LAYER + 99
obj/ssbomb3
	pixel_y = 64
	icon = 'Sbomb.dmi'
	icon_state = "3"
	layer = MOB_LAYER + 99
obj/ssbomb4
	pixel_y = 64
	pixel_x = 32
	icon = 'Sbomb.dmi'
	icon_state = "4"
	layer = MOB_LAYER + 99

obj
	Create
		verb
			Create()
				set category = "Fighting"
				set name = "Create an Object"
				switch(input("What do you want to make? (Warning, this takes away your maximum powerlevel to make things)","Create an object") in list ("Scouter","Armor","Nothing"))
					if("Scouter")
						switch(input("What kind of Scouter?","Scouter") in list ("Class I","Class II","Class III"))
							if("Class I")
								if(usr.maxpowerlevel < 200)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 200)
									new /obj/blue_scouter_right(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes a Class I Scouter!"
									usr.maxpowerlevel -= 200
							if("Class II")
								if(usr.maxpowerlevel < 500)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 500)
									new /obj/red_scouter_right(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes a Class II Scouter!"
									usr.maxpowerlevel -= 500
							if("Class III")
								if(usr.maxpowerlevel < 1500)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 1500)
									new /obj/green_scouter_right(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes a Class III Scouter!"
									usr.maxpowerlevel -= 1500
					if("Armor")
						switch(input("What kind of Armor?","Scouter") in list ("Plain","Elite","Royal"))
							if("Plain")
								if(usr.maxpowerlevel < 500)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 500)
									new /obj/saiyanarmor(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes a Saiyajin Armor!"
									usr.maxpowerlevel -= 500
							if("Elite")
								if(usr.maxpowerlevel < 1500)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 1500)
									new /obj/elitesaiyanarmor(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes an Elite Saiyajin Armor!"
									usr.maxpowerlevel -= 1500
							if("Royal")
								if(usr.maxpowerlevel < 3000)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 3000)
									new /obj/royalsaiyan(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes a Royal Saiyajin Armor!"
									usr.maxpowerlevel -=3000
obj
	kshoot
		icon = 'turfs.dmi'
		icon_state = "des"

obj
	kien
		icon = 'turfs.dmi'
		icon_state = "des"


obj
	kienzan
		verb
			Kienzan(mob/characters/M in oview(7))
				set name = "Kienzan"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(M.npp == 1||M.npc == 1||M.npp == null)
						usr << "You cannot attack them. They are a newbie."
					if(M.npp == 0)
						var/dam = 1400 as num|null
						if(dam > usr.maxpowerlevel)
							view(6) << "[usr] creates a Kienzan Disc, but cannot handle it, and dies."
							usr.powerlevel = 0
							usr.Die()
						if(dam <= usr.maxpowerlevel)
							usr.kame = 1
							usr.icon_state = "des"
							sleep(12)
							var/snart = new /obj/kien(locate(usr.x,usr.y+1,usr.z))
							view(6)<< "DESTRUCTO DISC ATTACK!!!"
							sleep(rand(10,30))
							usr.kame = 0
							del(snart)
							s_missile(/obj/kien,usr,M)
							sleep(5)
							M.powerlevel -= dam * usr.Str / M.Def
							usr.powerlevel -= dam
							usr.icon_state = ""
							usr.KO()
							M.Die()

obj
	items
		Majin
			verb
				North()
					set category = "Majined"
					for(var/mob/M in world)
						if(M.majined == 1)
							M.dir = 1
							M.loc=locate(M.x,M.y+1,M.z)
							M << "A mysterious force leads you north."

				South()
					set category = "Majined"
					for(var/mob/M in world)
						if(M.majined == 1)
							M.dir = 2
							M.loc=locate(M.x,M.y-1,M.z)
							M << "A mysterious force leads you south."

				East()
					set category = "Majined"
					for(var/mob/M in world)
						if(M.majined == 1)
							M.dir = 4
							M.loc=locate(M.x+1,M.y,M.z)
							M << "A mysterious force leads you east."

				West()
					set category = "Majined"
					for(var/mob/M in world)
						if(M.majined == 1)
							M.dir = 8
							M.loc=locate(M.x-1,M.y,M.z)
							M << "A mysterious force leads you west."


				Recall(mob/M in world)
					set category = "Majined"
					if(M.majined == 1)
						M.loc=locate(usr.x,usr.y-1,usr.z)
					else
						usr << "They have not been Majined!"


				Force_OOC(mob/M in world,msg as text)
					set category = "Majined"

					if(M.majined == 1)
						world << "<b>OOC</b> [M.name] : <b><font color = red>[msg]"


				Force_say(mob/M in world,msg as text)
					set category = "Majined"

					if(M.majined == 1)
						world << "[M.name] says: [msg]"

				Restore(mob/M in world)
					set category = "Majined"
					if(M.majined ==1)
						M << "You feel your energy return"
						M.powerlevel = M.maxpowerlevel

				Talk_To_Your_Master(mob/M in world, msg as text)
					set category = "Majined"

					if(M.Master == 1)
						M << "[usr] says: [msg]"

				Reduce_PL(mob/M in world)
					set category = "Majined"

					if(M.majined ==1)
						M.powerlevel = 0

				Logout(mob/M in world)
					set category = "Majined"

					if(M.majined ==1)
						del M

				Cookie(mob/M in world)
					set category = "Majined"

					if(M.majined ==1)
						M.icon = 'cookie.dmi'
						M << "you feel your body change into something!"
						world.log << "Cookie!"
						world.log << "[M] is now a cookie!"

				Normal(mob/M in world)
					set category = "Majined"

					if(M.majined ==1)
						M.icon = 'goku.dmi'
						M << "you have been turnt into a saiyan!"

				Boost(mob/M in world)
					set category = "Majined"

					if(M.majined ==1)
						M.powerlevel += 1000
						M.maxpowerlevel += 1000
						world.log << "you feel a huge force apear from nowhere!"
						M << "you feel much more powerful!"

				Power_down(mob/M in world)
					set category = "Majined"

					if(M.majined ==1)
						M.powerlevel = M.maxpowerlevel
						world.log << "you feel a huge power die!"
						M << "you feel your power being drained away!"

				UnMajin(mob/M in oview(6))
					set category = "Majined"
					if(M.majined == 1)
						M:verbs += /mob/verb/Say
						M:verbs += /mob/verb/OOC
						M:verbs += /mob/verb/NewbieChat
						M:verbs += /mob/verb/RolePlay
						M:verbs -= /obj/items/Majin/verb/Talk_To_Your_Master

						usr:verbs -= /obj/items/Majin/verb/North
						usr:verbs -= /obj/items/Majin/verb/South
						usr:verbs -= /obj/items/Majin/verb/East
						usr:verbs -= /obj/items/Majin/verb/West
						usr:verbs -= /obj/items/Majin/verb/Recall
						usr:verbs -= /obj/items/Majin/verb/Force_say
						usr:verbs -= /obj/items/Majin/verb/Force_OOC
						usr:verbs -= /obj/items/Majin/verb/Restore
						usr:verbs -= /obj/items/Majin/verb/Reduce_PL
						usr:verbs -= /obj/items/Majin/verb/Logout
						usr:verbs -= /obj/items/Majin/verb/Cookie
						usr:verbs -= /obj/items/Majin/verb/Normal
						usr:verbs -= /obj/items/Majin/verb/Power_down
						usr:verbs -= /obj/items/Majin/verb/Boost
						M.name = "[M.name]"
						usr.Master = 0
						M.majined = 0
						M.Die()
						sleep(5)
						usr.majin = 0
						usr:verbs -= /obj/items/Majin/verb/UnMajin
						M << "You feel like the evil power has gone but you still have a M on your fore head!"
						usr << "You unmajined [M]!"

client/Move()
	sleep(15)
	Move()