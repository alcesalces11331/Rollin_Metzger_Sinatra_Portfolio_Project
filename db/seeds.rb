races_list = [
	{name: 'Human', language: 'Common', bonus_1: 'One Additional Feat', bonus_2: 'Skilled', abs_1: '+1 to any Ability', abs_2: '+1 to any Ability'},
	{name: 'Dwarf', language: 'Dwarvish', bonus_1: 'Stonetouch', bonus_2: 'Stout', abs_1: '+2 to Constitution', abs_2: '-1 Dexterity'},
	{name: 'Elf', language: 'Elvish', bonus_1: 'Fleetfoot', bonus_2: 'Feymind', abs_1: '+1 to Dexterity and Intelligence', abs_2: '-2 Constitution'},
	{name: 'Gnome', language: 'Gnomish', bonus_1: 'Crazy', bonus_2: 'Bonkers', abs_1: '+1 to Everything', abs_2: '-2 to two Random Abilities'}
]

races_list.each {|spec| new_race = Race.create(spec)}

klasses_list = [
	{name: 'Barbarian', hitdie: 'd12', proficencies: 'all simple and martial weapons', ability: 'Rage'},
	{name: 'Bard', hitdie: 'd8', proficencies: 'instruments of war and song', ability: 'Chant'},
	{name: 'Cleric', hitdie: 'd8', proficencies: 'all simple weapons', ability: 'Divine Favor'},
	{name: 'Druid', hitdie: 'd8', proficencies: 'quarterstaff, club, wood', ability: 'Shapeshift'},
	{name: 'Fighter', hitdie: 'd10', proficencies: 'all simple and martial weapons', ability: 'Talented'},
	{name: 'Monk', hitdie: 'd8', proficencies: 'monk weapons', ability: 'Ki'},
	{name: 'Paladin', hitdie: 'd10', proficencies: 'all weapons', ability: 'Lay on Hands'},
	{name: 'Ranger', hitdie: 'd8', proficencies: 'bows and swords', ability: 'Know the Land'},
	{name: 'Rogue', hitdie: 'd6', proficencies: 'daggers', ability: 'Sneak Attack'},
	{name: 'Sorcerer', hitdie: 'd6', proficencies: 'daggers and quarterstaff', ability: 'Innate Magic'},
	{name: 'Wizard', hitdie: 'd6', proficencies: 'quarterstaff', ability: 'Tome of Knowledge'}
]

klasses_list.each {|spec| new_klass = Klass.create(spec)}