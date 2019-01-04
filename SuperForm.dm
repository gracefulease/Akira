mob
	verb
		Transform()
			set category = "Fighting"
			if(ssj6learn==1)
				if(race == "Saiya-jin")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2","State 3","State 4","State 5","State 6","State 7")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Saiyan()
					if(a=="State 3")
						Super_Saiyan_2()
					if(a=="State 4")
						Super_Saiyan_3()
					if(a=="State 5")
						Super_Saiyan_4()
					if(a=="State 6")
						Super_Saiyan_5()
					if(a=="State 7")
						Super_Saiyan_6()
			if(ssj5learn==1&&transform==0)
				if(race == "Saiya-jin")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2","State 3","State 4","State 5","State 6")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Saiyan()
					if(a=="State 3")
						Super_Saiyan_2()
					if(a=="State 4")
						Super_Saiyan_3()
					if(a=="State 5")
						Super_Saiyan_4()
					if(a=="State 6")
						Super_Saiyan_5()
			if(ssj4learn==1&&transform==0)
				if(race == "Saiya-jin")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2","State 3","State 4","State 5")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Saiyan()
					if(a=="State 3")
						Super_Saiyan_2()
					if(a=="State 4")
						Super_Saiyan_3()
					if(a=="State 5")
						Super_Saiyan_4()
			if(ssj3learn==1&&transform==0)
				if(race == "Saiya-jin")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2","State 3","State 4")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Saiyan()
					if(a=="State 3")
						Super_Saiyan_2()
					if(a=="State 4")
						Super_Saiyan_3()
				if(usr.race=="Changeling")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("Form 1 (revert)","Form 2","Form 3","Form 4")
					if(a=="Form 1 (revert)")
						Revert()
					if(a=="Form 2")
						Changeling_Form_2()
					if(a=="Form 3")
						Changeling_Form_3()
					if(a=="Form 4")
						Changeling_Form_4()
			if(ssj2learn==1&&transform==0)
				if(race == "Saiya-jin")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2","State 3")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Saiyan()
					if(a=="State 3")
						Super_Saiyan_2()
				if(race == "Human")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2","State 3")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Human()
					if(a=="State 3")
						Super_Human_2()
				if(race == "Namek")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2","State 3")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Namek()
					if(a=="State 3")
						Super_Namek_2()
				if(usr.race=="Half-Saiyan")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2","State 3")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Saiyan()
					if(a=="State 3")
						Super_Saiyan_2()
				if(usr.race=="Changeling")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("Form 1 (revert)","Form 2","Form 3")
					if(a=="Form 1 (revert)")
						Revert()
					if(a=="Form 2")
						Changeling_Form_2()
					if(a=="Form 3")
						Changeling_Form_3()
			if(ssjlearn==1&&transform==0)
				if(race == "Saiya-jin")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Saiyan()
				if(race == "Human")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Human()
				if(race == "Namek")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Namek()
				if(usr.race=="Half-Saiyan")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("State 1 (revert)","State 2")
					if(a=="State 1 (revert)")
						Revert()
					if(a=="State 2")
						Super_Saiyan()
				if(usr.race=="Changeling")
					transform = 1
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("Form 1 (revert)","Form 2")
					if(a=="Form 1 (revert)")
						Revert()
					if(a=="Form 2")
						Changeling_Form_2()
				if(usr.race=="Android")
					var/a=input("Which State do you want to go?", "Super Forms:") in list ("Form 1 (revert)","Form 2")
					if(a=="Form 1 (revert)")
						Revert()
					if(a=="Form 2")
						Super_Android()
			transform=0
mob
	proc
		Super_Human()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.overlays += 'hair_super_human.dmi'
				usr.overlays -= 'hair_black_spikey.dmi'
				usr.overlays -= 'hair_black_long.dmi'
				usr.overlays -= 'hair_black_short.dmi'
				usr.overlays -= 'hair_goku.dmi'
				usr.overlays -= 'hair_vegeta.dmi'
				usr.underlays += 'ssjaura.dmi'
				ssj=1
				usr<< "You went Super Human!!!"
				src.Str +=19
				src.Def +=19
				src.maxpowerlevel +=55000
				src.powerlevel +=55000
mob
	proc
		Super_Human_2()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.overlays += 'sh2.dmi'
				usr.overlays += icon('elec.dmi',"sh")
				usr.overlays -= 'hair_black_spikey.dmi'
				usr.overlays -= 'hair_black_long.dmi'
				usr.overlays -= 'hair_black_short.dmi'
				usr.overlays -= 'hair_goku.dmi'
				usr.overlays -= 'hair_vegeta.dmi'
				usr.underlays += 'ssjaura.dmi'
				ssj=2
				usr<< "You went Super Human_2!!!"
				src.Str +=27
				src.Def +=27
				src.maxpowerlevel +=125500
				src.powerlevel +=125500

mob
	proc
		Super_Namek()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.icon = 'super-namek.dmi'
				usr.underlays += 'ssjaura.dmi'
				ssj=1
				usr<< "Your eyes turn dark red, power pulses through your for arms...your skin darkens...you are a Super Namek!!!"
				src.Str +=20
				src.Def +=20
				src.maxpowerlevel +=60000
				src.powerlevel +=60000
mob
	proc
		Super_Namek_2()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.icon = 'super-namek.dmi'
				usr.underlays += 'ssjaura.dmi'
				usr.overlays+='elec.dmi'
				ssj=2
				usr<< "Your eyes turn dark red, power pulses through your for arms and body...your skin darkens...you are a Super Namek 2!!!"
				src.Str +=30
				src.Def +=30
				src.maxpowerlevel +=130000
				src.powerlevel +=130000
mob
	proc
		Changeling_Form_2()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				ssj=1
				usr<< "Your body grows more muscular and your horns lengthen...You are in your second form!!"
				icon = 'ChangeForm2.dmi'
				src.Str +=20
				src.Def +=20
				src.maxpowerlevel +=60000
				src.powerlevel +=60000
mob
	proc
		Changeling_Form_3()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				ssj=2
				usr<< "Your muscles bulge, and your entire body grows in size...You are in your third form!!!"
				icon = 'ChangeForm3.dmi'
				src.Str +=65
				src.Def +=65
				src.maxpowerlevel +=240000
				src.powerlevel +=240000
mob
	proc
		Changeling_Form_4()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				ssj=3
				usr<< "Your muscles bulge, and your entire body grows in size, then your entire body glows, and your body compacts.  You feel immenense power surging through you. You are in your ULTIMATE FORM!!!!!"
				icon = 'ChangeForm4.dmi'
				src.Str +=100
				src.Def +=100
				src.maxpowerlevel +=600000
				src.powerlevel +=600000
mob
	proc
		Super_Android()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.underlays += 'ssjaura.dmi'
				usr.overlays += 'elec.dmi'
				usr.icon = 'superbioandroid-two.dmi'
				ssj=1
				src.Str += 15
				src.Def += 30
				src.maxpowerlevel +=75000
				src.powerlevel +=75000
				usr<<"You are now a Super Android!!!"

mob
	proc
		Super_Saiyan()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.overlays += 'hair_super_saiyajin.dmi'
				usr.overlays -= 'hair_black_spikey.dmi'
				usr.overlays -= 'hair_black_long.dmi'
				usr.overlays -= 'hair_black_short.dmi'
				usr.overlays -= 'hair_goku.dmi'
				usr.overlays -= 'hair_vegeta.dmi'
				usr.underlays += 'ssjaura.dmi'
				ssj=1
				usr<< "You went Super Saiyan!!!"
				if(usr.race == "Saiya-jin")
					src.Str +=15
					src.Def +=15
					src.maxpowerlevel +=50000
					src.powerlevel +=50000
				if(usr.race == "Half-Saiyan")
					src.Str +=16
					src.Def +=16
					src.maxpowerlevel +=52000
					src.powerlevel +=52000
mob
	proc
		Super_Saiyan_2()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.overlays += 'hair_super_saiyajin.dmi'
				usr.overlays -= 'hair_black_spikey.dmi'
				usr.overlays -= 'hair_black_long.dmi'
				usr.overlays -= 'hair_black_short.dmi'
				usr.overlays -= 'hair_goku.dmi'
				usr.overlays -= 'hair_vegeta.dmi'
				usr.underlays += 'ssjaura.dmi'
				usr.overlays += 'elec.dmi'
				ssj=2
				usr<< "You went to the Ascended Super Saiyan level!!!"
				if(usr.race == "Saiya-jin")
					src.Str +=25
					src.Def +=25
					src.maxpowerlevel +=120000
					src.powerlevel +=120000
				if(usr.race == "Half-Saiyan")
					src.Str +=27
					src.Def +=27
					src.maxpowerlevel +=122000
					src.powerlevel +=122000
			else
				usr<<"You are already in super form!"

mob
	proc
		Super_Saiyan_3()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.overlays += 'ssj3.dmi'
				usr.overlays -= 'hair_black_spikey.dmi'
				usr.overlays -= 'hair_black_long.dmi'
				usr.overlays -= 'hair_black_short.dmi'
				usr.overlays -= 'hair_goku.dmi'
				usr.overlays -= 'hair_vegeta.dmi'
				usr.underlays += 'ssjaura.dmi'
				usr.overlays += 'elec.dmi'
				ssj=3
				usr<< "You went to the Super Saiyan 3!!!"
				src.Str +=45
				src.Def +=45
				src.maxpowerlevel +=220000
				src.powerlevel +=220000
			else
				usr<<"You are already in super form!"

mob
	proc
		Super_Saiyan_4()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.overlays += 'ssj4-hair.dmi'
				usr.icon = 'ssj4.dmi'
				usr.overlays -= 'hair_black_spikey.dmi'
				usr.overlays -= 'hair_black_long.dmi'
				usr.overlays -= 'hair_black_short.dmi'
				usr.overlays -= 'hair_goku.dmi'
				usr.overlays -= 'hair_vegeta.dmi'
				usr.underlays += 'ssjaura.dmi'
				usr.overlays += 'elec.dmi'
				ssj=4
				usr<< "You feel immense, undreamable power surging through you body...You Are A Super Saiyan 4!!!"
				src.Str +=90
				src.Def +=90
				src.maxpowerlevel +=500000
				src.powerlevel +=500000
			else
				usr<<"You are already in super form!"
mob
	proc
		Super_Saiyan_5()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.overlays += 'ssj5-hair.dmi'
				usr.icon = 'ssj5.dmi'
				usr.overlays -= 'hair_black_spikey.dmi'
				usr.overlays -= 'hair_black_long.dmi'
				usr.overlays -= 'hair_black_short.dmi'
				usr.overlays -= 'hair_goku.dmi'
				usr.overlays -= 'hair_vegeta.dmi'
				usr.underlays += 'ssjaura.dmi'
				usr.overlays += icon('elec.dmi',"ssj5")
				ssj=5
				usr<< "You feel immense, undreamable power surging through you body. More, and more, the power flows within you...You Are A Super Saiyan 5!!!"
				src.Str +=110
				src.Def +=110
				src.maxpowerlevel +=750000
				src.powerlevel +=750000
			else
				usr<<"You are already in super form!"
mob
	proc
		Super_Saiyan_6()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr.overlays += 'ssj6-hair.dmi'
				usr.icon = 'ssj6.dmi'
				usr.overlays -= 'hair_black_spikey.dmi'
				usr.overlays -= 'hair_black_long.dmi'
				usr.overlays -= 'hair_black_short.dmi'
				usr.overlays -= 'hair_goku.dmi'
				usr.overlays -= 'hair_vegeta.dmi'
				usr.underlays += 'ssjaura.dmi'
				usr.overlays += icon('elec.dmi',"ssj5")
				ssj=6
				usr<< "Immense power flows through your veins, you feel your skin change to a matter stronger than anything on Earth.  You are a Super Saiyan 6!!!!!"
				src.Str +=1100
				src.Def +=1100
				src.maxpowerlevel +=5000000
				src.powerlevel +=5000000
			else
				usr<<"You are already in super form!"

mob
	proc
		Revert()
			set category = "Fighting"
			if(ssj == 0||ssj==null)
				usr<<"You are already in you normal form."
			if(race == "Saiya-jin")
				if(ssj == 1)
					usr.overlays -= 'hair_super_saiyajin.dmi'
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
					usr.underlays -= 'ssjaura.dmi'
					ssj=0
					usr<< "You reverted from Super Saiyan!!!"
					src.Str -=15
					src.Def -=15
					src.maxpowerlevel -=50000
					src.powerlevel -=50000
				if(ssj == 2)
					usr.overlays -= 'hair_super_saiyajin.dmi'
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
					usr.underlays -= icon('auras.dmi',"whiteaura")
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays -= 'elec.dmi'
					ssj=0
					usr<< "You reverted from Ascended Super Saiyan!!!"
					src.Str -=25
					src.Def -=25
					src.maxpowerlevel -=120000
					src.powerlevel -=120000
				if(ssj == 3)
					usr.overlays -= 'ssj3.dmi'
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
					usr.underlays -= icon('auras.dmi',"whiteaura")
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays -= 'elec.dmi'
					ssj=0
					usr<< "You reverted from Super Saiyan 3!!!"
					src.Str -=45
					src.Def -=45
					src.maxpowerlevel -=220000
					src.powerlevel -=220000
				if(ssj == 4)
					usr.overlays -= 'ssj4-hair.dmi'
					if(usr.skin=="Pale")
						usr.icon = 'male-white.dmi'
					if(usr.skin=="Tan")
						usr.icon = 'male.dmi'
					if(usr.skin=="Dark Black")
						usr.icon = 'male-black.dmi'
					if(usr.skin=="Olive")
						usr.icon = 'male-olive.dmi'
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
					usr.underlays -= icon('auras.dmi',"whiteaura")
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays -= 'elec.dmi'
					ssj=0
					usr<< "You reverted from Super Saiyan 4!!!"
					src.Str -=90
					src.Def -=90
					src.maxpowerlevel -=500000
					src.powerlevel -=500000
				if(ssj == 5)
					usr.overlays -= 'ssj5-hair.dmi'
					if(usr.skin=="Pale")
						usr.icon = 'male-white.dmi'
					if(usr.skin=="Tan")
						usr.icon = 'male.dmi'
					if(usr.skin=="Dark Black")
						usr.icon = 'male-black.dmi'
					if(usr.skin=="Olive")
						usr.icon = 'male-olive.dmi'
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
					usr.underlays -= icon('auras.dmi',"whiteaura")
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays -= icon('elec.dmi',"ssj5")
					ssj=0
					usr<< "You reverted from Super Saiyan 5!!!"
					src.Str -=110
					src.Def -=110
					src.maxpowerlevel -=750000
					src.powerlevel -=750000
				if(ssj == 6)
					usr.overlays -= 'ssj6-hair.dmi'
					if(usr.skin=="Pale")
						usr.icon = 'male-white.dmi'
					if(usr.skin=="Tan")
						usr.icon = 'male.dmi'
					if(usr.skin=="Dark Black")
						usr.icon = 'male-black.dmi'
					if(usr.skin=="Olive")
						usr.icon = 'male-olive.dmi'
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
					usr.underlays -= icon('auras.dmi',"whiteaura")
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays -= icon('elec.dmi',"ssj5")
					ssj=0
					usr<< "You reverted from Super Saiyan 6!!!"
					src.Str -=1100
					src.Def -=1100
					src.maxpowerlevel -=5000000
					src.powerlevel -=5000000
			if(race == "Half-Saiyan")
				if(ssj == 1)
					usr.overlays -= 'hair_super_saiyajin.dmi'
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
					usr.underlays -= 'ssjaura.dmi'
					ssj=0
					usr<< "You reverted from Super Saiyan!!!"
					src.Str -=16
					src.Def -=16
					src.maxpowerlevel -=52000
					src.powerlevel -=52000
				if(ssj == 2)
					usr.overlays -= 'hair_super_saiyajin.dmi'
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
					usr.underlays -= icon('auras.dmi',"whiteaura")
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays -= 'elec.dmi'
					ssj=0
					usr<< "You reverted from Ascended Super Saiyan!!!"
					src.Str -=27
					src.Def -=27
					src.maxpowerlevel -=122000
					src.powerlevel -=122000
			if(race == "Namek-jin")
				if(ssj == 1)
					if(usr.skin == "Dark Green")
						usr.icon = 'namek-dark.dmi'
					if(usr.skin == "Green")
						usr.icon = 'namek.dmi'
					usr.underlays -= 'ssjaura.dmi'
					ssj=0
					usr<< "Your eyes turn back to normal colour...your skin lightens...you are back to normal!!!"
					src.Str -=20
					src.Def -=20
					src.maxpowerlevel -=60000
					src.powerlevel -=60000
				if(ssj == 2)
					usr.icon = 'super-namek.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays-='elec.dmi'
					ssj=0
					usr<< "Your eyes turn back to normal colour...your skin lightens...you are back to normal!!!"
					src.Str -=30
					src.Def -=30
					src.maxpowerlevel -=130000
					src.powerlevel -=130000
			if(race == "Human")
				if(ssj == 1)
					usr.overlays -= 'hair_super_human.dmi'
					usr.underlays -= 'ssjaura.dmi'
					ssj=0
					usr<< "You feel the power let off, and you return to normal!!!"
					src.Str -=19
					src.Def -=19
					src.maxpowerlevel -=55000
					src.powerlevel -=55000
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
				if(ssj == 2)
					usr.overlays -= 'sh2.dmi'
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
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays-=icon('elec.dmi',"sh")
					ssj=0
					usr<< "You feel the power let off, and you return to normal!!!"
					src.Str -=27
					src.Def -=27
					src.maxpowerlevel -=125500
					src.powerlevel -=125500
			if(race == "Changeling")
				if(ssj == 1)
					ssj=0
					icon = 'changling.dmi'
					usr<< "You feel the power let off, your muscles reduce, and you return to normal!!!"
					src.Str -=20
					src.Def -=20
					src.maxpowerlevel -=60000
					src.powerlevel -=60000
				if(ssj == 2)
					ssj=0
					icon = 'changling.dmi'
					usr<< "Your muscles reduce, your body shrinks a little, and you return to normal!!!"
					src.Str -=65
					src.Def -=65
					src.maxpowerlevel -=240000
					src.powerlevel -=240000
				if(ssj == 3)
					ssj=0
					icon = 'changling.dmi'
					usr<<"The power ceases to surge through you, your body begins to glow, and you leave the aura, back to normal!"
					src.Str -=100
					src.Def -=100
					src.maxpowerlevel -=600000
					src.powerlevel -=600000
			if(race == "Android")
				if(ssj == 1)
					ssj=0
					icon = 'bioandroid-two.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays -= 'elec.dmi'
					usr<<"You revert to your normal from!"
					src.Str -= 15
					src.Def -= 30
					src.maxpowerlevel -=75000
					src.powerlevel -=75000
					src.icon += rgb(0,0,(ghair))
					src.icon += rgb(0,(bhair),0)
					src.icon += rgb((rhair),0,0)