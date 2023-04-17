# xkcdComics
A simple MVP iOS app for browsing XKCD comics 

## Screenshots
![Screenshot1](https://user-images.githubusercontent.com/77102454/232459989-3674f688-6d7c-4e05-b8d5-9633c81d04fa.png)
![Screenshot2](https://user-images.githubusercontent.com/77102454/232458871-03ece847-780a-4053-a9f6-5f45769aa51e.png)
![Screenshot4](https://user-images.githubusercontent.com/77102454/232458874-45b47cb2-2ee2-4055-8cd1-aeabbc21eb1e.png)

## Task
A client has just discovered xkcd comics and has asked for a comic viewer app with the following requirements
- Browse comics
- View details of each comic
- Search by for comic
- Get an explanation of each comic
- Favorite a comic to work offline
- Send a comic
- Get notifications when a new comic is posted
- Multiple form factors

Given the amount of work, the first round will be to create an MVP. I have chosen to create a simple iOS app using SwiftUI. I began the process by outlining the features I would include in this version and set up the outline of each view. I landed on the following outline and features: 

Browse View
- search bar
- comic preview (image & title)
- button to detail view
- navigation to view comics

Detail View
- title and image
- alt text description
- link to explanation (new view or popup)
- button to favorite (core data)
- button share

Favorites View
- thumbnail of favorite comics
- swipe to delete from list
