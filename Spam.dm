proc/SGS_Filter_txt(txt)
	var/stars
	var/s_amount
	var/mem
	var/find_t
	var/txtLen
	var/Words[]
	Words = new /list/
	Words = list("fuck","shit","fcuk","bitch","b1tch","biatch","whore","fag","dick","gay","lesbian","faggot","fag","pussy","cunt","cock","nigger","Alabama")
	if(Words.len)
		memo:
			for(mem = 1,mem < Words.len + 1,mem++)
				find_t = findtext(txt,Words[mem])
				if(find_t)
					txtLen = length(Words[mem])
					stars = null
					s_amount = null
					for(s_amount = 0,s_amount < txtLen,s_amount++)
						stars += "*"
					txt = copytext(txt,1,find_t) + stars + copytext(txt,find_t+txtLen,0)
					if(findtext(txt,Words[mem])) goto memo
	return txt
mob/var/tmp/SGS_kick_for_repeat
mob/var/tmp/SGS_remember_txt
mob/var/tmp/SGS_locked = 0
var/list/SGS_Spam_log_file
proc/SGS_AntiSpam(txt)
  SGS_log_spam(txt)
  var/spam = list("<beep>")
  for(var/m in spam)
    if(SGS_allow_beep == 0)
      if(findtext(txt,m))
        return ""
      else if(SGS_allowhtml == 0) return SGS_AntiSpam2(copytext(html_encode(txt),1,SGS_Brake_txt))
      else if(SGS_allowhtml == 1) return SGS_AntiSpam2(copytext(html_encode(txt),1,SGS_Brake_txt))
proc/SGS_AntiSpam2(txt)
  if(usr.SGS_locked == 0)
    if(usr.SGS_remember_txt == txt)
      usr.SGS_kick_for_repeat ++
    else
      usr.SGS_remember_txt = txt
      usr.SGS_kick_for_repeat = null
      usr.SGS_kick_for_repeat ++
    if(usr.SGS_kick_for_repeat == SGS_spam_num)
      usr.SGS_locked = 1
      usr.SGS_kick_for_repeat = null
      usr.SGS_remember_txt = null
      spawn(10) usr << "<B>Your now muted, by <font color = yellow>Spam Protector</font> you can talk in [SGS_Bantime] Ticks"
      spawn(SGS_Bantime) usr.SGS_locked = 0
    return txt
    SGS_reset()

proc/SGS_reset()
  spawn(SGS_Waittime) usr.SGS_kick_for_repeat = null

proc/SGS_log_spam(txt)
  if(SGS_Safe_Log_txt == 1)
    var/txt2 = "<br>[usr] said at time: [time2text(world.realtime,"MMM DD hh:mm")] : [txt]"
    SGS_Spam_log_file.Add(txt2)
world/New()
  SGS_Spam_log_file = new/list
  if(SGS_CrashGuard == 1) Lag_Guard()
  Rep()
client/New()
    ..()
    src << "<font size = 1><font color = silver><B>Guarded By Spam Protector (V.2.1)"
proc/Safe_Guard(txt)
	return SGS_Filter_txt(SGS_AntiSpam(txt))
var/SGS_Brake_txt = 100
var/SGS_spam_num = 3
var/SGS_allow_beep = 0
var/SGS_Safe_Log_txt = 1
var/SGS_allowhtml = 0
var/SGS_CrashGuard = 0
var/SGS_Waittime = 100
var/SGS_Bantime = 100
mob/var/SGS_Stop_all_txt = 0
var/tick_mem
proc/Lag_Guard()
  tick_mem = world.tick_lag
  spawn while(1)
    if(world.cpu >= 50)
      world.tick_lag += 1
    if(world.cpu <= 49)
      if(!world.tick_lag == tick_mem)
        world.tick_lag -= 1
    sleep(10)

