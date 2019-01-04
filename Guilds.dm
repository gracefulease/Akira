


mob
	var
		Guild = "N/A"
mob
	verb
		Make_a_guild(msg as text)
			set category = "Communication"
			if(usr.Guild=="N/A")
				if(usr.zenni>= 20000)
					usr.move = 0
					alert("This cost 20,000 zenni!")
					alert("Are you sure you want to do this, money is NOT refundable!")
					switch(input("Are you sure you want to make a Guild?","Create Guild",text) in list ("Yes","No"))
						if("Yes")
							usr<<"Ok!"
							usr.zenni -= 20000
							usr.Guild = "[msg]"
							usr<<"Your Guild is created!"
							src.verbs+=typesof(/mob/Guild_Basic_Member/verb/)
							usr.verbs += /mob/Guild_Leader/verb/Invite_New_Member
							usr.verbs += /mob/Guild_Leader/verb/Kick_Guild_Member
							usr.verbs += /mob/Guild_Leader/verb/Guild_Leader_Say
							usr.verbs += /mob/Guild_Leader/verb/Make_a_new_Leader
							world<<"[msg] Guild has been created by [usr]!"
						if("No")
							usr.zenni -= 0
							usr<<"that is fine"
				else
					usr<<"Sorry you do not have enough Zenni!  You need 20,000!"
				usr.move = 1
			else
				usr<<"Sorry you are already in a Guild!"
mob
	Guild_Leader/verb
		Invite_New_Member(mob/characters/M in world)
			set category = "Guild"
			if(M.Guild == "N/A")
				switch(input(M,"[usr] wants you to join their Guild, do you want to join [usr]'s guild?","Join [usr]'s guild", text) in list ("Yes", "No"))
					if("Yes")
						M.Guild = usr.Guild
						M.verbs+=typesof(/mob/Guild_Basic_Member/verb)
						usr<<"[M] has joined your guild!"
						M<<"You have joined [usr]'s guild!"
					if("No")
						usr<<"Sorry, [M] didn't want to join your guild!"
		Kick_Guild_Member(mob/characters/M in world)
			set category = "Guild"
			if(M.Guild == usr.Guild)
				switch(input("Are you sure you want to kick [M] from your Guild?","Kick [M] from Guild",text) in list ("Yes","No"))
					if("Yes")
						M <<"Sorry, you have been kicked from [M.Guild]!"
						usr<<"You have kicked [M] from the Guild!"
						M.Guild = "N/A"
						M.verbs -=typesof(/mob/Guild_Basic_Member/verb)
						M.verbs -= /mob/Guild_Leader/verb/Invite_New_Member
						M.verbs -= /mob/Guild_Leader/verb/Kick_Guild_Member
						M.verbs -= /mob/Guild_Leader/verb/Guild_Leader_Say
						M.verbs -= /mob/Guild_Leader/verb/Make_a_new_Leader
						M.verbs -= /mob/Guild_Leader/verb/Make_a_new_Recruiter
						M.verbs -=typesof(/mob/Guild_Recruiter/verb)
						for(var/mob/O in world)
							if(O.Guild == src.Guild)
								O<<"[M] has been kicked from the Guild by [usr]!"
		Guild_Leader_Say(msg as text)
			set category = "Guild"
			for(var/mob/M in world)
				if(M.Guild == src.Guild)
					M << "<U><font color = red>{{<font color = silver>Guild-Leader Say<font color = red>}}</U><I><B><font color = green>{{<font color = red>[usr]<font color = green>}}<font color = silver></I></B> : [Safe_Guard(msg)]"
		Make_a_new_Leader(mob/characters/M in world)
			set category = "Guild"
			if(M.Guild == usr.Guild)
				switch(input(M,"[usr] wants you to be a Guild Leader for [usr.Guild], do you want to be a Guild Leader?","Become a Guild Leader", text) in list ("Yes", "No"))
					if("Yes")
						M.verbs+=typesof(/mob/Guild_Basic_Member/verb/)
						M.verbs += /mob/Guild_Leader/verb/Invite_New_Member
						M.verbs += /mob/Guild_Leader/verb/Kick_Guild_Member
						M.verbs += /mob/Guild_Leader/verb/Guild_Leader_Say
						M.verbs += /mob/Guild_Leader/verb/Make_a_new_Leader
						M.verbs += /mob/Guild_Leader/verb/Make_a_new_Recruiter
						usr<<"[M] has become a leader in the Guild!"
						M<<"You have become a leader in the Guild!"
					if("No")
						usr<<"Sorry, [M] didn't want to become a leader in the Guild!"
			else
				usr<<"They are not in your guild!"
		Make_a_new_Recruiter(mob/characters/M in world)
			set category = "Guild"
			if(M.Guild == usr.Guild)
				switch(input(M,"[usr] wants you to be a Guild Leader for [usr.Guild], do you want to be a Guild Leader?","Become a Guild Leader", text) in list ("Yes", "No"))
					if("Yes")
						M.verbs += /mob/Guild_Recruiter/verb/Invite_New_Member
						usr<<"[M] has become a leader in the Guild!"
						M<<"You have become a leader in the Guild!"
					if("No")
						usr<<"Sorry, [M] didn't want to become a leader in the Guild!"
			else
				usr<<"They are not in your guild!"
mob
	Guild_Recruiter/verb
		Invite_New_Member(mob/characters/M in world)
			set category = "Guild"
			if(M.Guild == "N/A")
				switch(input(M,"[usr] wants you to join their Guild, do you want to join [usr]'s guild?","Join [usr]'s guild", text) in list ("Yes", "No"))
					if("Yes")
						M.Guild = usr.Guild
						M.verbs+=typesof(/mob/Guild_Basic_Member/verb)
						usr<<"[M] has joined your guild!"
						M<<"You have joined [usr]'s guild!"
					if("No")
						usr<<"Sorry, [M] didn't want to join your guild!"

mob
	Guild_Basic_Member/verb
		Leave_Guild()
			set category = "Guild"
			switch(input("Are you sure you want to leave your Guild?","Leave Guild",text) in list ("Yes","No"))
				if("Yes")
					world<<"[usr] left [usr.Guild] !"
					usr.Guild = "N/A"
					usr.verbs -= /mob/Guild_Basic_Member/verb/Leave_Guild
					usr.verbs -= /mob/Guild_Basic_Member/verb/Guild_Members
					usr.verbs -= /mob/Guild_Basic_Member/verb/Guild_Say
					usr.verbs -= /mob/Guild_Recruiter/verb/Invite_New_Member
				if("No")
					usr<<"Good for you!"
		Guild_Members()
			set category = "Guild"
			src << "The following are in your guild:"
			for(var/mob/M in world)
				if(M.Guild == src.Guild)
					src << "[M]"
		Guild_Say(msg as text)
			set category = "Guild"
			for(var/mob/M in world)
				if(M.Guild == src.Guild)
					M << "<font color = red>{{<font color = silver>Guild Say<font color = red>}}<font color = green><tt>{{<font color = red>[usr]<font color = green>}}<font color = silver> : [Safe_Guard(msg)]"