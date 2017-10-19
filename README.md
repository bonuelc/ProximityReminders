# ProximityReminders

Treehouse iOS Techdegree Project #11

Do you ever forget to take your keys when you leave the house? Or how about reminding yourself to pick up milk when close to the grocery store? You are in luck, because you now have all the skills to develop such an app. Your challenge is to develop a proximity reminder app which can remind you when you are close to a location or leaving a location.

You will need to use Core Data to save the reminders, Core Location for geo-fencing, and notifications for the reminder. A geo-fence is a virtual perimeter around a geographic area. The app should closely resemble the stock Reminders app in iOS.

The core objective is to create an app to display a local notification when entering or leaving a location. You may hard-code this location to meet the basic requirement of the application. To exceed expectations you must allow the user to enter a location and choose whether the reminder should be set for leaving or entering the location. For example, one should be able to set a reminder to pick up milk when close to the grocery store.

Remember if you put enough effort into the user experience and design of the app then it can serve as a portfolio piece. Don't forget to architect the app with readable and maintainable code.

Be sure your app offers the following features, at a minimum:

- A basic master-detail view architecture
- Ability to create reminders
- Ability to edit and/or delete existing reminders
- Geo-fence a reminder to a location so that you can display an alert notification when leaving or entering the location

In order to gain a rating of exceeds expectations, please implement the following features:

- Ability to search for a location and associate it to a reminder just like the stock Reminder app.
- Once a location is associated to reminder then display it on a map.
- Display a geo-fence around the location by overlaying a circle around the location. The circle should have a diameter of 50 meters with the location in the center.

# Before you start

To prepare for this project you'll need to make sure you complete and understand these steps.

- Have a GitHub account and know how to create a new repository and upload files to it. As with the previous projects, you'll submit your finished working using GitHub.
- If you need a reminder on how to use GitHub and GitHub desktop to create a new repository check out the workshop 'Share Your Projects wIth GitHub Desktop' in the Project Resources.
- Read about Core Location and geofencing. Map out all the features and functions that you will need and how you will architect the app. The better you plan, the less time you will need to code. Less planning usually leads to rewriting your code because you did not think of corner cases or you forgot about some aspects of the functionality.

# Project Instructions

To complete this project, follow the instructions below. If you get stuck, ask a question in the community.

- You are free to submit this project in either Swift 2.3 or Swift 3. For Swift 2.3, if you are using Xcode 8, you will need to download and use the empty Swift 2.3 starter files template to start your project.
- The main screen is a table view with reminders. You can tap to add a new reminder.
- When adding a reminder the user can choose to be reminded of when leaving or entering the hard-coded location.
- When the user is about to leave or enter the location they must be prompted with a location notification of the reminder.

# Extra Credit

To get an "exceeds" rating, you can expand on the project in the following ways:

- App layout is exceptionally creative.
- Add the ability to add a location when creating the reminder (see the stock Reminder app for functionality).
- Add the ability to search and associate a location when creating the reminder.
- Add the ability to display the location on the map.
- Add the ability to display a geo-fenced circle around the location.
- Exceptional code quality.
