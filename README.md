# API Exercise

Here's the solution for the suggested exercise using Rails 5 to build a tiny API.

The main difference between this solution and the description provided is that I'm modeling `GroupEvent` here intended to be a `Group` with many events on it and an additional User entity was introduced to reflect what I think that should be something more close to a tiny but useful first version.

Here's how the models relationship looks like:

```bash
==============           ==============           ==============
|            |           |            |           |            |
|    User    |  1 => N   | GroupEvent |  1 => N   |    Event   |
|            |           |            |           |            |
==============           ==============           ==============
```

Additionally, instead of Rspec the tests was intentionally written using the Minitest (included by default on Rails 5) and all test can be found in the /test folder.

Questions or feedbacks about this solution are very welcome at any time.

Regards,
Tailor Fontela.


## Setup and general instructions

### Ruby version
2.4.0

### Rails version
5.0.0.1

### Initial Setup
bundle install

rake db:setup


### Running the test suite
rake test


## Examples to use the API

## Users

#### Creating a new User
```bash
  curl -d "user[name]=Lucas"  http://localhost:3000/users
```

#### Showing an User
```bash
  curl http://localhost:3000/users/#{user_id}
```

#### Listing all Users
curl http://localhost:3000/users/


## Group Event

#### Creating a Group Event
```bash
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"group_event":{"title":"Canada Trip","days_duration":"20", "user_id":"1"}}' http://localhost:3000/group_events
```

#### Listing all Group Events
```bash
curl http://localhost:3000/group_events
```

#### Showing a Group Events
```bash
  curl http://localhost:3000/group_events/#{group_event_id}
```

#### Updating a Group Events
```bash
curl -H "Accept: application/json" -H "Content-type: application/json" -d '{"group_event":{"title":"Brazil Trip"}}' -X PATCH http://localhost:3000/group_events/#{group_event_id}
```


## Event

#### Creating an Event
```bash
curl -H "Accept: application/json" -H "Content-type: application/json" -d ' {"event":{"name":"Passport","description":"renew the passport", "location":"São Paulo", "start_date":"10-10-2016", "end_date":"12-10-2016", "group_event_id": "1"}}' http://localhost:3000/events
```

#### Showing an Event
```bash
  curl http://localhost:3000/events/#{event_id}
```

#### Showing all Events
```bash
  curl http://localhost:3000/events/
```

#### Updating an Event
```bash
curl -H "Accept: application/json" -H "Content-type: application/json" -d '{"event":{"name":"bubble fish"}}' -X PATCH http://localhost:3000/events/#{event_id}
```

#### Deleting an Event
```bash
curl -X DELETE http://localhost:3000/events/#{event_id}
```
