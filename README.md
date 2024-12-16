# i_farmer_programming_task

The Repository contains a flutter mobile app implementing oMDB Apis for a programing task by iFarmer.

## Task Description

What i need to do in this application

#### Home screen with following rails:

- Carousel with 5 movie banners 
- Rail 1: Batman movie 
  - Apply title = Batman in filter of omdb 
  - Portrait
- Rail 2: Latest movies 
  - Apply year = 2022 in filter of omdb 
  - Portrait


#### Listing page with pagination

- You can choose any filter on OMDB to show listing page with load more/pagination option


#### Content details page

- Any movie from homepage or listing page is clickable and will take user to content details page 
- Video player which can play the content. You can use following streaming URL for player:

````http
https://gist.github.com/SeunghoonBaek/f35e0fd3db80bf55c2707cae5d0f7184
````
Note: If you want to use your own HLS or DASH playback URL, feel free to do so.

- Should be able to play the video content repeatedly i.e. stop the video and re-open it to play it again from the previously played location.
- Details of the movie 
  - Title 
  - Description 
  - Other fields available from omdb


## Project Structure

````
lib
    |- main.dart
    |- src
        |- core // Will contain app configuration
        |- data // Will contain data source and repository 
        |- domain // All the business logic
        |- presentation // UI and state management
````