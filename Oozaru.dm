mob
	proc
		Oozaru()
			if(usr.race == "Saiya-jin"||usr.race == "Half-Saiyan")
				if(usr.moon == 1)
					if(usr.ssj ==null||usr.ssj==0)
						usr.oozaru = 1
						usr<<"You see the full moon shining in the sky!"
						view(6)<<"[usr] : AHHAHAHAHHHH!"
						for(var/mob/characters/M in oview(6))
							M.sight = 1
						sleep(2)
						usr.icon = 'oozaru.dmi'
						usr.oozaru = 1
						usr.overlays -= usr.overlays
						if(usr.flight == 0||usr.flight == null)
							usr.overlays += /obj/oozaruhead
							usr.icon_state = ""
						else
							usr.overlays += /obj/bukuoozaruhead
							usr.icon_state = "buku"
						for(var/mob/characters/M in oview(6))
							M.sight = 0
						usr.powerlevel += 100000
						usr.powerdam += 10000000
						usr.Str += 200
						usr.Def += 10
						sleep(3000)
						usr.Str -= 200
						usr.Def -= 10
						usr<<"You revert to normal size!"
						view(6)<<"[usr] : AHHAHAHAHHHH!"
						for(var/mob/characters/M in oview(6))
							M.sight = 1
						sleep(2)
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
						if(usr.skin=="Pale")
							usr.icon = 'male-white.dmi'
						if(usr.skin=="Tan")
							usr.icon = 'male.dmi'
						if(usr.skin=="Dark Black")
							usr.icon = 'male-black.dmi'
						if(usr.skin=="Olive")
							usr.icon = 'male-olive.dmi'
						if(usr.flight == 0||usr.flight == null)
							usr.icon_state = ""
							usr.overlays -= /obj/oozaruhead
							usr.overlays -= /obj/bukuoozaruhead
						else
							usr.icon_state = "buku"
							usr.overlays -= /obj/bukuoozaruhead
							usr.overlays -= /obj/oozaruhead
						usr.oozaru = 0
						for(var/obj/O in src.contents)
							if(O.worn == 1)
								O.layer = MOB_LAYER+1
								src.overlays += O
						for(var/mob/characters/M in oview(6))
							spawn()
							M.sight = 0
						usr.moon = 0

obj/oozaruhead
	pixel_y = 32
	icon = 'oozaru.dmi'
	icon_state = "2"
obj/bukuoozaruhead
	pixel_y = 32
	icon = 'oozaru.dmi'
	icon_state = "buku2"