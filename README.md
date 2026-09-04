# PROG-PART1-PLANNING

RaceDay Event Management System
System Description

RaceDay is an event management system designed to manage running and racing events. The system allows users to register and log in, view available events, enrol in events, manage event information, record race results, and view information such as routes and weather conditions.

The system uses a database to store information about users, roles, events, registrations, results, categories, routes, and weather information. It also provides a REST API that allows authorised users to perform different operations depending on their role.

The system has two main user roles: Organiser and Participant.
1. Organiser
The Organiser is responsible for managing racing events. An organiser can:
1.Create new events.
2.Update existing events.
3.Delete events
4.Manage event categories.
5.View participants enrolled in an event.
6.Add and manage race results.
7.Add route information for events.
8.Add weather information for events.

The organiser has permission to perform administrative operations that are not available to participants.

2. Participant
The Participant is a user who takes part in racing events. A participant can:
1.Register an account.
2.Log in to the system.
3.View available events.
