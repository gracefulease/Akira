mob/Login()
	src.loc = locate(7,7,15)

mob/proc/Log_in()
	src.loc=locate(38,59,1)
	src.move = 1
	src.ko = 0
	src.blocking = 0
	src.ptime = 0
	src.kiin = 0
	src.grav = 0
	src.combo = 0
	src.angered = 0
	src.oicon = src.icon
	src.powerlevel = src.maxpowerlevel
	src.tech = 0
	src.gainzenni = 0
	src.slap = 0
	src.entime = 0
	src.sight = 0
	src.overlays -= /obj/kame
	src.overlays -= /obj/kame
	src.overlays -= /obj/kame
	src.overlays -= /obj/kame
	src.overlays -= /obj/kame
	src.overlays -= /obj/kame
	src.focused = 0
	src.spar = 0
	src.icon_state = ""
	src.ased = 0
	src.talk = 1
	src.plarper = 1
	src.absorb = 0
	src.flight = 0
	src.tayio = 0
	src.training = 0
	src.density = 1
	src.safe = 0
	src.meditate = 0
	src.medtime = 0
	src.talk = 1
	src.entime = 0
	src.medtime = 0
	src.move = 1
	src:sight = 0
	src << "Note: Dragonball Zeta is in no way connected with FUNimation or Dragonball. This is only a fan game, devoted towards a game. Dragon Ball, Dragon Ball Z, and Dragon Ball GT are copyrighted and productions of Akira Toriyama, Bird Studio, Pioneer Anime, Weekly Shonen Jump, and Toei Animation."
	world << "<tt><font color = green>{{**<font color = white>[src] has logged in!<font color = green>**}}</tt>"
	usr.LogSSJ()
	usr.LogSSJ2()
	usr.LogSSJ3()
	usr.LogSSJ4()
	usr.LogSSJ5()
	usr.LogSSJ6()
	usr.LogHSSJ()
	usr.LogHSSJ2()
	usr.LogSN()
	usr.LogSN2()
	usr.LogSH()
	usr.LogSH2()

world
	//name = "Dragonball Zeta (Akira's Server)"
	name = "The Akira Chronicle - Dragonball Zeta"
	area = /area/outside


mob/Logout()
	usr.powerlevel -= usr.fusepl
	usr.maxpowerdam -= usr.fusepd
	usr.maxpowerlevel -= usr.fusepl
	usr.overlays -= 'hairstrip.dmi'
	usr.fuse = 0
	for(var/a in overlaysave)
		overlaysave += a
		overlays -= a
	del(src)

client/proc/SaveMob()
	var/firstletter=copytext(src.ckey, 1, 2)
	var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
	var/char_ckey = cKey(src.mob.name)
	F["/[ckey]/[char_ckey]"]<<src.mob

client/proc/LoadMob(char_ckey)
	var/firstletter=copytext(src.ckey, 1, 2)
	var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
	F["/[ckey]/[char_ckey]"]>>src.mob


client/Del()
	if (istype(src.mob, /mob/other/choosing_character))
		return ..()

	src.SaveMob()
	return ..()


mob/other/choosing_character
	Log_in()
		usr.move = 0
		usr.sight = 1
		spawn()
			src.ChooseCharacter()

	proc
		ChooseCharacter()
			var/list/characters = src.CharacterList()

			var/newCharacterChoice = "New Character"
			var/DeleteCharacterChoice = "Delete Character"
			var/list/menu = new()
			menu += characters
			menu += newCharacterChoice
			menu += DeleteCharacterChoice

			var/result = input("Character Creation", "Dragonball Zeta") in menu

			if (result == newCharacterChoice)
				src.CreateNewCharacter()
			if (result == DeleteCharacterChoice)
				src.DeleteCharacter()
				src.ChooseCharacter()
			else
				var/success = src.client.LoadMob(result)

				if (success)
					del(src)
				else
					alert("You have no character")
					src.ChooseCharacter()

		CharacterList()
			var/firstletter=copytext(src.ckey, 1, 2)
			var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
			F.cd = "/[ckey]"
			var/list/characters = F.dir
			return characters

		DeleteCharacter()
			var/firstletter=copytext(src.ckey, 1, 2)
			var/savefile/F = new("players/[firstletter]/[src.ckey].sav")

			F.cd = "/[ckey]"
			var/list/characters = F.dir

			var/CancelCharacterDeletion = "Decline"
			var/list/menu = new()
			menu += characters
			menu += CancelCharacterDeletion

			var/result = input("Delete character", "Character Creation") in menu

			if (result)
				F.cd = "/[ckey]"
				F.dir.Remove(result)
			if (result == CancelCharacterDeletion)
				src.ChooseCharacter()
			else
				src.ChooseCharacter()

mob/other/choosing_character/proc/CreateNewCharacter()

	var/prompt_title = "Character Creation"
	var/help_text = "What is your name? Please, nothing rude or obscene!"
	var/default_value = ""
	var/char_name = input(src, help_text, prompt_title, default_value) as null|text

	if (!char_name)
		src.ChooseCharacter()
		return

	var/ckey_name = ckey(char_name)
	var/list/characters = CharacterList()
	if (characters.Find(ckey_name))
		alert("Sorry, somebody already has that name!")
		src.CreateNewCharacter()
		return

	alert("This game was created by Eminem_mitch and Gokuss4neo!")
	alert("Please do not spam e.t.c, it is not very nice for other players and you may be booted!")
	help_text = "What race do you wish to be?"
	var/list/races = list("Earthling-Human", "Saiya-jin", "Halfbreed", "Namekian", "Biological Android","Android", "Changling")
	default_value = "Human"
	var/char_race = input(src, help_text, prompt_title, default_value) in races
	var/mob/new_mob
	switch(char_race)
		if("Earthling-Human")
			new_mob = new /mob/characters/humanjin()
			new_mob.move = 1
			new_mob.Str = 5
			new_mob.Def = 5
			new_mob.XP = 0
			new_mob.MaxXP = 45
			new_mob.focused = 0
			new_mob.powerlevel = 5
			new_mob.dead = 0
			new_mob.maxpowerlevel = 5
			new_mob.maxpowerdam = 10
			new_mob.rage = 0
			new_mob.kaioken = 0
			new_mob.rage = 0
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.father = "Unknown"
			new_mob.zenni = 3000
			new_mob.faceicon = 'default.dmi'
			new_mob.will = 0
			new_mob.honor = 0
			new_mob.gonessj = 0
			new_mob.state = "Normal"
			new_mob.purity = 0
			new_mob.talk = 1
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.auratechlearn = 0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			new_mob.style = 'style-calming.dmi'
			new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.race = "Human"
			new_mob.title = ""

			switch(input("What hair style do you want?", "Customization", text) in list ("Long","Spikey","Short","Goku","Vegeta","Bald"))

				if("Bald")
					new_mob.hair = "Bald"

				if("Short")
					new_mob.hair = "Short"
					new_mob.overlays += 'hair_black_short.dmi'

				if("Spikey")
					new_mob.hair = "Spikey"
					new_mob.overlays += 'hair_black_spikey.dmi'

				if("Long")
					new_mob.hair = "Long"
					new_mob.overlays += 'hair_black_long.dmi'

				if("Vegeta")
					new_mob.hair = "Vegeta"
					new_mob.overlays += 'hair_vegeta.dmi'

				if("Goku")
					new_mob.hair = "Goku"
					new_mob.overlays += 'hair_goku.dmi'

			switch(input("What tint of skin color do you want?", "Character Creation", text) in list ("White (Pale)", "Tan", "Dark Brown","Olive"))
				if("White (Pale)")
					new_mob.icon = 'male-white.dmi'
					new_mob.skin = "Pale"
				if("Tan")
					new_mob.icon = 'male.dmi'
					new_mob.skin = "Tan"
				if("Dark Brown")
					new_mob.icon = 'male-black.dmi'
					new_mob.skin = "Dark Brown"
				if("Olive")
					new_mob.icon = 'male-olive.dmi'
					new_mob.skin = "Olive"

		if("Saiya-jin")
			new_mob = new /mob/characters/saiyajin()
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.Str = 6
			new_mob.Def = 6
			new_mob.XP = 0
			new_mob.MaxXP = 75
			new_mob.powerlevel = 5
			new_mob.maxpowerlevel = 5
			new_mob.maxpowerdam = 5
			new_mob.dead = 0
			new_mob.rage = 0
			new_mob.rage = 0
			new_mob.faceicon = 'default.dmi'
			new_mob.gonessj = 0
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.zenni = 3000
			new_mob.will = 0
			new_mob.honor = 0
			new_mob.gonessj = 0
			new_mob.state = "Normal"
			new_mob.purity = 0
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.auratechlearn = 0
			new_mob.kaioken = 0
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.father = "Unknown"
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			new_mob.style = 'style-calming.dmi'
			new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.race = "Saiya-jin"
			new_mob.overlays += /obj/tail
			new_mob.title = ""
			new_mob.talk = 1

			switch(input("What hair style do you want?", "Customization", text) in list ("Long","Spikey","Short","Goku","Vegeta","Bald"))

				if("Bald")
					new_mob.hair = "Bald"

				if("Short")
					new_mob.hair = "Short"
					new_mob.overlays += 'hair_black_short.dmi'

				if("Spikey")
					new_mob.hair = "Spikey"
					new_mob.overlays += 'hair_black_spikey.dmi'

				if("Long")
					new_mob.hair = "Long"
					new_mob.overlays += 'hair_black_long.dmi'

				if("Vegeta")
					new_mob.hair = "Vegeta"
					new_mob.overlays += 'hair_vegeta.dmi'

				if("Goku")
					new_mob.hair = "Goku"
					new_mob.overlays += 'hair_goku.dmi'


			switch(input("What tint of skin color do you want?", "Character Creation", text) in list ("White (Pale)", "Olive", "Dark Brown"))
				if("White (Pale)")
					new_mob.icon = 'male-white.dmi'
					new_mob.skin = "Pale"
				if("Dark Brown")
					new_mob.icon = 'male-black.dmi'
					new_mob.skin = "Dark Brown"
				if("Olive")
					new_mob.icon = 'male-olive.dmi'
					new_mob.skin = "Olive"



		if("Halfbreed")
			new_mob = new /mob/characters/halfieh()
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.Str = 5
			new_mob.Def = 6
			new_mob.XP = 0
			new_mob.MaxXP = 50
			new_mob.powerlevel = 5
			new_mob.maxpowerlevel = 5
			new_mob.maxpowerdam = 12
			new_mob.rage = 0
			new_mob.rage = 0
			new_mob.faceicon = 'default.dmi'
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.zenni = 3000
			new_mob.gonessj = 0
			new_mob.will = 0
			new_mob.honor = 0
			new_mob.state = "Normal"
			new_mob.gonessj = 0
			new_mob.purity = 0
			new_mob.dead = 0
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.father = "Unknown"
			new_mob.kaioken = 0
			new_mob.auratechlearn = 0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			new_mob.style = 'style-calming.dmi'
			new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.race = "Half-Saiyan"
			new_mob.title = ""
			new_mob.talk = 1
			switch(input("What hair style do you want?", "Customization", text) in list ("Long","Spikey","Short","Goku","Vegeta","Bald"))

				if("Bald")
					new_mob.hair = "Bald"

				if("Short")
					new_mob.hair = "Short"
					new_mob.overlays += 'hair_black_short.dmi'

				if("Spikey")
					new_mob.hair = "Spikey"
					new_mob.overlays += 'hair_black_spikey.dmi'

				if("Long")
					new_mob.hair = "Long"
					new_mob.overlays += 'hair_black_long.dmi'

				if("Vegeta")
					new_mob.hair = "Vegeta"
					new_mob.overlays += 'hair_vegeta.dmi'

				if("Goku")
					new_mob.hair = "Goku"
					new_mob.overlays += 'hair_goku.dmi'

			switch(input("What tint of skin color do you want?", "Character Creation", text) in list ("White (Pale)", "Tan", "Dark Brown","Olive"))
				if("White (Pale)")
					new_mob.icon = 'male-white.dmi'
					new_mob.skin = "Pale"
				if("Tan")
					new_mob.icon = 'male.dmi'
					new_mob.skin = "Tan"
				if("Dark Brown")
					new_mob.icon = 'male-black.dmi'
					new_mob.skin = "Dark Brown"
				if("Olive")
					new_mob.icon = 'male-olive.dmi'
					new_mob.skin = "Olive"


		if("Namekian")

			new_mob = new /mob/characters/namekjin()
			new_mob.hair = "Bald"
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.Str = 4
			new_mob.Def = 4
			new_mob.XP = 0
			new_mob.MaxXP = 46
			new_mob.powerlevel = 5
			new_mob.maxpowerlevel = 5
			new_mob.maxpowerdam = 12
			new_mob.rage = 0
			new_mob.rage = 0
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.father = "Unknown"
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.state = "Normal"
			new_mob.kaioken = 0
			new_mob.zenni = 3000
			new_mob.will = 0
			new_mob.honor = 0
			new_mob.purity = 0
			new_mob.faceicon = 'default.dmi'
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.dead = 0
			new_mob.auratechlearn = 0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			new_mob.style = 'style-calming.dmi'
			new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.title = ""
			new_mob.race = "Namek-jin"
			new_mob.icon = 'namek.dmi'
			new_mob.talk = 1
			switch(input("What tint of skin color do you want?", "Character Creation", text) in list ("Green", "Dark Green"))
				if("Green")
					new_mob.icon = 'namek.dmi'
					new_mob.skin = "Green"
				if("Dark Green")
					new_mob.icon = 'namek-dark.dmi'
					new_mob.skin = "Dark Green"

		if("Biological Android")
			switch(input("What type?", "Bioandroid", text) in list ("Type 001 (Human)","Type A001 (Human w/ different skin colors)","Type 002 (Blue Dragon)"))
				if("Type 001 (Human)")
					usr.icon = 'male.dmi'
					new_mob = new /mob/characters/bioandroidone()
					new_mob.move = 1
					new_mob.Str = 5
					new_mob.Def = 5
					new_mob.XP = 0
					new_mob.MaxXP = 50
					new_mob.focused = 0
					new_mob.powerlevel = 1000
					new_mob.maxpowerlevel = 1000
					new_mob.maxpowerdam = 1500
					new_mob.rage = 0
					new_mob.rage = 0
					new_mob.stamina = 100
					new_mob.maxstamina = 100
					new_mob.zenni = 3000
					new_mob.faceicon = 'default.dmi'
					new_mob.state = "Normal"
					new_mob.will = 0
					new_mob.dead = 0
					new_mob.honor = 0
					new_mob.loc=locate(39,58,1)
					new_mob.purity = 0
					new_mob.kaioken = 0
					new_mob.maxstamina = 100
					new_mob.mother = "None"
					new_mob.father = "None"
					new_mob.kitech = "None"
					new_mob.auratech = "None"
					new_mob.kitechlearn = 0
					new_mob.auratechlearn = 0
					new_mob.focustechlearn = 0
					new_mob.kicolor = "None"
					new_mob.focus = "None"
					new_mob.style = 'style-calming.dmi'
					new_mob.stylename = "Calming"
					new_mob.flightlearn = 0
					new_mob.title = ""
					new_mob.race = "Biological Android"
					new_mob.talk = 1

					switch(input("What hair style do you want?", "Customization", text) in list ("Long","Spikey","Short","Bald"))

						if("Bald")
							new_mob.hair = "Bald"

						if("Short")
							new_mob.hair = "Short"
							new_mob.overlays += 'hair_black_short.dmi'

						if("Spikey")
							new_mob.hair = "Spikey"
							new_mob.overlays += 'hair_black_spikey.dmi'

						if("Long")
							new_mob.hair = "Long"
							new_mob.overlays += 'hair_black_long.dmi'

					switch(input("What tint of skin color do you want?", "Character Creation", text) in list ("White (Pale)", "Tan", "Dark Brown"))
						if("White (Pale)")
							new_mob.icon = 'male-white.dmi'
							new_mob.skin = "Pale"
						if("Tan")
							new_mob.icon = 'male.dmi'
							new_mob.skin = "Tan"
						if("Dark Brown")
							new_mob.icon = 'male-black.dmi'
							new_mob.skin = "Dark Brown"



				if("Type A001 (Human w/ different skin colors)")
					new_mob = new /mob/characters/bioandroidtwo()
					new_mob.move = 1
					new_mob.focused = 0
					new_mob.Str = 5
					new_mob.Def = 5
					new_mob.XP = 0
					new_mob.MaxXP = 50
					new_mob.powerlevel = 1000
					new_mob.maxpowerlevel = 1000
					new_mob.maxpowerdam = 1500
					new_mob.rage = 0
					new_mob.rage = 0
					new_mob.stamina = 100
					new_mob.maxstamina = 100
					new_mob.zenni = 3000
					new_mob.will = 0
					new_mob.faceicon = 'default.dmi'
					new_mob.dead = 0
					new_mob.state = "Normal"
					new_mob.kaioken = 0
					new_mob.honor = 0
					new_mob.purity = 0
					new_mob.kitech = "None"
					new_mob.auratech = "None"
					new_mob.kitechlearn = 0
					new_mob.auratechlearn = 0
					new_mob.mother = "None"
					new_mob.father = "None"
					new_mob.focustechlearn = 0
					new_mob.kicolor = "None"
					new_mob.focus = "None"
					new_mob.style = 'style-calming.dmi'
					new_mob.stylename = "Calming"
					new_mob.flightlearn = 0
					new_mob.title = ""
					new_mob.race = "Biological Android"
					new_mob.talk = 1
					switch(input("What hair style do you want?", "Customization", text) in list ("Long","Spikey","Short","Bald"))

						if("Bald")
							new_mob.hair = "Bald"

						if("Short")
							new_mob.hair = "Short"
							new_mob.overlays += 'hair_black_short.dmi'

						if("Spikey")
							new_mob.hair = "Spikey"
							new_mob.overlays += 'hair_black_spikey.dmi'

						if("Long")
							new_mob.hair = "Long"
							new_mob.overlays += 'hair_black_long.dmi'


					switch(input("Do you want to customize your skin color?", "Character Creation", text) in list ("Yes", "No"))
						if("Yes")
							var/red = input("How much red (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
							new_mob.icon += rgb((red),0,0)
							var/blue = input("How much blue (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
							new_mob.icon += rgb(0,(blue),0)
							var/green = input("How much green (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
							new_mob.icon += rgb(0,0,(green))
						if("No")
							..()


				if("Type 002 (Blue Dragon)")
					usr.icon = 'bioandroid-one.dmi'
					new_mob = new /mob/characters/bioandroidthree()
					new_mob.move = 1
					new_mob.focused = 0
					new_mob.Str = 5
					new_mob.Def = 5
					new_mob.XP = 0
					new_mob.MaxXP = 51
					new_mob.powerlevel = 1000
					new_mob.maxpowerlevel = 1000
					new_mob.maxpowerdam = 1500
					new_mob.mother = "None"
					new_mob.father = "None"
					new_mob.rage = 0
					new_mob.kaioken = 0
					new_mob.rage = 0
					new_mob.stamina = 100
					new_mob.state = "Normal"
					new_mob.maxstamina = 100
					new_mob.faceicon = 'default.dmi'
					new_mob.zenni = 3000
					new_mob.will = 0
					new_mob.dead = 0
					new_mob.honor = 0
					new_mob.purity = 0
					new_mob.kitech = "None"
					new_mob.auratech = "None"
					new_mob.kitechlearn = 0
					new_mob.auratechlearn = 0
					new_mob.focustechlearn = 0
					new_mob.kicolor = "None"
					new_mob.focus = "None"
					new_mob.style = 'style-calming.dmi'
					new_mob.stylename = "Calming"
					new_mob.flightlearn = 0
					new_mob.title = ""
					new_mob.race = "Biological Android"
					new_mob.talk = 1




		if("Android")

			new_mob = new /mob/characters/android()
			new_mob.move = 1
			new_mob.Str = 5
			new_mob.Def = 5
			new_mob.XP = 0
			new_mob.MaxXP = 50
			new_mob.focused = 0
			new_mob.powerlevel = 1000
			new_mob.maxpowerlevel = 1000
			new_mob.maxpowerdam = 1500
			new_mob.rage = 0
			new_mob.rage = 0
			new_mob.faceicon = 'default.dmi'
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.zenni = 3000
			new_mob.will = 0
			new_mob.dead = 0
			new_mob.state = "Normal"
			new_mob.kaioken = 0
			new_mob.mother = "None"
			new_mob.father = "None"
			new_mob.honor = 0
			new_mob.purity = 0
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.auratechlearn = 0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			new_mob.style = 'style-calming.dmi'
			new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.title = ""
			new_mob.icon = 'bioandroid-two.dmi'
			new_mob.race = "Android"
			new_mob.talk = 1
			switch(input("Do you want to customize your skin color?", "Character Creation", text) in list ("Yes", "No"))
				if("Yes")
					var/red = input("How much red (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
					new_mob.icon += rgb((red),0,0)
					rhair = red
					var/blue = input("How much blue (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
					new_mob.icon += rgb(0,(blue),0)
					bhair = blue
					var/green = input("How much green (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
					new_mob.icon += rgb(0,0,(green))
					ghair = green
				if("No")
					..()

		if("Changling")
			new_mob = new /mob/characters/changling()
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.Str = 7
			new_mob.Def = 7
			new_mob.XP = 0
			new_mob.MaxXP = 100
			new_mob.powerlevel = 5
			new_mob.dead = 0
			new_mob.maxpowerlevel = 5
			new_mob.maxpowerdam = 15
			new_mob.rage = 0
			new_mob.kaioken = 0
			new_mob.rage = 0
			new_mob.skin = "Changeling"
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.father = "Unknown"
			new_mob.zenni = 3000
			new_mob.faceicon = 'default.dmi'
			new_mob.will = 0
			new_mob.honor = 0
			new_mob.gonessj = 0
			new_mob.state = "Normal"
			new_mob.purity = 0
			new_mob.talk = 1
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.auratechlearn = 0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			new_mob.style = 'style-calming.dmi'
			new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.race = "Changeling"
			new_mob.title = ""


	switch(input("Do you want a title?","Character Creation",text) in list ("Yes","No"))
		if("Yes")
			var/amount = input("What do you want your title to be? (You may use HTML, but please end it with </font>).") as text|null
			new_mob.title = amount
		if("No")
			..()

	switch(input("Do you want a face icon?", "Face Icon",text) in list("Yes","No"))
		if("Yes")
			var/class = input("What kind of face icon?","Icon Choose") in list("Icon","Preset Icon","Cancel")
			switch(class)
				if("Icon")
					var/econ = input("Pick icon:","Icon") as icon
					new_mob.faceicon = econ
				if("Preset Icon")
					switch(input("What icon do you want to use?", "Icon Choose") in list ("Goku","Gohan","Vegeta","Trunks","Goten","Goku SSJ","Gohan SSJ","Gohan SSJ(2)","Gohan SSJ(3)","Gotenks","Gotenks2","Gotenks3","Kami","Dende","Turles","Vegeta2","Gogetta","Frieza","Majin Vegeta","Vegeta SSJ4","Vegetto"))
						if("Goku")
							new_mob.faceicon = 'goku.bmp'
						if("Goku SSJ")
							new_mob.faceicon = 'ssjgoku2.bmp'
						if("Vegeta")
							new_mob.faceicon = 'vegeta.bmp'
						if("Gohan")
							new_mob.faceicon = 'gohanssj.bmp'
						if("Gohan SSJ")
							new_mob.faceicon = 'gohan.bmp'
						if("Gohan SSJ(2)")
							new_mob.faceicon = 'ssj2gohan.bmp'
						if("Gohan SSJ(3)")
							new_mob.faceicon = 'ssj2gohan2.bmp'
						if("Gotenks")
							new_mob.faceicon = 'gotenks.bmp'
						if("Gotenks2")
							new_mob.faceicon = 'gotenks2.bmp'
						if("Gotenks3")
							new_mob.faceicon = 'gotenks3.bmp'
						if("Gogetta")
							new_mob.faceicon = 'gogetta.bmp'
						if("Vegetto")
							new_mob.faceicon = 'ssjgoku3.bmp'
						if("Majin Vegeta")
							new_mob.faceicon = 'majveg.bmp'
						if("Trunks")
							new_mob.faceicon = 'trunks.bmp'
						if("Dende")
							new_mob.faceicon = 'dende.bmp'
						if("Goten")
							new_mob.faceicon = 'goten.bmp'
						if("Kami")
							new_mob.faceicon = 'kame.bmp'
						if("Raditz")
							new_mob.faceicon = 'raditz.bmp'
						if("Turles")
							new_mob.faceicon = 'turles.bmp'
						if("Vegeta2")
							new_mob.faceicon = 'vegeta2.bmp'
						if("Frieza")
							new_mob.faceicon = 'icer.bmp'
	new_mob.random = rand(1,75)
	if(new_mob.random == 75)
		switch(input("You have been born a Buu Demon. Do you wish to keep this? Or continue old character?",text) in list ("Make Buu Demon","Keep Old Character"))
			if("Make Buu Demon")
				new_mob.move = 1
				new_mob.focused = 0
				new_mob.Str = 10
				new_mob.Def = 10
				new_mob.XP = 0
				new_mob.MaxXP = 60
				new_mob.overlays = 0
				new_mob.powerlevel = 5
				new_mob.maxpowerlevel = 5
				new_mob.maxpowerdam = 2000
				new_mob.rage = 0
				new_mob.rage = 0
				new_mob.stamina = 100
				new_mob.maxstamina = 100
				new_mob.state = ")v(ajin"
				new_mob.kaioken = 0
				new_mob.zenni = 3000
				new_mob.will = 0
				new_mob.honor = 0
				new_mob.purity = 0
				new_mob.faceicon = 'default.dmi'
				new_mob.kitech = "None"
				new_mob.auratech = "None"
				new_mob.kitechlearn = 0
				new_mob.dead = 0
				new_mob.auratechlearn = 0
				new_mob.focustechlearn = 0
				new_mob.kicolor = "None"
				new_mob.focus = "None"
				new_mob.style = 'style-calming.dmi'
				new_mob.stylename = "Calming"
				new_mob.flightlearn = 0
				new_mob.title = ""
				new_mob.race = "Buu Demon"
				new_mob.icon = 'buu.dmi'
				new_mob.maxpowerlevel += rand(1,15000)
				new_mob.contents += new /obj/wrap
				new_mob.contents += new /obj/regen
				new_mob.contents += new /obj/uniscan
				new_mob.contents += new /obj/kiabsorb
				new_mob.contents += new /obj/Kaioken
	else
		..()

	new_mob.oicon = new_mob.icon
	new_mob.npp = 1
	new_mob.name = char_name

	src.client.mob = new_mob
	new_mob.loc = locate(38,59,1)
	del(src)
	sample_report()
	alert("This is to let ou see your character.")
	alert("If you do not like what you see, click 'Quit'and you shall exit the game, when you re-enter, select delete character, and delete it!")
	alert("Click 'Play Now' to start!")


mob
	Write(savefile/F)
		..()

		F["last_x"] << x
		F["last_y"] << y
		F["last_z"] << z

	Read(savefile/F)
		..()

		var/last_x
		var/last_y
		var/last_z
		F["last_x"] >> last_x
		F["last_y"] >> last_y
		F["last_z"] >> last_z
		loc = locate(last_x, last_y, last_z)

	proc
		sample_report()
			src << "<b><font size = 1><font color = silver><center>Game made by Eminem_mitch and Gokuss4neo"
			src << "<b>Welcome to the <U><I>AKIRA CHRONICLES</U></I>!!!"
			usr.loc = locate(38,59,1)

