import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:reservation_app/view/auth/AuthController.dart';
import 'package:reservation_app/view/bottom_bar.dart';
import 'package:reservation_app/view/splash.dart';

class AuthService {
  final AuthController authController = Get.find();
  // Login Function Api
  Future<void> loginUser(String email, String password) async {
    final Map<String, String> data = {
      'email': email,
      'password': password,
    };

    final Uri url =
        Uri.parse('http://10.0.2.2:8000/api/Mobile_Application/login');

    try {
      final response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final int id = responseData['user']['id'];
        final String token = responseData['token'];
        final String name = responseData['user']['name'];
        final String email = responseData['user']['email'];
        final String phoneNumber = responseData['user']['phoneNumber'];
        final String location = responseData['user']['location'];
        final String fname = responseData['user']['fname'];
        final String lname = responseData['user']['lname'];
        print(token);
        authController.setId(id);
        authController.setToken(token);
        authController.setName(name);
        authController.setEmail(email);
        authController.setphoneNumber(phoneNumber);
        authController.setlocation(location);
        authController.setFName(fname);
        authController.setLName(lname);
        Get.off(() => Bottombar());
      } else {
        print('حدث خطأ: ${response.statusCode}');
      }
    } catch (error) {
      print('حدث خطأ : $error');
    }
  }

  // /Logout Function Api
  void logout() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/Mobile_Application/logout');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        Get.off(() => SplashScreen());
        print('Logged out successfully');
        authController.reset();
      } else {
        print('Failed to logout. Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error during logout: $error');
    }
  }

  // Get Details User
  Future<Map<String, dynamic>> getUserData() async {
    final Uri url = Uri.parse('http://10.0.2.2:8000/api/user');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${authController.token}',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = json.decode(response.body);

        return userData;
      } else {
        throw Exception('Failed to load user data:: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load user data: $error');
    }
  }
}
