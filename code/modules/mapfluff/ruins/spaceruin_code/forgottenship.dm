// forgottenship ruin
GLOBAL_VAR_INIT(fscpassword, generate_password())

/proc/generate_password()
	return "[pick(GLOB.phonetic_alphabet)] [rand(1000,9999)]"

/////////// forgottenship objects

/obj/machinery/door/password/voice/sfc
	name = "blast door"
	desc = "There's a microphone in it."
/obj/machinery/door/password/voice/sfc/Initialize(mapload)
	. = ..()
	password = "[GLOB.fscpassword]"

/obj/machinery/vending/medical/syndicate_access/cybersun
	name = "\improper CyberMed ++"
	desc = "An advanced vendor that dispenses medical drugs, both recreational and medicinal."
	products = list(/obj/item/reagent_containers/syringe = 4,
					/obj/item/healthanalyzer = 4,
					/obj/item/reagent_containers/pill/patch/libital = 5,
					/obj/item/reagent_containers/pill/patch/aiuri = 5,
					/obj/item/reagent_containers/cup/bottle/multiver = 1,
					/obj/item/reagent_containers/cup/bottle/syriniver = 1,
					/obj/item/reagent_containers/cup/bottle/epinephrine = 3,
					/obj/item/reagent_containers/cup/bottle/morphine = 3,
					/obj/item/reagent_containers/cup/bottle/potass_iodide = 1,
					/obj/item/reagent_containers/cup/bottle/salglu_solution = 3,
					/obj/item/reagent_containers/syringe/antiviral = 5,
					/obj/item/reagent_containers/medigel/libital = 2,
					/obj/item/reagent_containers/medigel/aiuri = 2,
					/obj/item/reagent_containers/medigel/sterilizine = 1)
	contraband = list(/obj/item/reagent_containers/cup/bottle/cold = 2,
					/obj/item/restraints/handcuffs = 4,
					/obj/item/storage/backpack/duffelbag/syndie/surgery = 1,
					/obj/item/storage/medkit/tactical = 1)
	premium = list(/obj/item/storage/pill_bottle/psicodine = 2,
					/obj/item/reagent_containers/hypospray/medipen = 3,
					/obj/item/reagent_containers/hypospray/medipen/atropine = 2,
					/obj/item/storage/medkit/regular = 3,
					/obj/item/storage/medkit/brute = 1,
					/obj/item/storage/medkit/fire = 1,
					/obj/item/storage/medkit/toxin = 1,
					/obj/item/storage/medkit/o2 = 1,
					/obj/item/storage/medkit/advanced = 1,
					/obj/item/defibrillator/loaded = 1,
					/obj/item/wallframe/defib_mount = 1,
					/obj/item/sensor_device = 2,
					/obj/item/pinpointer/crew = 2,
					/obj/item/shears = 1)

/////////// forgottenship lore

/obj/item/paper/fluff/ruins/forgottenship/password
	name = "faded pamphlet"

/obj/item/paper/fluff/ruins/forgottenship/password/Initialize(mapload)
	default_raw_text = "Welcome, esteemed Cybersun officer, to the SCSBC-12. Your mission assignment is to escort a shipment to the Gorlex Marauders carrying prototype equipment. Your vessel is equipped with 12 automated laser turrets and a series of advanced combat systems, alongside engines capable of long-term flight. The password to the onboard Vault is [GLOB.fscpassword]. Do not lose this pamphlet.</b><br><br>"
	icon_state = "paper_words"
	inhand_icon_state = "paper"
	return ..()

/obj/item/paper/fluff/ruins/forgottenship/powerissues
	name = "faded note"
	default_raw_text = "Remember to calibrate the SMES properly. 200 in, and 50 out should work."

/obj/item/paper/fluff/ruins/forgottenship/missionobj
	name = "mission objectives"
	default_raw_text = "Greetings, operatives. You have been assigned to the SCSBC-12 to escort a high-value shipment of Syndicate equipment to the Gorlex Marauders. Do not, under any circumstances, allow this equipment to be lost. Obey the orders of your vessel's captain at all times."

/////////// forgottenship items

/obj/item/disk/surgery/forgottenship
	name = "Advanced Surgery Disk"
	desc = "A disk that contains advanced surgery procedures, must be loaded into an Operating Console."
	surgeries = list(/datum/surgery/advanced/lobotomy, /datum/surgery/advanced/bioware/vein_threading, /datum/surgery/advanced/bioware/nerve_splicing)

/obj/structure/fluff/empty_sleeper/syndicate/captain
	icon_state = "sleeper_s-open"
	name = "rusty sleeper"
	desc = "A rusty syndicate stasis unit. It looks like it's shut down."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	deconstructible = FALSE

/obj/structure/fluff/empty_sleeper/syndicate/captain/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/gps, "Old Encrypted Signal")

/obj/item/storage/box/firingpins/syndicate
	name = "box of syndicate firing pins"
	desc = "A box full of special firing pins that only allow those equipped with a Syndicate implant to fire weapons equipped with them.."

/obj/item/storage/box/firingpins/syndicate/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/firing_pin/implant/pindicate(src)


/////////// forgottenship areas

/area/ruin/space/has_grav/syndicate_forgotten_ship
	name = "Syndicate Forgotten Ship"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambidanger.ogg', 'sound/ambience/ambidanger2.ogg', 'sound/ambience/ambigen9.ogg', 'sound/ambience/ambigen10.ogg')


//Special NT NPCs

/mob/living/simple_animal/hostile/nanotrasen/ranged/assault
	name = "Nanotrasen Assault Officer"
	desc = "A Nanotrasen assault officer. They are not happy to meet you."
	icon_state = "nanotrasenrangedassault"
	icon_living = "nanotrasenrangedassault"
	icon_dead = null
	icon_gib = "syndicate_gib"
	ranged = TRUE
	rapid = 4
	rapid_fire_delay = 1
	rapid_melee = 1
	retreat_distance = 2
	minimum_distance = 4
	casingtype = /obj/item/ammo_casing/c46x30mm
	projectilesound = 'sound/weapons/gun/general/heavy_shot_suppressed.ogg'
	loot = list(/obj/effect/mob_spawn/corpse/human/nanotrasenassaultsoldier)

/mob/living/simple_animal/hostile/nanotrasen/elite
	name = "Nanotrasen Elite Assault Officer"
	desc = "Pray for your life, syndicate. Run while you can."
	icon_state = "nanotrasen_ert"
	icon_living = "nanotrasen_ert"
	maxHealth = 150
	health = 150
	melee_damage_lower = 13
	melee_damage_upper = 18
	ranged = TRUE
	rapid = 3
	rapid_fire_delay = 5
	rapid_melee = 3
	retreat_distance = 0
	minimum_distance = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	projectiletype = /obj/projectile/beam/laser
	projectilesound = 'sound/weapons/laser.ogg'
	loot = list(/obj/effect/gibspawner/human)
	faction = list(ROLE_DEATHSQUAD)
