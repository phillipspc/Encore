# Encore
[Live link](http://www.encore.audio)

## Welcome!
Encore is a near-faithful clone of [SongKick](http://www.songkick.com), and my capstone project here at [App Academy](http://www.appacademy.io/).
Encore lets you keep track of your favorite artists and see when and where they are playing live.

## Design Philosophy
Encore is built as a single-page web app, utilizing Backbone.js to render views within the page without refreshing. Database requests happen quickly and asynchronously using JSON to pass information from server to client.

## Using Encore
Encore supports full user creation and authentication; alternatively you can also sign up via Twitter. To quickly get in and experience the site, sign in as a guest user, which is randomly populated with some data to get you started.

Once signed in, you'll see some recommended concerts based on artists you're following and your specified location (New York by default). By adding new artists and locations, this list of recommended concerts will grow. You can also track concerts you're interested in to easily refer back to them later (these show up under 'your plans').

Check out an artist page to see their bio and upcoming concerts. View a concert page to see and/or upload photos from the show.

The database is seeded with the top 1000 most popular (as of July 2015 via Echo Nest) artists and top 50 US cities by population. Searching for artists or locales will pull from these lists accordingly. Concert info is randomly generated.

## Tech Used

### Languages
- Ruby
- JavaScript
- HTML
- CSS

### Frameworks
- Ruby on Rails
- Backbone.js

### Additional libraries/gems
- JQuery/AJAX
- Date.js
- Figaro
- AWS SDK
- BCrypt
- Omniauth Twitter

### External API's
- Echo Nest (artist rankings and bio's)
- Spotify (artist images)

## Todo's
- Infinite scrolling for long lists (location pages)
- See who else is tracking a concert from concert show page
- Aggregate all uploaded photos for an artist under their show page



## Questions
Send Encore feedback or questions to:
[phillipspc@gmail.com](mailto:phillipspc@gmail.com)
