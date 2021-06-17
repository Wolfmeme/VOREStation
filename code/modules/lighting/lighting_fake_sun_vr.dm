/obj/effect/fake_sun
	name = "fake sun"
	desc = "Deletes itself, but first updates all the lighting on outdoor turfs."
	icon = 'icons/effects/effects_vr.dmi'
	icon_state = "fakesun"
	var/datum/light_source/sun/fake_sun

	var/list/possible_light_setups = list(
		list(
			"brightness" = 6.0,
			"color" = "#abfff7"
		),
		list(
			"brightness" = 4.0,
			"color" = "#F4EA55"
		),
		list(
			"brightness" = 2.5,
			"color" = "#EE9AC6"
		),
		list(
			"brightness" = 1.0,
			"color" = "#A3A291"
		),
		list(
			"brightness" = 1.0,
			"color" = "#F07AD8"
		),
		list(
			"brightness" = 1.0,
			"color" = "#61AEF3"
		),
		list(
			"brightness" = 0.7,
			"color" = "#f3932d"
		),
		list(
			"brightness" = 0.5,
			"color" = "#631E8A"
		),
		list(
			"brightness" = 0.3,
			"color" = "#253682"
		),
		list(
			"brightness" = 0.1,
			"color" = "#27024B"
		),
		list(
			"brightness" = 0.1,
			"color" = "#9AEAEE"
		),
		list(
			"brightness" = 0.1,
			"color" = "#B92B00"
		),
		list(
			"brightness" = 0,
			"color" = "#000000"
		)

	)

/obj/effect/fake_sun/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/fake_sun/LateInitialize()
	. = ..()
	var/list/choice = pick(possible_light_setups)
	if(choice["brightness"] <= LIGHTING_SOFT_THRESHOLD) // dark!
		return

	fake_sun = new
	fake_sun.light_color = choice["color"]
	fake_sun.light_power = choice["brightness"]

	var/list/zees = GetConnectedZlevels()
	var/min = z
	var/max = z
	for(var/zee in zees)
		if(zee < min)
			min = z
		if(zee > max)
			max = z

	var/list/all_turfs = block(locate(1, 1, min), locate(world.maxx, world.maxy, max))
	var/list/turfs_to_use = list()
	for(var/turf/T as anything in all_turfs)
		if(T.outdoors)
			turfs_to_use += T
	
	if(!turfs_to_use.len)
		warning("Fake sun placed on a level where it can't find any outdoor turfs to color at [x],[y],[z].")
		return

	fake_sun.update_corners(turfs_to_use)
