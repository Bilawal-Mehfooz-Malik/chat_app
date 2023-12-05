<img src="https://github.com/Bilawal-Mehfooz-Malik/chat_app/assets/151528480/e62ee364-e923-496e-9504-f6d4ef119b8e" alt="chat app" width="200"/><br>
# Chat App
<p>This is a simple chat application I created to learn about the functionality of chat apps. I utilized <strong>Flutter</strong> for the interface design and used <strong>Dart</strong> as the programming language. For authentication and data storage, I used <strong>Firebase</strong> database.</p>
 
<h2>Overview</h2>
<p>Here is the full video that shows the working of the app.</p>
[Watch the Video](https://github.com/Bilawal-Mehfooz-Malik/chat_app/blob/main/Untitled_Project_V1.mp4)
<p>Here is the link to the file for installation:</p>

<h3>Login and SignUp Screen:</h3>
<img src="https://github.com/Bilawal-Mehfooz-Malik/chat_app/assets/151528480/9e11eb20-d44c-4fbd-ad30-01624e765dfb" alt="login pic" width="200" >
<img src="https://github.com/Bilawal-Mehfooz-Malik/chat_app/assets/151528480/d690ae99-ed4c-4f1c-8dcb-8af70569c1f2" alt="sign up pic" width="200">
<p>I created this login & signup screen using <strong>Flutter</strong> and <strong>Dart</strong>. It features a simple authentication process that enables users to log in and sign up via email. The sign-up process also includes selecting an image from the gallery or camera for the profile photo. I used the Flutter image picker package for this functionality. The user's profile picture is initially stored in cloud storage, and then the user data is stored in Firebase Firestore with a unique ID. The design is clean and intuitive, with error handling for incorrect login details. I utilized Flutter's form validation and error handling features to ensure a smooth user experience. Overall, this login & signup screen provides a seamless authentication process for users while maintaining a modern and user-friendly interface.</p>

<h3>Chat Screen:</h3>
<img src="https://github.com/Bilawal-Mehfooz-Malik/chat_app/assets/151528480/a8c875b0-5de9-43d9-91ce-318627bf76a6" alt="Chats Screen" width="200" >
<p>The Chat Screen is only accessable to verified users to engage in conversations. Messages sent by users are securely stored in Firebase Firesote, along with critical details:

- User's unique ID
- Username
- Profile picture
- Timestamp of sending

#### Message Display:

Messages are intelligently displayed based on the sender:
- Messages sent by the current user are positioned on the right.
- Messages sent by others appear on the left, accompanied by their profile image.

#### Unique Message Representation:

For increased readability and user experience, messages sent multiple times showcase a distinctive design, as illustrated in our visual documentation.

#### Implementation Details:

To accomplish this interface:
- Three distinct constructors were devised to format messages.
- Message retrieval involves conditional handling to determine the appropriate constructor.
- Messages are presented in reverse order for smoother interaction.
</p>



To use that app you can check in the project and install the app-release.apk to use it.
