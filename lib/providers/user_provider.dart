import 'package:flutter/material.dart';
import 'package:heal_tether/model/UserModel.dart';
import 'package:heal_tether/services/api.dart';

// This class handles efficient state management using Provider.
// UserProvider is responsible for fetching, storing, and updating the user list in the UI.
class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<User> _users = []; // Stores the full list of users fetched from the API.
  bool _isLoading = false;
  String? _errorMessage;
  final TextEditingController searchController =
      TextEditingController(); // Controller for search functionality

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // This part of the logic is run on load of app
  UserProvider() {
    fetchUsers(); // Automatically fetch users on start of app.
    searchController.addListener(() {
      searchUsers(searchController.text);
    });
  }

  Future<void> fetchUsers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await _apiService.fetchUsers();
    } catch (e, stackTrace) {
      _errorMessage = "Failed to load users. Please try again.";
      debugPrint("Error fetching users: \$e\nStackTrace: \$stackTrace");
    }

    _isLoading = false;
    notifyListeners();
  }

  // Search functionality: filters users based on name input.
  void searchUsers(String query) {
    try {
      if (query.isEmpty) {
        fetchUsers(); // Reset to original list when search is cleared
      } else {
        //the search algorithm splits full name into first name and last name; then check if query matches first name or last name to query
        final lowerQuery = query.toLowerCase();
        _users = _users.where((user) {
          List<String> nameParts = user.name.trim().toLowerCase().split(" ");
          return nameParts.any((part) => part.startsWith(lowerQuery));
        }).toList();
      }
    } catch (e, stackTrace) {
      debugPrint("Error filtering users: \$e\nStackTrace:  $stackTrace");
      fetchUsers(); // Restore list in case of error
    }
    notifyListeners();
  }

  // Clear search field
  void clearSearch() {
    searchController.clear();
    fetchUsers();
  }

  // we Dispose the controllers and any other resources when not in use to allow for memory allocation:
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
