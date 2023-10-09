# Chat App

## Description

This is a Flutter chat application that integrates Firebase Authentication and Firestore for real-time messaging. The app allows users to sign in, send and receive messages, and view chat history. Firebase services are used for user authentication and data storage, providing a seamless and reliable chat experience.

## Features

- User authentication with Firebase Authentication.
- Real-time chat functionality using Firebase Firestore.
- Send and receive text messages.
- View chat history and previous messages.



## Installation

To run this application on your local machine, make sure you have Flutter installed. Then follow these steps:

1. Clone this repository to your local machine using:
   ```
   git clone https://github.com/your-username/chat-app.git
   ```

2. Navigate to the project directory:
   ```
   cd chat-app
   ```

3. Install the required dependencies:
   ```
   flutter pub get
   ```

4. Set up Firebase for the project:
   - Create a Firebase project on the [Firebase Console](https://console.firebase.google.com/).
   - Configure your project to use Firebase Authentication and Firestore.
   - Download the Firebase config file (`google-services.json` for Android or `GoogleService-Info.plist` for iOS) and place it in the project's `android/app` or `ios/Runner` directory respectively.

5. Run the app on an emulator or physical device:
   ```
   flutter run
   ```

## Dependencies

The main dependencies used in this project are:

- [firebase_core](https://pub.dev/packages/firebase_core) - For initializing Firebase.
- [firebase_auth](https://pub.dev/packages/firebase_auth) - For user authentication.
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) - For real-time database communication.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) - For state management.

For more details about other dependencies, check the `pubspec.yaml` file.

## Firebase Configuration

Ensure that you have properly configured your Firebase project with Authentication and Firestore as mentioned in the installation steps.

