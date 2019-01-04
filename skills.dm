
var/amount


obj
	spiritbomb
		verb
			sbomb(mob/characters/M in oview(15))
				set name = "Spirit Bomb"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(usr.Guild == M.Guild)
						usr<<"They are in your Guild! You cannot attack them!"
					else
						if(usr.flight == 1)
							usr<<"Sorry you must be on the ground to use this move!"
						else
							if(M.npp == 1||M.npc == 1||M.npp == null)
								usr << "You cannot attack them. They are a newbie."
							if(M.npp == 0)
								var/dam
								usr.move = 0
								usr.icon_state = "sbomb"
								usr.overlays += /obj/ssbomb1
								usr.overlays += /obj/ssbomb2
								usr.overlays += /obj/ssbomb3
								usr.overlays += /obj/ssbomb4
								usr<<"You have started a spirit bomb"
								view(6) << "[usr] begins charging a Spirit Bomb!!!</u></b>"
								view(16) <<"You sense great pure energy not far off"
								world << "Someone is charging something VERY powerful..."
								sleep(5)
								for(var/mob/O as mob in world)
									switch(input(O,"[usr] would like some energy for their Spirit Bomb?","Give energy to [usr]", text) in list ("Yes", "No"))
										if("Yes")
											dam += ((O.powerlevel / 20) * rand(1,2))
											O.powerlevel -= O.powerlevel/20
											O << "Thank You"
								usr.kame = 1
								sleep(100)
								usr.kame = 0
								usr.overlays -= /obj/ssbomb1
								usr.overlays -= /obj/ssbomb2
								usr.overlays -= /obj/ssbomb3
								usr.overlays -= /obj/ssbomb4
								s_missile(/obj/ssbomb,usr,M)
								sleep(5)
								usr.move = 1
								sleep(10)
								M.powerlevel -= dam
								usr.powerlevel -= usr.powerlevel / 2
								usr.icon_state = ""
								usr.KO()
								M.Die()
obj
	it
		verb
			Instant_Translocation(mob/characters/M in world)
				set name = "Instant Translocation"
				set category = "Fighting"
				if(M.adminroom == 1|| M.arena == 1)
					usr << "You cannot IT to [M], they are in a limited access room!"
				if(usr.dead == 1)
					usr << "<b>You cannot while you are dead."
				if(usr.dead == null||usr.dead == 0 && usr.arena == 0)
					for(var/mob/characters/P in oview(1))
						if(P.npp == 1||P.npc == 1&& P.arena == 0)
							usr << "<b>You cannot bring [P.name] with you."
						if(P.npp == 0)
							P.loc=locate(M.x,M.y+1,M.z)
							P << "<b>[usr] brings you to [M] with Instant Translocation."
					if(usr:npc1==1)
						walk_to(usr:pet,usr.loc,1,1)
					usr.x = M:x
					usr.y = M:y-1
					usr.z = M:z
					usr.safe = 0
					usr << "You go infront of [M]."
					M << "[usr] blurs in front of you."


obj
	worldscan
		verb
			World_Scan()
				set category = "Fighting"
				set name = "World Scan"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<b>------------------"
						usr << "<b><font color = blue>[M] :<font color = green> [M.powerlevel]"
						usr << "<b><font color = blue>[M]: Location: ([M.x],[M.y])"
					else
						usr.powerlevel += 0


obj
	uniscan
		verb
			Uni_Scan()
				set category = "Fighting"
				set name = "Universal Scan"
				for(var/mob/characters/M in world)
					usr << "<b>------------------"
					usr << "<b><font color = blue>[M] :<font color = green> [M.powerlevel]"
					usr << "<b><font color = blue>[M]: Location: ([M.x],[M.y])"
obj
	regen
		verb
			Regeneration()
				set name = "Regeneration"
				set category = "Fighting"
				if(usr.tech == 1)
					usr << "You feel yourself stop healing."
					usr.tech = 0
				else
					usr << "You feel yourself begin healing."
					usr.tech = 1
					usr.techcheck()

obj
	techwork
		verb
			Tech_Workings()
				set name = "Technical Workings"
				set category = "Fighting"
				if(usr.tech == 1)
					usr << "You turn off your Technical Workings."
					usr.tech = 0
				else
					usr << "You turn on your Technical Workings."
					usr.tech = 1
					usr.techcheck()

obj
	wrap
		verb
			Wrap(mob/characters/M in oview(6))
				set name = "Wrap"
				set category = "Fighting"
				if(usr.ased == 1)
					usr << "<b>You have wrapped recently!!</b>"
				if(usr.ased == 0)
					if(usr.spar == 1)
						usr << "<b>You cant while sparring."
					if(usr.spar == 0)
						if(usr.flight == 1)
							usr << "<b>You are too busy to! (You are flying)."
						if(usr.flight == 0)
							M.kiloc = M.loc
							s_missile('assimilate.dmi',usr,M)
							view(6) << "[usr.name] launches an Wrap attack at [M.name]!"
							sleep(5)
							if(M.loc == M.kiloc)
								usr.ased = 1
								view(6) << "<font color = blue><i>[M] gets held by [usr]'s Wrap!!"
								sleep(5)
								M.move = 0
								M.overlays += /obj/assim
								sleep(100)
								usr.ased = 0
								M.overlays -= /obj/assim
								M.move = 1




							else
								view(6) << "<font color = blue><i>[M] had stepped out of the way, causing the wrap to go by him!"


obj
	bsplitform
		verb
			Multiply()
				set name = "Bman Multiply! ;)"
				set category = "Fighting"
				if(usr.spar == 1)
					usr << "<b>You cant while sparring."
				if(usr.spar == 0)
					if(usr.flight == 1)
						usr << "<b>You are too busy to! (You are flying)."
					if(usr.flight == 0)
						new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
						view(6) << "<font size = 1><font color = green>Oohhhweee!!! A new <font size = 3>Bman<font size = 1> is born!"


obj
	kiabsorb
		verb
			Ki_Absorb()
				set name = "Ki Absorb"
				set category = "Fighting"
				if(usr.spar == 1)
					usr << "<b>You cant while sparring."
				if(usr.spar == 0)
					if(usr.flight == 1)
						usr << "<b>You are too busy to! (You are flying)."
					if(usr.flight == 0)
						if(usr.absorb == 1)
							usr << "<b>You are currently waiting to absorb."
						if(usr.absorb == 0)
							view(6) << "<b><font color = blue>[usr.name] gets ready to absorb."
							usr.absorb = 1
							sleep(50)
							usr.absorb = 0


obj
	bukujutsu
		verb
			bukujutsu()
				set name = "Bukujutsu"
				set category = "Fighting"
				if(usr.spar == 1)
					usr << "Not while sparring."
				if(usr.spar == 0)
					if(usr.oozaru == 1)
						if(usr.flight == 1)
							usr << "You float to the ground..."
							usr.density = 1
							usr.flight = 0
							usr.icon_state = ""
							usr.overlays += /obj/oozaruhead
							usr.overlays -= /obj/bukuoozaruhead

						else
							usr << "You begin to float above...."
							usr.density = 0
							usr.flight = 1
							usr.icon_state = "buku"
							usr.overlays -= /obj/oozaruhead
							usr.overlays += /obj/bukuoozaruhead
					else
						if(usr.flight == 1)
							usr << "You float to the ground..."
							usr.density = 1
							usr.flight = 0
							usr.icon_state = ""
						else
							usr << "You begin to float above...."
							usr.density = 0
							usr.flight = 1
							usr.icon_state = "buku"

obj
	aura
		verb
			powerup()
				set name = "Power Up"
				set category = "Fighting"
				if(usr.ptime == 1)
					usr << "You just cant seem too."
				if(usr.ptime == 0)
					if(usr.powered == null||1||0)
						if(usr.powerlevel >= usr.maxpowerlevel)
							usr << "You're at full powerlevel."
						if(usr.powerlevel < usr.maxpowerlevel)
							usr.ptime = 1
							usr << "<B>An aura flickers around you."
							var/aura = 'whiteaura.dmi'
							aura += rgb(usr.customred,usr.customgreen,usr.customblue)
							usr.underlays += aura
							if(usr.powerlevel >= 1000000)
								usr.overlays += /obj/ray
							if(usr.powerlevel < 1000000)
								usr.powerlevel += 0
							if(usr.powerdam >= (usr.maxpowerlevel-usr.powerlevel))
								usr.powerdam -= (usr.maxpowerlevel-usr.powerlevel)
								usr.powerlevel = usr.maxpowerlevel
								usr << "You have powered up."
							else
								if(usr.powerdam >= 0)
									usr.powerlevel += usr.powerdam
									usr.powerdam = 0
									usr <<"You used up the remainder of your energy!"
									usr << " You now have NO energy left!"
								else
									usr << "You have no energy left!"
							usr.underlays -= aura
							usr.overlays -= /obj/ray
							sleep(20)
							usr.ptime = 0




			powerdown()
				set name = "Power Down"
				set category = "Fighting"
				var/amount = input("What powerlevel do you wish to powerdown to?", "Power Down") as num|null
				if(amount >= usr.powerlevel)
					usr << "<b>You must power-up for that."
				if(amount < usr.powerlevel)
					if(amount < 0)
						usr << "<b>You dont want to die, do you?"
					if(amount >= 1)
						usr << "<b>You lower your powerlevel to <font color = blue>[amount]</font>."
						oview(20) << "<i><font color = blue>You sense a powerlevel drop in the distance."
						usr.powerlevel = amount
						usr.powerdam += amount
						if(usr.powerdam >= usr.maxpowerdam)
							usr.powerdam = usr.maxpowerdam
						usr.overlays -= 'whiteaura.dmi'
						usr.overlays -= /obj/whiteaura
						usr.overlays -= 'whiteaura.dmi'
						usr.overlays -= /obj/whiteaura
						usr.overlays -= 'whiteaura.dmi'
						usr.overlays -= /obj/whiteaura
						usr.overlays -= 'whiteaura.dmi'
						usr.overlays -= /obj/whiteaura

obj
	focus
		verb
			Focus()
				set name = "Focus"
				set category = "Fighting"
				set desc = "To focus inner strength."
				if(usr.ptime == 1)
					usr << "You cant seem to store it."
				if(usr.ptime == 0)
					if(usr.focused == 1)
						usr << "You are focused already."
					if(usr.focused == 0)
						var/amount = input("How much powerlevel do you wish to focus?", "Focus") as num|null
						if(usr.powerdam >= amount)
							if(amount > (usr.maxpowerlevel * 1.1))
								usr << "<b>You begin to feel the energy absorb into  you...."
								sleep(20)
								view(6) << "<font color = blue><i>[usr] explodes while focusing energy into himself!"
								usr.powerlevel = 0
								usr.Die()
							if(amount <= (usr.maxpowerlevel * 1.1))
								usr << "<b>You begin to feel the energy absorb into you...."
								usr.focused = 1
								sleep(20)
								usr.powerdam -= (amount-usr.powerlevel)
								usr.powerlevel = amount
								sleep(300)
								if(usr.powerlevel <= usr.maxpowerlevel)
									usr.powerlevel += 0
									usr.ptime = 1
									usr.focused = 0
									sleep(3000)
									usr.ptime = 0
								if(usr.powerlevel > usr.maxpowerlevel)
									usr.powerlevel = usr.maxpowerlevel
									usr << "<b>The energy escapes from you."
									usr.ptime = 1
									usr.focused = 0
									sleep(3000)
									usr.ptime = 0
						else
							usr << "You don't have enough energy!"





obj
	Kaioken
		verb
			Kaioken()
				set category = "Fighting"
				var/amount = input("What level of Kaioken?") as num|null
				if(amount == 0||amount == null)
					usr << "<b>You begin to release your kaioken...."
					sleep(rand(50,150))
					usr.kaioken = 0
					if(usr.powerlevel < usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel >= usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
					usr.underlays -= 'kaioaura.dmi'
				if(usr.ssj>=1)
					usr<<"You cannot Kaioken while in a Super Form!"
				else
					if(amount >= 1)
						if(amount > (usr.Def / 5))
							usr << "<b>From too much pressure, you explode under Kaioken!!!"
							view(6) << "<b>[usr] explodes from the use of Kaioken!"
							usr.powerlevel = 0
							usr.Die()
						if(amount <= (usr.Def / 5))
							if(usr.kaioken == 1)
								usr << "You need to wait."
							if(usr.kaioken == 0)
								if(amount >= 1000)
									view(8) << "<b><font color = red><font size = 4>SUPER KAIOKEN!!!!!!!!</b>"
									usr.powerlevel = amount/5  * usr.powerlevel
									usr.powerlevel = round(usr.powerlevel)
									usr.kaiokenstrain()
								if(amount >= 2 && amount <= 5)
									amount = round(amount)
									usr.powerlevel = amount/1.9  * usr.powerlevel
									usr.powerlevel = round(usr.powerlevel)
									view(6) << "<font color = red><b>KAIOKEN TIMES [amount]!!!"
									usr.stamina -= (rand(1,30))
									usr.kaiokenstrain()
								if(amount >= 5)
									amount = round(amount)
									usr.powerlevel = amount/4  * usr.powerlevel
									usr.powerlevel = round(usr.powerlevel)
									view(6) << "<font color = red><b>KAIOKEN TIMES [amount]!!!"
									usr.stamina -= (rand(1,30))
									usr.kaiokenstrain()
								if(amount < 2)
									amount = round(amount)
									usr.powerlevel = amount *1.4 * usr.powerlevel
									usr.powerlevel = round(usr.powerlevel)
									view(6) << "<font color = red><b>KAIOKEN TIMES [amount]!!!"
									usr.stamina -= (rand(1,30))
									usr.kaiokenstrain()
								usr.underlays += 'kaioaura.dmi'
								usr.kaioken = 1

						else
							usr << "FAULT"

//Blasts//
obj
	kame
		icon = 'kame.dmi'
		icon_state = ""
		layer = MOB_LAYER + 99
obj
	bb
		icon = 'bigbang.dmi'
		icon_state = ""
		layer = MOB_LAYER + 99
obj
	kb
		icon = 'skills.dmi'
		icon_state = "ki"
		layer = MOB_LAYER + 99
obj
	fs
		icon = 'skills.dmi'
		icon_state = "Firespin"
		layer = MOB_LAYER + 99
obj
	is
		icon = 'skills.dmi'
		icon_state = "Icespin"
		layer = MOB_LAYER + 99
obj
	rkb
		icon = 'skills.dmi'
		icon_state = "rki"
		layer = MOB_LAYER + 99
obj
	sbc
		icon = 'skills.dmi'
		icon_state = "sbc"
		layer = MOB_LAYER + 99
obj
	crater
		icon = 'skills.dmi'
		icon_state = "crater"
	crater1
		icon = 'skills.dmi'
		icon_state ="crater1"
	crater2
		icon = 'skills.dmi'
		icon_state ="crater2"
	crater3
		icon = 'skills.dmi'
		icon_state ="crater3"
	crater4
		icon = 'skills.dmi'
		icon_state ="crater4"

obj
	Kamehameha
		verb
			Kamehameha(mob/characters/M in oview(6))
				set name = "KameHameHa"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(usr.Guild == M.Guild)
						usr<<"They are in your Guild! You cannot attack them!"
					else
						if(M.npp == 1||M.npc == 1||M.npp == null)
							usr << "You cannot attack them. They are a newbie."
						if(M.npp == 0)
							var/dam = 2000 as num|null
							if(dam > usr.maxpowerlevel)
								view(6) << "[usr] explodes from attempting a KameHameHa."
								usr.powerlevel = 0
								usr.Die()
							if(dam <= usr.maxpowerlevel)
								usr.kame = 1
								view(6) << "[usr] : KAAAA"
								sleep(10)
								view(6) << "[usr] : MEEEE"
								sleep(10)
								usr.overlays += icon('turfs.dmi',"Kame")
								view(6) << "[usr] : HAAAA"
								sleep(10)
								view(6) << "[usr] : MEEEE"
								sleep(10)
								view(6) << "[usr] : HAAAAAAA!!!"
								usr.overlays -= icon('turfs.dmi',"Kame")
								usr.kame = 0
								s_missile(/obj/kame,usr,M)
								sleep(15)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								new /obj/crater(locate(M.x,M.y,M.z))
								usr.KO()
								for(var/obj/kame/A in oview(10))
									del(A)
								M.Die()
obj
	RekenzuEnergyDan
		verb
			RekenzuEnergyDan(mob/characters/M in oview(6))
				set name = "Rekenzu Energy Dan"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(M.npp == 1||M.npc == 1||M.npp == null)
						usr << "You cannot attack them. They are a newbie."
					if(M.npp == 0)
						if(usr.Guild == M.Guild)
							usr<<"They are in your Guild! You cannot attack them!"
						else
							var/dam = 50 as num|null
							if(dam > usr.maxpowerlevel)
								view(6) << "[usr] explodes from attempting to use a Super Rapid Fire."
								usr.powerlevel = 0
								usr.Die()
							if(dam <= usr.maxpowerlevel)
								usr.kame = 1
								view(6) << "[usr] : Yahhh, Yahh, Yahh, Yahh, YAHHH !!DIE MOTHER F*****!"
								sleep(2)
								usr.kame = 0
								s_missile(/obj/rkb,usr,M)
								sleep(2)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								s_missile(/obj/rkb,usr,M)
								sleep(2)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								s_missile(/obj/rkb,usr,M)
								sleep(2)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								s_missile(/obj/rkb,usr,M)
								sleep(5)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								var/dam2 = 120 as num|null
								s_missile(/obj/rkb,usr,M)
								sleep(5)
								M.powerlevel -= dam2 * usr.Str / M.Def
								usr.powerlevel -= dam2
								new /obj/crater(locate(M.x,M.y,M.z))
								usr.KO()
								for(var/obj/rkb/A in oview(10))
									del(A)
								M.Die()

obj
	ChouKamehameha
		verb
			ChouKamehameha(mob/characters/M in oview(6))
				set name = "Chou KameHameHa"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(M.npp == 1||M.npc == 1||M.npp == null)
						usr << "You cannot attack them. They are a newbie."
					if(M.npp == 0)
						if(usr.Guild == M.Guild)
							usr<<"They are in your Guild! You cannot attack them!"
						else
							var/dam = 5000 as num|null
							if(dam > usr.maxpowerlevel)
								view(6) << "[usr] explodes from attempting a ChouKameHameHa."
								usr.powerlevel = 0
								usr.Die()
							if(dam <= usr.maxpowerlevel)
								usr.underlays += icon('auras.dmi',"blackaura")
								usr.kame = 1
								view(6) << "[usr] : Chou"
								sleep(12)
								view(6) << "[usr] : Kaaaa"
								sleep(12)
								view(6) << "[usr] : Meeee"
								sleep(12)
								usr.overlays += icon('turfs.dmi',"Kame")
								view(6) << "[usr] : Haaaa"
								sleep(12)
								view(6) << "[usr] : Meeee"
								sleep(12)
								view(6) << "[usr] : HAAAAAAA!!!"
								usr.overlays -= icon('turfs.dmi',"Kame")
								usr.kame = 0
								s_missile(/obj/kame,usr,M)
								sleep(15)
								usr.underlays -= icon('auras.dmi',"blackaura")
								M.powerlevel -= dam * (usr.Str*1.1) / M.Def
								usr.powerlevel -= dam
								new /obj/crater(locate(usr.x,usr.y,usr.z))
								new /obj/crater1(locate(M.x+1,M.y-1,M.z))
								new /obj/crater2(locate(M.x+1,M.y,M.z))
								new /obj/crater3(locate(M.x,M.y,M.z))
								new /obj/crater4(locate(M.x,M.y-1,M.z))
								usr.KO()
								for(var/obj/kame/A in oview(10))
									del(A)
								M.Die()

obj
	BigBang
		verb
			BigBang(mob/characters/M in oview(6))
				set name = "Big Bang"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(M.npp == 1||M.npc == 1||M.npp == null)
						usr << "You cannot attack them. They are a newbie."
					if(M.npp == 0)
						if(usr.Guild == M.Guild)
							usr<<"They are in your Guild! You cannot attack them!"
						else
							var/dam = 1000 as num|null
							if(dam > usr.maxpowerlevel)
								view(6) << "[usr] explodes from attempting a Big Bang Attack."
								usr.powerlevel = 0
								usr.Die()
							if(dam <= usr.maxpowerlevel)
								usr.kame = 1
								usr.overlays += icon('turfs.dmi',"BBKame")
								view(6) << "[usr] : Big"
								sleep(10)
								view(6) << "[usr] : Bang"
								sleep(5)
								usr.overlays -= icon('turfs.dmi',"BBKame")
								view(6) << "[usr] : ATTACK!!!"
								usr.kame = 0
								s_missile(/obj/bb,usr,M)
								sleep(15)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								new /obj/crater(locate(M.x,M.y,M.z))
								usr.KO()
								for(var/obj/bb/A in oview(10))
									del(A)
								M.Die()
obj
	FireSpin
		verb
			FireSpin(mob/characters/M in oview(6))
				set name = "Flame Spinner Attack"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(M.npp == 1||M.npc == 1||M.npp == null)
						usr << "You cannot attack them. They are a newbie."
					if(M.npp == 0)
						if(usr.Guild == M.Guild)
							usr<<"They are in your Guild! You cannot attack them!"
						else
							var/dam = 3500 as num|null
							if(dam > usr.maxpowerlevel)
								view(6) << "[usr] explodes from attempting a Flame Spinner Attack."
								usr.powerlevel = 0
								usr.Die()
							if(dam <= usr.maxpowerlevel)
								usr.kame = 1
								view(6) << "[usr] : Suuuu"
								sleep(6)
								view(6) << "[usr] : NaaaaMaaaa"
								sleep(6)
								view(6) << "[usr] : FLAME!!!"
								sleep(6)
								view(6) << "[usr] : SPINNER!!!"
								sleep(6)
								view(6) << "[usr] : ATTACK!!!"
								usr.kame = 0
								s_missile(/obj/fs,usr,M)
								sleep(15)
								if(M.icon == 'suushenron.dmi')
									usr<<"Suu Shenron, is one with Fire."
									usr<<"Suu Shenron absorbed the flames, and a grin spread across his face!"
									M.powerlevel += usr.Str
									for(var/obj/fs/A in oview(10))
										del(A)
								else
									M.powerlevel -= dam * usr.Str / (M.Def/1.1)
									usr.powerlevel -= dam

									usr.KO()
									for(var/obj/fs/A in oview(10))
										del(A)
									M.Die()
obj
	IceSpin
		verb
			IceSpin(mob/characters/M in oview(6))
				set name = "Ice Spinning Attack"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(M.npp == 1||M.npc == 1||M.npp == null)
						usr << "You cannot attack them. They are a newbie."
					if(M.npp == 0)
						if(usr.Guild == M.Guild)
							usr<<"They are in your Guild! You cannot attack them!"
						else
							var/dam = 3500 as num|null
							if(dam > usr.maxpowerlevel)
								view(6) << "[usr] explodes from attempting a Ice Spinning Attack."
								usr.powerlevel = 0
								usr.Die()
							if(dam <= usr.maxpowerlevel)
								usr.kame = 1
								view(6) << "[usr] : Saaann"
								sleep(6)
								view(6) << "[usr] : Aishaaaa"
								sleep(6)
								view(6) << "[usr] : ICE!!!"
								sleep(6)
								view(6) << "[usr] : SPINNING!!!"
								sleep(6)
								view(6) << "[usr] : ATTACK!!!"
								usr.kame = 0
								s_missile(/obj/is,usr,M)
								sleep(15)
								if(M.icon == 'sanshenron.dmi')
									usr<<"San Shenron, is one with Ice."
									usr<<"San Shenron absorbed the ice, and a grin spread across his face!"
									M.powerlevel += usr.Str
									for(var/obj/is/A in oview(10))
										del(A)
								else
									M.powerlevel -= dam * usr.Str / (M.Def/1.1)
									usr.powerlevel -= dam
									usr.KO()
									for(var/obj/is/A in oview(10))
										del(A)
									M.Die()

obj
	KiBlast
		verb
			KiBlast(mob/characters/M in oview(6))
				set name = "Ki Blast"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(M.npp == 1||M.npc == 1||M.npp == null)
						usr << "You cannot attack them. They are a newbie."
					if(M.npp == 0)
						if(usr.Guild == M.Guild)
							usr<<"They are in your Guild! You cannot attack them!"
						else
							var/dam = 50 as num|null
							if(dam > usr.maxpowerlevel)
								view(6) << "[usr] explodes from attempting to use a Ki Blast."
								usr.powerlevel = 0
								usr.Die()
							if(dam <= usr.maxpowerlevel)
								usr.kame = 1
								view(6) << "[usr] : Yahhh"
								sleep(2)
								usr.kame = 0
								s_missile(/obj/kb,usr,M)
								sleep(15)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								usr.KO()
								for(var/obj/kb/A in oview(10))
									del(A)
								M.Die()
obj
	Sbc
		verb
			Sbc(mob/characters/M in oview(6))
				set name = "Special Beam Cannon"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(M.npp == 1||M.npc == 1||M.npp == null)
						usr << "You cannot attack them. They are a newbie."
					if(M.npp == 0)
						if(usr.Guild == M.Guild)
							usr<<"They are in your Guild! You cannot attack them!"
						else
							var/dam = 2500 as num|null
							if(dam > usr.maxpowerlevel)
								view(6) << "[usr] explodes from attempting to use a Special Beam Cannon."
								usr.powerlevel = 0
								usr.Die()
							if(dam <= usr.maxpowerlevel)
								usr.kame = 1
								view(6) << "[usr] : Special..."
								sleep(2)
								view(6) << "[usr] : Beam..."
								sleep(2)
								view(6) << "[usr] : CANNON!!!"
								sleep(2)
								usr.kame = 0
								s_missile(/obj/sbc,usr,M)
								sleep(15)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								new /obj/crater(locate(M.x,M.y,M.z))
								usr.KO()
								for(var/obj/sbc/A in oview(10))
									del(A)
								M.Die()
obj
	RapidFire
		verb
			RapidFire(mob/characters/M in oview(6))
				set name = "Rapid Fire"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are firing something already."
				if(usr.kame == 0)
					if(M.npp == 1||M.npc == 1||M.npp == null)
						usr << "You cannot attack them. They are a newbie."
					if(M.npp == 0)
						if(usr.Guild == M.Guild)
							usr<<"They are in your Guild! You cannot attack them!"
						else
							var/dam = 50 as num|null
							if(dam > usr.maxpowerlevel)
								view(6) << "[usr] explodes from attempting to use a Rapid Fire."
								usr.powerlevel = 0
								usr.Die()
							if(dam <= usr.maxpowerlevel)
								usr.kame = 1
								view(6) << "[usr] : Yahhh, Yahh, Yahh, DIE MOTHER F*****!"
								sleep(2)
								usr.kame = 0
								s_missile(/obj/rkb,usr,M)
								sleep(2)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								s_missile(/obj/rkb,usr,M)
								sleep(2)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								s_missile(/obj/rkb,usr,M)
								sleep(15)
								M.powerlevel -= dam * usr.Str / M.Def
								usr.powerlevel -= dam
								usr.KO()
								for(var/obj/rkb/A in oview(10))
									del(A)
								M.Die()

obj
	sui
		verb
			sui()
				set name = "Kamikaze Suicide Blast"
				set category = "Fighting"
				if(usr.arena == 1)
					usr << "You can't use that here!"
				else
					if(usr.kame == 1)
						usr << "You are firing something already."
					if(usr.kame == 0)
						var/dam = 0 as num|null
						usr.overlays+=icon('skills.dmi',"sui")
						dam = usr.powerlevel
						usr.kame = 1
						view(6) << "[usr] : KAAAA!!!"
						sleep(2)
						view(6) << "[usr] : MIIII!!!"
						sleep(2)
						view(6) << "[usr] : KAAAA!!!"
						sleep(2)
						view(6) << "[usr] : ZEEEE!!!"
						sleep(2)
						view(6) << "[usr] : SUICIDE!!!"
						sleep(2)
						view(6) << "[usr] : BLAST!!!"
						sleep(2)
						usr.kame = 0
						sleep(5)
						new /obj/crater1(locate(usr.x,usr.y,usr.z))
						new /obj/crater2(locate(usr.x,usr.y+1,usr.z))
						new /obj/crater3(locate(usr.x - 1,usr.y + 1,usr.z))
						new /obj/crater4(locate(usr.x-1,usr.y,usr.z))
						for(var/mob/characters/M in oview(6))
							M.powerlevel -= dam * usr.Str / M.Def
							spawn()
							M.Die()
						for(var/mob/monsters/M in oview(6))
							M.powerlevel -= dam * usr.Str / M.Def
							spawn()
							M.Die()
						usr.overlays-=icon('skills.dmi',"sui")
						world << "[usr] commited suicide!!!"
						usr.powerlevel -= (dam + 1)
						usr.Die()
