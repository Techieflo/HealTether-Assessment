
#  heal_tether User List Flutter App

## Overview
I developed this Flutter application to display a list of users fetched from an API. I implemented features like state management with Provider, error handling, a search function, and UI enhancements such as avatars and a loading indicator. I ensured the app follows best practices and maintains a clean, scalable architecture.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
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
   git clone https://github.com/yourusername/user-list-app.git
   ```
2. **Navigate to the Project Folder**:
   ```bash
   cd user-list-app
   ```
3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```
4. **Set Up Environment Variables**:
   - I stored the API URL in a `.env` file to enhance security.
   - Create a `.env` file in the root directory.
   - Add the API URL inside `.env`:
     ```
     API_URL=[endpoint](https://jsonplaceholder.typicode.com)
     ```
   - Ensure the `.env` file is not committed to version control by adding it to `.gitignore`.
5. **Run the App**:
   ```bash
   flutter run
   ```

## Dependencies
I used the following dependencies to build and optimize the app:
- `flutter`
- `provider`
- `http`
- `flutter_dotenv` (for secure environment variables)

## Running Tests
To run tests and verify functionality, execute:
```bash
flutter run
```

## Troubleshooting
![Settings Icon]data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKMAAACUCAMAAADIzWmnAAAAYFBMVEUhISH///8AAAAdHR0aGhoVFRUNDQ0HBwfm5ub5+fkRERH09PSrq6s7Ozs1NTUYGBjU1NSWlpZ0dHTIyMgvLy9mZma6urpZWVlfX19KSkqEhISKiopCQkLg4OBubm6kpKShH+/oAAAFRElEQVR4nNVc68KyIAymeVY8ZqYd7P7v8tOs7zVFZWjJnt8Fj4yNsY2xgzKSyGCyMKJEfSKm/tfCkqbImFXswvEBCI7w2IOjd3EwHK/eDhyD0kdw9MtgB44uk1eZRmmYuwPHO2Y7NsK+78CxQHJUV2x1jhckx8sOHG8xiqN124Ejbhmbhfw9RxfNUVmxlTkiVWaN0ihzTDGnTAsn/TnHGuNRtLDqbTm6i3snOOPUmrH4vHgaTkwr4shvUXR+zPsAGOexw5IL6T3OUXTjUhy9GgzDiAFOxczxhXLMOsy5Z/fiBBA380I9Xpsxx+w9uw3hhU/IJ8hNNEcznxjM45cQ7PeXZMsc094CmbafZ4lI6Bl+GYXTNwSTLPft3hfDSP+HHPnApBgOROlxuACpCkXB9MExjcAZ7GxnuCcHHBM2lqEJfpl+7PcLXtCvoT4ciyQtfRDMxwbK9ckxMMUWxbLtkLve69tzrPn+g5O/ZOK5PLRtsY2NzWCaY1Dawj89/whQp7zg10jw6fIwIbo2o6R1o8aTP7JPwSTHx/wC2dBiDcOOZYvpxWjhPKY4Jmqa8A1AIuYYRNjj7XuIo0DI8aquCtvDvoo4oh3C76Lnbv7n6IVYZ+u7sEJvxFHx6Pge/g6lN8dkrUnZHmbyydHL5g3WHrAz74PjUTdJt4DjB8cbJgb2K/i3PkfN7M4bL/vz5Ojd9NOYFubN+8+R6yjpFj5/cwxO2nJ8OmlMV6Xu8FTtlmOl6zI2C1l1HNERsF+ijbY1HDU8Yv5gZy1HN8RGRX4JI3QbjsMbtWZobtssqHUWdSPsOmCu3hQbki7jOmt1C+AMlfVbgOlAB2fD898qGTrWOQHDB8izlBfHgqdZDuBvNXDEzptctSwnKot+ACQoysjZZujzJvvRgOoxDmW7jwo2WMtmP7rVavvoABcH210Oq1fAqdzmnCnXjWNYovDsG5m1bimhbM+ZQ1CvIRkv5K+KmRieBMU66Hwz76q+b3xzqSgmMZWtm9FVYXR3Ls4UVdCvltP7d1X/1GJdZPx1dy0ipXFiR6YC4e4oiduPXrvoHUtxQwX1NkCu+ilR2UtO+DYWf3GzE15zfFHmTASFiyecxnGzVnOwFEvZuiIP7RX0a5b68XBu4/YNyJcVBbjvj+2+hD7yCkeU5oyTZjNAhTf96Nj/72cOyWXyQ5k5pqrojkiCwqCmapCLm8siDYCsPZCvbbCHpWnDnGYgL5TjAYOj7LCQDrf5OH8tSdKsUBQPh0pO2IJdLqhV4FLnIlzH/5yFnGkTmVxRPYVU4AJwopaMfNkiP0/EUcqYIYzj2lGFtTMSlQiGg6R4OAzz/SKKQndZyFFCLBZWZRqlWd7n4g0k5HhfdvDtE5rjaXGbG5bwWBBydMNFO+HMXWLEyBatuBkK725kOVKQNQWd+Y7tkbgwyNseCjacwFm4q09hSfkU+vtmBHxcAncFAncuAndX/WMABGIpBGJSBGJ7BGKk+seaCcTsv537WJORe+U+COSQNsjFwUwubn2ir9omx/7tnCaF3PDmOfZi+xw7hVoFCjUfFGpnKNQgUajlIlETR6G2kESNJoVaVxI1wxRqrynUsJN4C0DhTQWJtyl6qvbgjQ+Ft1IU3pyReLtH4g2kbvZH9JZUsze5jvBNLom3zVq9Ee8H7am9tW+cNImeBfm+PQso9H4g0UODRC8SEj1dhr1xJjJZ+/bGIdFjiEKvphb697ySwu69wyRAoQcbhV52FHoCUuitSKJHJYVenxR6plLoPUuhhy+FXsgUekpT6M1Nosf5z3rF/wO0C10lkyGnIgAAAABJRU5ErkJggg==) **Common Issues & Solutions**
- **App fails to fetch data:** Ensure your `.env` file is correctly configured and that the API is reachable. I handled API errors gracefully in `api_service.dart`.
- **Build issues:** Run `flutter clean` and then `flutter pub get` before retrying.
- **Search not working:** I made sure `UserProvider` properly filters names, but ensure search input updates the state correctly.
- **UI not updating:** Verify that `notifyListeners()` is called after state changes in `user_provider.dart`.
- **App crashes on API failure:** I wrapped API calls in try-catch blocks and provided user-friendly error messages.

## Contribution
Feel free to fork the repository, create a feature branch, and submit a pull request. Your contribution counts!



I built this project with performance, scalability, and best practices in mind. I ensured clean code and well-structured state management, making it easy to maintain and extend. Happy Coding! 🚀

