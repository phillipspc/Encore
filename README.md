# Encore

[Heroku link][heroku]

[heroku]: #

## Minimum Viable Product
Encore is a clone of SongKick built on Rails. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [ ] Create accounts
- [ ] Create sessions (log in)
- [ ] See their Dashboard upon logging in
- [ ] Track artists, set a location/multiple locations
- [ ] Search for an artist
- [ ] See 'Your Concerts' page which displays upcoming shows
- [ ] Track an event, optionally mark it as "I'm going"
- [ ] See 'Your Plans' page which shows tracked events
- [ ] View an event page to see more info about that event (other attendees)
- [ ] View artist pages to see their upcoming shows
- [ ] View location pages to see all upcoming shows in that area
- [ ] Search Artists/Events from the home page without sign-in (guest user)


## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User authentication and User Dashboard (~2 days)
User authentication should be fairly straight-forward. Both the sign-up and
sign-in pages will be accessible from the home page, which will have little
other functionality at first. Sign-in will bring the user to their dashboard,
which will eventually display upcoming shows by default, but for now will serve
as a navigational hub to other areas of the site, primarily through a nav-bar at
the top of the page. The user will be able to specify their location(s) and see
this from the nav bar.

[Details][phase-one]

### Phase 2: Artist Show Page (~2 - 3 days)
From the artist page, a user can choose to 'track' an artist. The artist will
show up in the user's 'tracked artists' page. A core facet of the site is being
able to see an artists' upcoming events. I've applied for the SongKick API, and
I'm hoping I can use this to populate event info for a limited number of bands
(maybe 100 or so). Otherwise I will use a database seed to add this information.
The artist page will display their upcoming events as well as allow a user to
"track" an event, which will add that event to the 'your plans' section of site.

[Details][phase-two]

### Phase 3: Event Show Page (~1 - 2 days)
The Event show page will display all relevant info regarding the event, such as
the line-up of artists for the evening, name and location of the venue, start
times, and attendance. A side bar on the right side of the page will show users
'going to' or 'interested in' the event, depending on what they've selected.


[Details][phase-three]

### Phase 4: Connecting Data Points (~2 - 3 days)
Once a user can track artists and events, I can start filling out the other
sections of the site. 'Your Concerts' will display all upcoming events matching
tracked artists in the user's location(s). 'Your Plans' will be a list of events
the user has tracked and/or tagged as attending. The dashboard can now show a mix
of this info by default, i.e. the next upcoming concert you're tracking, and
a handful of upcoming events from tracked artists. Location pages should display
all upcoming shows for that location. If not already implemented, all buttons
should be dynamic, 'toggle-style' buttons. Will likely create a JQuery plugin for
this.

[Details][phase-four]


### Bonus Features (TBD)
- [ ] Users can add 'live reviews' which show up on the artist's page
- [ ] Users can "friend" other users
- [ ] "Friends' plans" page displays upcoming shows of friends
- [ ] Implement a dynamic/toggleable sign-up/sign-in view with backbone

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
