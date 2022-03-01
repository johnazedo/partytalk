![partytalk](https://user-images.githubusercontent.com/19677206/156198098-c93eb501-40b7-425b-bf11-13e9c98e3c06.png)

PartyTalk is a app to instant messages using gmail for authentication. The context in which the application will be used is events, with the aim that participants can interact without sharing any personal information. A differential that this app can offer is the possibility to create multiple accounts for a single user.

The PartyTalk MVP is going to use Firebase as a backend and Clean Architecture with MVVM for structure the project.

## Authentication

To acess our app, you must sign in with a google account and create a valid username. After that if you want to log off you must only click in your profile photo, it will open a drawer, than click in logout button.

Remember, if you re-enter with the same email, it isn't necessary choose other username.

<img src="https://user-images.githubusercontent.com/19677206/142435408-e99359bb-97ba-4ef5-9481-461a2362e955.png" width="250" height="531" /> <img src="https://user-images.githubusercontent.com/19677206/145689738-b257cd52-d47c-4572-ba23-922db84a4790.png"  width="250" height="531" /> <img src="https://user-images.githubusercontent.com/19677206/156177627-34df7c54-61e4-4c39-95b8-233172ccbd86.png"  width="250" height="531" />

## Chat

After authentication you will see chat list empty, don't worry, when someone sends you a message it will appear on your screen.

On messages screen you can send new messages to other person and read all history messages.

<img src="https://user-images.githubusercontent.com/19677206/156176830-e91a1fd7-474e-4b25-a894-99e6c719003d.png"  width="250" height="531" /> <img src="https://user-images.githubusercontent.com/19677206/156177266-f867cfc9-8ede-40ba-be80-27989e420e0a.png" width="250" height="531" /> <img src="https://user-images.githubusercontent.com/19677206/156177351-ffc14b76-9c46-48cd-814e-7262b7b14a59.png" width="250" height="531" />

# Events

On this screen you can see all the events you participate in. Clicking on an event will take you to the participants screen, this page lists all the participants of the selected meeting, here you can also filter them by name.

<img src="https://user-images.githubusercontent.com/19677206/156177909-522b9fde-b306-4710-9cc3-9331e652e3de.png"  width="250" height="531" /> <img src="https://user-images.githubusercontent.com/19677206/156182351-dd05d88d-7291-422d-b695-503854cad81c.png" width="250" height="531" /> <img src="https://user-images.githubusercontent.com/19677206/156178035-73e05ed6-70ac-40db-baf6-4cbb8b4e5ea6.png" width="250" height="531" />

## Use cases


ID | Descriçao
-|-
UC01| As a user, I want to create a account and sign in using Gmail address, as also, I want to have the possibility to log off of the application
UC02| As a user, I want to send messages to other users who are at same event as me
UC03| As a user, I want to search other users, using its username, that are at same event as me
UC04| As a user, I want to receive notification of messages sent to me
UC05| As a user, I want to receive notification of messages sent to me
UC06| As a user, I want to delete chats to manage this screen as I like it
UC07| As a user, I want to delete my account

