# Whitespectre Exercise

## Setup and general instructions

### Ruby version
2.3.1

### Rails version
5.0.0.1

### Initial Setup
bundle install

rake db:create

rake db:migrate


### Running the test suite
rake test



## Examples to start using the API

#### Creating a new User
```bash
  curl -d "user[name]=Tailor"  http://localhost:3000/users
```

#### Creating a Group Event
```bash
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"group_event":{"title":"Canada Trip","days_duration":"20", "user_id":"1"}}' http://localhost:3000/group_events
```

#### Listing all Group Events
```bash
curl http://localhost:3000/group_events
```

#### Creating a Event
```bash
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"event":{"name":"Passport","description":"renew the passport", "location":"São Paulo", "start_date":"10-10-2016", "end_date":"12-10-2016", "group_event_id": "1"}}' http://localhost:3000/events
```

Background:
- [x] A group event will be created by an user.
- [x] The group event should run for a whole number of days e.g.. 30 or 60.
- [x] There should be attributes to set and update the start, end
- [ ] Duration of the event (and calculate the other value).
- [x] The event also has a name, description (which supports formatting) and location.
- [ ] The event should be draft or published.
- [ ] To publish all of the fields are required, it can be saved with only a subset of fields before it’s published.
- [x] When the event is deleted/remove it should be kept in the database and marked as such.

Deliverable:
Write an AR model, spec and migration for a GroupEvent that would meet the needs of the description above. Then write the api controller and spec to support JSON request/responses to manage these GroupEvents. For the purposes of this exercise, ignore auth. Please provide your solution as a rails app called exercise_YYMMDD_yourname, sent as a zip file.
