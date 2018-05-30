races_list = [

]

races_list.each {|spec| new_race = Race.create(spec)}

klasses_list = [

]

klasses_list.each {|spec| new_klass = Klass.create(spec)}