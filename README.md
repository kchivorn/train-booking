# Train booking app
Sample app: https://morning-depths-20937.herokuapp.com/

# Rake Tasks
1- Generate train timetables and save into table departures
```
rake seed_timetable:run
```
2- Fetch users who bought more than three tickets
```
rake top_users:run
```
3- Fetch users who have ever bought a ticket from an IP address other than the one they used to sign up
```
rake different_ip:run
```
