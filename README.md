# Heal Tether User List Flutter App

## Overview
I developed this Flutter application to display a list of users fetched from an API. I implemented features like state management with Provider, error handling, a search function, and UI enhancements such as avatars and a loading indicator. I ensured the app follows best practices and maintains a clean, scalable architecture.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Running on Android and iOS](#running-on-android-and-ios)
- [Dependencies](#dependencies)
- [Running Tests](#running-tests)
- [Troubleshooting](#troubleshooting)
- [Contribution](#contribution)

## Features
I implemented the following features to ensure a smooth user experience:
- **User List Display**: I successfully fetched and displayed user details (name, email, and avatar) in a `ListView`.
- **State Management**: I used `Provider` for efficient state handling, ensuring reactivity and minimal UI rebuilds.
- **Three UI States**:
  - Loading: Displays a loading indicator while fetching data.
  - Data: Shows the list of users when the data is successfully fetched.
  - Error: Displays an error message if the fetch fails, ensuring graceful handling.
- **Search Functionality**: I implemented a robust search feature that filters users based on their name in real-time.
- **Pull-to-Refresh**: Users can refresh the list by pulling down, improving usability.
- **Environment Variable Usage**: I securely stored the API URL in a `.env` file to enhance security and prevent hardcoded URLs.

## Project Structure
```
/your_project_root
│-- lib/
│   │-- main.dart  # Entry point of the app
│   │-- providers/
│   │   │-- user_provider.dart  # Handles state management, API calls, and search functionality
│   │-- models/
│   │   │-- user_model.dart  # Defines the User data model
│   │-- screens/
│   │   │-- homescreen.dart  # UI implementation for displaying users
│   │   │-- user_list_item.dart  # UI for viewing detailed user information
│   │-- services/
│   │   │-- api_service.dart  # Handles API requests
│-- pubspec.yaml  # Dependencies
│-- .env  # Stores environment variables securely
│-- .gitignore  # Ensures sensitive files are not committed
│-- README.md  # Project documentation
```

## Setup Instructions
To run the project, follow the following steps:
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Techieflo/HealTether-Assessment.git
   ```
2. **Navigate to the Project Folder**:
   ```bash
   cd heal_tether
   ```
3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```
4. **Set Up Environment Variables**:
   - Create a `.env` file in the root directory.
   - Add the API URL inside `.env`:
     ```
     API_URL=https://jsonplaceholder.typicode.com
     ```
   - Ensure the `.env` file is not committed to version control by adding it to `.gitignore`.
5. **Run the App**:
   ```bash
   flutter run
   ```

## Running on Android and iOS

### **Running on Android**
1. **Ensure you have an Android emulator or a physical device connected**:
   ```bash
   flutter devices
   ```
   This command lists available devices. If none are available, start an emulator from Android Studio or connect a device.
2. **Run the app on Android**:
   ```bash
   flutter run
   ```

### **Running on iOS**
1. **Ensure you have Xcode installed (for macOS users)**:
   ```bash
   xcode-select --install
   ```
2. **Enable iOS permissions and dependencies**:
   ```bash
   cd ios
   pod install
   cd ..
   ```
3. **Run the app on an iOS simulator or device**:
   ```bash
   flutter run
   ```
4. **If using a physical iOS device, ensure code signing is configured**:
   - Open `ios/Runner.xcworkspace` in Xcode.
   - Navigate to the `Signing & Capabilities` tab.
   - Select your Apple ID or team.

## Dependencies
I used the following dependencies to build and optimize the app:
- `flutter`
- `provider`
- `http`
- `flutter_dotenv` (for secure environment variables)

## Running Tests
To run tests and verify functionality, execute:
```bash
flutter test
```

## Troubleshooting
### **Common Issues & Solutions**
- **App fails to fetch data:** Ensure your `.env` file is correctly configured and that the API is reachable. I handled API errors gracefully in `api_service.dart`.
- **Build issues:** Run `flutter clean` and then `flutter pub get` before retrying.
- **Search not working:** Ensure `UserProvider` properly filters names and that the search input updates the state correctly.
- **UI not updating:** Verify that `notifyListeners()` is called after state changes in `user_provider.dart`.
- **App crashes on API failure:** I wrapped API calls in try-catch blocks and provided user-friendly error messages.

## Contribution
Feel free to fork the repository, create a feature branch, and submit a pull request. Your contribution counts!

I built this project with performance, scalability, and best practices in mind. I ensured clean code and well-structured state management, making it easy to maintain and extend.

