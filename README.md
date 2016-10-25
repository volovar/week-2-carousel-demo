## Carousel

The purpose of this homework is to leverage views, view properties, and events to create a high fidelity prototype that is difficult to distinguish from a production app. We're going to use the techniques from this week to implement the Carousel app from the signed out state to the basic signed in state.

Time spent: `10 hours`

### Features

### Required User Stories

1. Landing Screen
  - [X] Static photo tiles on the initial screen.
  - [X] User can scroll to reveal sign in buttons.
1. Sign In
  - [X] Tapping on email/password reveals the keyboard and shifts the scroll view and Sign In button up.
  - Upon tapping the Sign In button.
     - [X] If the username or password fields are empty, user sees an error alert.
     - [X] If credentials are incorrect, user sees a loading indicator for 2 seconds followed by an error alert.
     - [X] If the credentials are correct, user sees a loading indicator for 2 seconds followed by a transition to the Sign In screens.
1. Tutorial Screens
  - [X] User can page between the screens.
1. Image Timeline
  - [X] Display a scrollable view of images.
  - [X] User can tap on the conversations button to see the conversations screen (push).
  - [X] User can tap on the profile image to see the settings view (modal from below).
1. Conversations
  - [X] User can dismiss the conversations screen.
1. Settings
  - [X] User can dismiss the settings screen.
  - [X] User can log out.

### Optional User Stories

1. Landing Screen:  
  - [X] Photo tiles move, scale and rotate while user scrolls.
1. Sign In:
  - [X] User can scroll down to dismiss keyboard.
  - [X] User sees the form scale up and fade it in as the screen appears.
1. Sign up / Create a Dropbox:
  - [X] Tapping in the form reveals the keyboard and scrolls the form and button up so they remain visible.
  - [X] Tapping the "Agree to Terms" checkbox selects the checkbox.
  - [X] Tapping on "Terms" shows a web view with the terms.
  - [X] User is taken to the tutorial screens upon tapping the "Create a Dropbox" button.
1. Tutorial Screens:
  - [X] User can page between the screens with updated dots.
  - [ ] Upon reaching the 4th page, the page indicator dots are hidden and "Take Carousel for a Spin" button is shown.
1. Learn more about Carousel:
  - [X] Show the "Learn more about Carousel" button in the photo timeline.
  - [X] Tap the X to dismiss the banner.
  - [X] Track the 3 events:
     - (1) View a photo full screen, (2) Swipe left and right and (3) Share a photo  - Upon completion of the events, mark them green.
  - [ ] When all events are completed, dismiss the banner.
1. Settings
  - [X] User is presented with an action sheet with actions to cancel or logout.


#### The following **additional** features are implemented:

- [X] Implemented working navigation controllers instead of images
- [X] Customized settings / profile images to fit with login details
- [X] Used a Page View Controller for tutorial screens instead of a scroll view

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Naming conventions for methods; in same vein, code organization in view controller classes
2. Navigation bars and their appearance and animation

### Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Main challenges this time were running into errors and debugging them. Mostly simple stuff too, just things I haven't seen before. Customizing navigation bars proved challenging as well. There are certain ways Apple wants elements to be implemented and it's hard to work around them without creating something completely custom.

