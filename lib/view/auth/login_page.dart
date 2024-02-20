import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:reservation_app/components/Custom_text.dart';
import 'package:reservation_app/view/auth/AuthController.dart';
import 'package:reservation_app/view/auth/regester_page.dart';
import 'package:reservation_app/view/bottom_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.find();
  // الدالة لتسجيل الدخول
  Future<void> loginUser() async {
    final Map<String, String> data = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    print('Data to be sent: $data'); // Print data before sending
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Get.lazyPut<AuthController>(() => AuthController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              LineAwesomeIcons.angle_left,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.brightness_6,
              ))
        ],
        title: const Text('Log In', style: TextStyle(fontSize: 25.0)),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'E-mail',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: 'ex@email.com',
                      hintStyle: const TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 30),
                  const CustomText(
                    text: 'Password',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  TextField(
                    controller: passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: '_ _ _ _ _ ',
                      hintStyle: const TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xFF8857F1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 25),
                  SizedBox(
                    width: size.width / 2,
                    child: ElevatedButton(
                      onPressed: loginUser,
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF8857F1),
                      ),
                      child: const CustomText(
                        text: 'SIGN IN',
                        alignment: Alignment.center,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: 'Don‘t have an account? ',
                        color: Colors.white70,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const RegisterPage());
                        },
                        child: const CustomText(
                          text: ' Sign in',
                          color: Color(0xFF8857F1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.facebook),
                        color: Colors.blue[800],
                        onPressed: () {},
                        iconSize: 40,
                      ),
                      IconButton(
                        icon: const Icon(Icons.g_translate),
                        color: const Color(0xFF8857F1),
                        onPressed: () {},
                        iconSize: 40,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        color: Color(0xFF8857F1),
                        onPressed: () {},
                        iconSize: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
