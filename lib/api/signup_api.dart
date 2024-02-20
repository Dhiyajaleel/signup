import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpApi {
  static Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    const String apiUrl =
        'https://batch02-team-a-ecommerce-8b5f7a0ebab4.herokuapp.com/user/signup';
    final bbody = {
      'Name': name,
      'Email': email,
      'Password': password,
      'Con_Password': password,
      // Add other required fields
    };
    print('Response status code: ${jsonEncode(bbody)}');

    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(bbody));

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Handle successful registration
        print('User registered successfully');
        // Navigate to another screen or perform any other actions
      } else {
        // Handle registration failure
        print('Failed to register user. Status code: ${response.statusCode}');
        // Display an error message or take appropriate action
      }
    } catch (e) {
      // Handle exceptions
      print('Error during registration: $e');
      // Display an error message or take appropriate action
    }
  }
}
