/obj/item/rig_module/self_destruct

	name = "self-destruct module"
	desc = "Oh my God, a bomb!"
	icon_state = "deadman"
	usable = 1
	active = 1
	permanent = 1
	var/datum/effect_system/smoke_spread/bad/smoke
	var/smoke_strength = 8

	engage_string = "Detonate"

	interface_name = "dead man's switch"
	interface_desc = "An integrated self-destruct module. When the wearer dies, they vanish in smoke. Do not press this button."

<<<<<<< HEAD
/obj/item/rig_module/self_destruct/New()
	..()
	src.smoke = new /datum/effect/effect/system/smoke_spread/bad()
=======
/obj/item/rig_module/self_destruct/Initialize()
	. = ..()
	src.smoke = new /datum/effect_system/smoke_spread/bad()
>>>>>>> 0232be9531b... Repaths obj/effect/effect, datum/effect/effect [MDB_IGNORE] (#8312)
	src.smoke.attach(src)

/obj/item/rig_module/self_destruct/Destroy()
	qdel(smoke)
	smoke = null
	return ..()

/obj/item/rig_module/self_destruct/activate()
	return

/obj/item/rig_module/self_destruct/deactivate()
	return

/obj/item/rig_module/self_destruct/process()

	// Not being worn, leave it alone.
	if(!holder || !holder.wearer || !holder.wearer.wear_suit == holder)
		return 0

	//OH SHIT.
	if(holder.wearer.stat == 2)
		engage(1)

/obj/item/rig_module/self_destruct/engage(var/skip_check)
	if(!skip_check && usr && tgui_alert(usr, "Are you sure you want to push that button?", "Self-destruct", list("No", "Yes")) == "No")
		return
	if(holder && holder.wearer)
		smoke.set_up(10, 0, holder.loc)
		for(var/i = 1 to smoke_strength)
			smoke.start(272727)
		holder.wearer.ash()
