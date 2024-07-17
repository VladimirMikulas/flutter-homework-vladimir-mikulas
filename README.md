# flutter_homework

## Tasks

Your task for this take-home project is to implement a simple Flutter application
that consumes a Rick and Morty API.
Note that these tasks should take you approximately 3-5 hours.

Your code should show your ability to produce readable and maintainable code following
good developer practises and Flutter standards.

The app might contain bugs,
inappropriately handled things;
so if you find any, fix them.

You can change every piece of code if it suits you,
as long as the tasks are covered.

### Main route

This route is just an entry point to navigate a user to the characters' route.

### Characters route

On this route, a user should be able to view Rick and Morty characters.
The data should be fetched from the https://rickandmortyapi.com/documentation API.
Note that we use mostly REST API, but you are not limited to it.

- [ ] Check the API and connect the app to it. Consider using a state management library.
- [ ] For each character, display:
  - a name
  - a status, as its background color. Green for when alive. Red for when dead. Gray for when unknown.
  - a gender, as an icon.
  - a name of the last known location
- [ ] On clicking on the character item, open its detail route.
- [ ] Add an animation/style to the item when a user holds/taps/clicks the item.
- [ ] Add a filter for all/alive/dead statuses.

### Detail route

The detail route should contain additional information about a character a user selects.

- [ ] Display details of selected character:
  - an image
  - a name
  - species and type
  - a name of the last known location
  - list of episodes
- [ ] Bonus: Display a name, type, and dimension of the last known location
- [ ] Bonus: Display a name, code, and release date of each episode where the character appeared.

## Your Notes

Here you can add your notes of ideas, a tradeoff of your solutions, or found bugs:

- ...
