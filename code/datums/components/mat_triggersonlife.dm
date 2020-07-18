/datum/component/holdertargeting/mat_triggersonlife
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS

/datum/component/holdertargeting/mat_triggersonlife/RegisterWithParent()
	var/obj/item/I = parent
	if (ismob(I.loc))
		var/mob/user = I.loc

		user.mob_flags |= MAT_TRIGGER_LIFE

/datum/component/holdertargeting/mat_triggersonlife/UnregisterFromParent()
	var/obj/item/I = parent

	if (ismob(I.loc))
		var/mob/user = I.loc
		user.mob_flags &= ~MAT_TRIGGER_LIFE
		for (var/thing in user)
			var/atom/movable/A = thing
			if (A.GetComponent(/datum/component/holdertargeting/mat_triggersonlife))
				user.mob_flags |= MAT_TRIGGER_LIFE

/datum/component/holdertargeting/mat_triggersonlife/on_pickup(datum/source, mob/user)
	. = ..()
	//var/obj/item/I = parent
	user.mob_flags |= MAT_TRIGGER_LIFE

/datum/component/holdertargeting/mat_triggersonlife/on_dropped(datum/source, mob/user)
	. = ..()
	var/obj/item/I = parent
	if (I.loc != user)
		user.mob_flags &= ~MAT_TRIGGER_LIFE
		for (var/thing in user)
			var/atom/movable/A = thing
			if (A.GetComponent(/datum/component/holdertargeting/mat_triggersonlife))
				user.mob_flags |= MAT_TRIGGER_LIFE
