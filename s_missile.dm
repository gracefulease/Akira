obj/spl_projectile
	name = ""
	layer = 5
	Click()
		..()
		var/M
		var/layer = 1
		for(M in src.loc)
			if(M:layer > 1)
				layer = M:layer
		for(M in src.loc)
			if(M:layer == layer && M != src)
				M:Click()
				break


proc
	s_missile()
		var/obj/ref
		var/turf/start
		var/end
		var/homing
		var/lag
		if(isloc(args[1]))
			ref = args[1]

			start = args[2]

			if(isobj(start) || ismob(start))
				start = start:loc

			end = args[3]

			if(!homing) //if it isn't a homing projectile
				if(ismob(end) || isobj(end)) //target the loc if it is a mob|obj
					end = end:loc

			if(args.len >= 4)
				lag = args[4]
			else
				lag = 1

			if(args.len >= 5)
				homing = args[5]
			else
				homing = 0

		else if(isicon(args[1]))
			if(istext(args[2]))
				ref = new /obj/spl_projectile
				ref.icon = args[1]
				ref.icon_state = args[2]

				start = args[3]

				if(isobj(start) || ismob(start))
					start = start:loc

				end = args[4]

				if(!homing) //if it isn't a homing projectile
					if(ismob(end) || isobj(end)) //target the loc if it is a mob|obj
						end = end:loc

				if(args.len >= 5)
					lag = args[5]
				else
					lag = 1

				if(args.len >= 6)
					homing = args[6]
				else
					homing = 0

			else
				ref = new /obj/spl_projectile
				ref.icon = args[1]

				start = args[2]

				if(isobj(start) || ismob(start))
					start = start:loc

				end = args[3]

				if(!homing) //if it isn't a homing projectile
					if(ismob(end) || isobj(end)) //target the loc if it is a mob|obj
						end = end:loc

				if(args.len >= 4)
					lag = args[4]
				else
					lag = 1

				if(args.len >= 5)
					homing = args[5]
				else
					homing = 0
		else
			var/type = args[1]
			ref = new type

			start = args[2]

			if(isobj(start) || ismob(start))
				start = start:loc

			end = args[3]

			if(!homing) //if it isn't a homing projectile
				if(ismob(end) || isobj(end)) //target the loc if it is a mob|obj
					end = end:loc

			if(args.len >= 4)
				lag = args[4]
			else
				lag = 1

			if(args.len >= 5)
				homing = args[5]
			else
				homing = 0

		ref.loc = start

		spawn() s_walk_line(ref,end,lag)
		spawn() s_delwithinrange(ref,end)

// S_MISSILE SUPPORT FUNCTIONS
proc
	s_delwithinrange(ref,trg) //deletes the missile when it gets into the spot
		if(get_dist(ref,trg) == 0)
			//world << "Deleted!"
			del ref
			return
		if(!ref || !trg)
			return
		spawn(1) s_delwithinrange(ref,trg)

	s_check_dir(ref,trg,lag=1)
		if(!ref || !trg)
			return 0
		var/dir = get_dir(ref,trg)
		switch(dir)
			if(NORTH,SOUTH,EAST,WEST)
				spawn() s_move_along_dir(ref,trg,lag)
				return 1
			else
				return 0

	s_move_along_dir(ref,trg,lag=1,dir)
		if(!dir)
			dir = get_dir(ref,trg)

		if(!ref)
			return

		var/location
		var/is_a_ref = 0

		if(isturf(trg))
			location = trg
		else
			location = trg:loc

		if(ref:loc != location)
			if(is_a_ref && trg:loc != location)
				world << "Hey!"
				spawn() s_check_dir(ref,location,lag)
				return
			if(!ref || !trg)
				return
			ref:Move(get_step(ref,dir))
			spawn(lag) s_move_along_dir(ref,trg,lag,dir)


// STRAIGHT LINE FUNCTIONS
proc
	s_walk_line(ref,trg,lag=1)
		if(!s_check_dir(ref,trg,lag))
			spawn() s_send_missile(ref,trg,lag)

	s_send_missile(source, target, delay=1)
		// Thanks to Gazoot for the following implementation!

		if(!source || !target)
			return 0

		var/src_x
		var/src_y
		var/trg_x
		var/trg_y
		var/delta_x
		var/delta_y
		var/x_inc
		var/y_inc
		var/error
		var/i
		var/is_a_ref = 0

		var/turf/src_turf
		var/turf/trg_turf

		src_turf = source:loc
		src_x = src_turf.x
		src_y = src_turf.y

		if(!istype(target,/turf))
			trg_turf = target:loc
			is_a_ref = 1
		else
			trg_turf = target

		trg_x = trg_turf.x
		trg_y = trg_turf.y

		delta_x = trg_x - src_x
		delta_y = trg_y - src_y

		if(delta_x >= 0)
			x_inc = 1
		else
			x_inc = -1
			delta_x = -delta_x

		if(delta_y >= 0)
			y_inc = 1
		else
			y_inc = -1
			delta_y = -delta_y

		// Move the missile based on which delta is greater.
		if(delta_x > delta_y)
			for(i = 1, i <= delta_x, i++)
				if(!source || !target)
					return
				if(target:loc != trg_turf && is_a_ref)
					spawn() s_send_missile(source, target, delay)
					return
				error += delta_y
				if(error >= delta_x)
					error -= delta_x
					src_y += y_inc
				src_x += x_inc
				source:Move(locate(src_x,src_y,source:z))
				sleep(delay)

		else
			for(i = 1, i <= delta_y, i++)
				if(!source || !target)
					return
				if(target:loc != trg_turf && is_a_ref)
					spawn() s_send_missile(source, target, delay)
					return
				error += delta_x
				if(error > 0)
					error -= delta_y
					src_x += x_inc
				src_y += y_inc
				source:Move(locate(src_x,src_y,source:z))
				sleep(delay)
