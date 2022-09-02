
/datum/artifact_effect/gaia
	name = "gaia"
	effect_type = EFFECT_ORGANIC
	effect_color = "#8cd448"
	var/list/my_glitterflies = list()

<<<<<<< HEAD
/datum/artifact_effect/gaia/proc/age_plantlife(var/obj/machinery/portable_atmospherics/hydroponics/Tray = null)
	if(istype(Tray) && Tray.seed)
		Tray.health += rand(1,3) * HYDRO_SPEED_MULTIPLIER
		Tray.age += 1

		if(Tray.health > 0 && Tray.dead)
			Tray.dead = FALSE

		Tray.check_health()

		if(!Tray.dead)
			if((Tray.age > Tray.seed.get_trait(TRAIT_MATURATION)) && \
			 ((Tray.age - Tray.lastproduce) > Tray.seed.get_trait(TRAIT_PRODUCTION)) && \
			 (!Tray.harvest && !Tray.dead))
				Tray.harvest = 1
				Tray.lastproduce = Tray.age

	else if(istype(Tray, /obj/effect/plant))
		var/obj/effect/plant/P = Tray
		Tray = P.plant
		if(Tray)
			age_plantlife(Tray)
			P.update_icon()

/datum/artifact_effect/gaia/DoEffectTouch(var/mob/user)
=======

/datum/artifact_effect/uncommon/gaia/DoEffectTouch(mob/living/user)
>>>>>>> 37cfcfc45fa... Merge pull request #8685 from Spookerton/spkrtn/cng/tweak-effect-aura
	var/atom/holder = get_master_holder()
	to_chat(user, "<span class='alien'>You feel the presence of something long forgotten.</span>")
	for (var/obj/machinery/portable_atmospherics/hydroponics/Tray in view(world.view,get_turf(holder)))
		age_plantlife(Tray)
		if (prob(30))
			var/mob/living/simple_mob/animal/sif/glitterfly/G = new(get_turf(Tray))
			my_glitterflies |= G
			G.ai_holder.returns_home = TRUE
	for (var/obj/effect/plant/P in view(world.view,get_turf(holder)))
		age_plantlife(P)

<<<<<<< HEAD
/datum/artifact_effect/gaia/DoEffectAura()
=======

/datum/artifact_effect/uncommon/gaia/DoEffectAura()
>>>>>>> 37cfcfc45fa... Merge pull request #8685 from Spookerton/spkrtn/cng/tweak-effect-aura
	var/atom/holder = get_master_holder()
	for (var/obj/machinery/portable_atmospherics/hydroponics/Tray in view(effectrange,holder))
		age_plantlife(Tray)
		if (prob(2))
			var/mob/living/simple_mob/animal/sif/glitterfly/G = new(get_turf(Tray))
			my_glitterflies |= G
			G.ai_holder.returns_home = TRUE
	for (var/obj/effect/plant/P in view(effectrange,get_turf(holder)))
		age_plantlife(P)

<<<<<<< HEAD
/datum/artifact_effect/gaia/DoEffectPulse()
=======

/datum/artifact_effect/uncommon/gaia/DoEffectPulse()
>>>>>>> 37cfcfc45fa... Merge pull request #8685 from Spookerton/spkrtn/cng/tweak-effect-aura
	var/atom/holder = get_master_holder()
	for (var/obj/machinery/portable_atmospherics/hydroponics/Tray in view(effectrange,holder))
		age_plantlife(Tray)
		if (prob(10))
			var/mob/living/simple_mob/animal/sif/glitterfly/G = new(get_turf(Tray))
			my_glitterflies |= G
			G.ai_holder.returns_home = TRUE
	for (var/obj/effect/plant/P in view(effectrange,get_turf(holder)))
		age_plantlife(P)

<<<<<<< HEAD
/datum/artifact_effect/gaia/process()
=======

/datum/artifact_effect/uncommon/gaia/process()
>>>>>>> 37cfcfc45fa... Merge pull request #8685 from Spookerton/spkrtn/cng/tweak-effect-aura
	var/atom/holder = get_master_holder()
	..()
	listclearnulls(my_glitterflies)
	for (var/mob/living/L in my_glitterflies)
		if (L.stat == DEAD)
			my_glitterflies -= L
		L.ai_holder.home_turf = get_turf(holder)


/datum/artifact_effect/uncommon/gaia/proc/age_plantlife(obj/machinery/portable_atmospherics/hydroponics/Tray)
	if (istype(Tray) && Tray.seed)
		Tray.health += rand(1,3) * HYDRO_SPEED_MULTIPLIER
		Tray.age += 1
		if (Tray.health > 0 && Tray.dead)
			Tray.dead = FALSE
		Tray.check_health()
		if (!Tray.dead)
			if ((Tray.age > Tray.seed.get_trait(TRAIT_MATURATION)) && \
			 ((Tray.age - Tray.lastproduce) > Tray.seed.get_trait(TRAIT_PRODUCTION)) && \
			 (!Tray.harvest && !Tray.dead))
				Tray.harvest = 1
				Tray.lastproduce = Tray.age
	else if (istype(Tray, /obj/effect/plant))
		var/obj/effect/plant/P = Tray
		Tray = P.plant
		if (Tray)
			age_plantlife(Tray)
			P.update_icon()
