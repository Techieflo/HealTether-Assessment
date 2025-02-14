import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:heal_tether/model/UserModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Fetch base URL from .env file for best practises and avoiding endpoints being exposed in logic
  final String baseUrl = dotenv.env['BASE_URL'] ?? "";

  Future<List<User>> fetchUsers() async {
    try {
      // Construct API URL dusing the required GET method. so we add the route for users after the base url to access the required userss endpoint

      final response = await http.get(Uri.parse('$baseUrl/users'));

      // Check if response is successful
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        //returns a new user object using the model classs specified in the usermodel class.
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        //on any error, we throw an exception that an error occured
        throw Exception("Failed to load users");
      }
      //on any error case we catch the error and we log in in the $e object and throow it as a string
    } catch (e) {
      throw Exception("Error fetching users: $e");
    }
  }
}
