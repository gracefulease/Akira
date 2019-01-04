world
	mob = /mob/other/choosing_character
	view = 6
	tick_lag = 2
	loop_checks = 0


client
	script = "<STYLE>BODY {background: black; color: white}  IMG.icon{width:32;height:32}</STYLE>"


client
	verb
		Save()
			set category = "Communication"
			SaveMob()
			usr << "Saving Character..."
			sleep(5)
			usr<<"."
			sleep(2)
			usr<<".."
			sleep(2)
			usr<<"..."
			sleep(2)
			usr<<"...."
			sleep(2)
			usr<<"....."
			sleep(2)
			usr<<"......"
			sleep(2)
			usr << "Save Complete"