races_list = [
	{name: 'Human', language: 'Common', bonus_1: 'One Additional Feat', bonus_2: 'Skilled', abs_1: '+1 to any Ability', abs_2: '+1 to any Ability'},
	{name: 'Dwarf', language: 'Dwarvish', bonus_1: 'Stonetouch', bonus_2: 'Stout', abs_1: '+2 to Constitution', abs_2: '-1 Dexterity'},
	{name: 'Elf', language: 'Elvish', bonus_1: 'Fleetfoot', bonus_2: 'Feymind', abs_1: '+1 to Dexterity and Intelligence', abs_2: '-2 Constitution'},
	{name: 'Gnome', language: 'Gnomish', bonus_1: 'Crazy', bonus_2: 'Bonkers', abs_1: '+1 to Everything', abs_2: '-2 to two Random Abilities'}
]

races_list.each {|spec| new_race = Race.create(spec)}

klasses_list = [

]

klasses_list.each {|spec| new_klass = Klass.create(spec)}