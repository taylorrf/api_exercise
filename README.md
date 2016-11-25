# Whitespectre Exercise

## Examples to start using the API

#### Creating a new User
curl -d "user[name]=Tailor"  http://localhost:3000/users

#### Creating a Group Event
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"group_event":{"title":"Canada Trip","days_duration":"20", "user_id":"1"}}' http://localhost:3000/group_events

#### Listing all Group Events
curl http://localhost:3000/group_events

#### Creating a Event
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"event":{"name":"Passport","description":"renew the passport", "location":"São Paulo", "start_date":"10-10-2016", "end_date":"12-10-2016", "group_event_id": "1"}}' http://localhost:3000/events


### Ruby version
2.3.1

### Rails version
5.0.0.1

### Initial Setup
rake db:create

rake db:migrate

### Running the test suite
rake test

* Deployment instructions
