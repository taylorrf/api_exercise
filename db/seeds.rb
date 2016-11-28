# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

users = User.create([{ name: 'Tailor' }, { name: 'Arthur' }])

groupevent1 = GroupEvent.create(title: 'Christimas', user: users.first)
EventSaver.new({name: 'Declutter', description: 'declutter the house', location: 'House', start_date: '10-12-2016', end_date: '12-12-2016', group_event: groupevent1}).create
EventSaver.new({name: 'Buy stuffs', duration: 5, group_event: groupevent1}).create

groupevent2 = GroupEvent.create(title: 'Brazil Trip', user: users.second)
EventSaver.new({name: 'Planning time', duration: 10, group_event: groupevent2}).create
EventSaver.new({name: 'Passport', description: '<h3>sign papers</h3><br> in order to get the passport', location: 'SP', start_date: '10-11-2016', end_date: '11-11-2016', group_event: groupevent2}).create
EventSaver.new({name: 'Pack up as bags', location: 'House', duration: 5, group_event: groupevent2}).create
