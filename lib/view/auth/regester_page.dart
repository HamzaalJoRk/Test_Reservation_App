import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:reservation_app/components/CustomSnackbar%20.dart';
import 'package:reservation_app/components/Custom_text.dart';
import 'package:reservation_app/view/auth/AuthController.dart';
import 'package:reservation_app/view/bottom_bar.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  bool _agreeToTerms = false;
  File? _image;
  final AuthController authController = Get.find();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  Future<void> registerUser() async {
    final String imagePath = _image?.path ?? '';
    String base64Image = '';

    if (imagePath.isNotEmpty) {
      base64Image = base64Encode(File(imagePath).readAsBytesSync());
    }

    final Map<String, dynamic> data = {
      'fname': firstNameController.text,
      'lname': lastNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'phoneNumber': phoneNumberController.text,
      'location': locationController.text,
      'personImage': base64Image,
    };

    final Uri url =
        Uri.parse('http://10.0.2.2:8000/api/Mobile_Application/register');

    try {
      final response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final int id = responseData['user']['id'];
        final String token = responseData['token'];
        final String fname = responseData['user']['fname'];
        final String lname = responseData['user']['lname'];
        final String name = responseData['user']['name'];
        final String email = responseData['user']['email'];

        print(token);
        authController.setId(id);
        authController.setToken(token);
        authController.setName(name);
        authController.setEmail(email);
        authController.setFName(fname);
        authController.setLName(lname);

        // ignore: use_build_context_synchronously
        CustomSnackbar.show(
          context,
          'تم التسجيل بنجاح',
        );
        Get.to(() => const Bottombar());
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
        title: const Text('Sign Up', style: TextStyle(fontSize: 25.0)),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: 'First Name',
                              color: Colors.white60,
                            ),
                            SizedBox(height: size.height / 300),
                            // First Name field
                            TextField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'fname',
                                hintStyle:
                                    const TextStyle(color: Colors.black26),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: 'Last Name',
                              color: Colors.white60,
                            ),
                            SizedBox(height: size.height / 300),
                            // Last Name field
                            TextField(
                              controller: lastNameController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'lname',
                                hintStyle:
                                    const TextStyle(color: Colors.black26),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height / 100),
                  const CustomText(
                    text: 'E-mail',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  // Email field
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: 'email@gmail.com',
                      hintStyle: const TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 100),
                  const CustomText(
                    text: 'Password:',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  // Password field
                  TextField(
                    controller: passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: 'Enter your password',
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
                          color: Color(0xFF8857F1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 100),
                  const CustomText(
                    text: 'Phone Number:',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  // Phone Number field
                  TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: '+352 681 000 000',
                      hintStyle: const TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 100),
                  const CustomText(
                    text: 'Location',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  TextField(
                    controller: locationController,
                    // location
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintStyle: const TextStyle(color: Colors.black26),
                      hintText: 'location',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 100),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: getImage,
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF8857F1),
                        ),
                        child: Text('Upload Image'),
                      ),
                      SizedBox(width: 20),
                      _image != null
                          ? Image.file(
                              _image!,
                              width: 100,
                              height: 100,
                            )
                          : Container(),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreeToTerms = value ?? false;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _agreeToTerms = !_agreeToTerms;
                          });
                        },
                        child: const CustomText(
                          text: 'I agree to the terms and policies',
                          color: Colors.white60,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height / 50),
                  ElevatedButton(
                    onPressed: registerUser,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF8857F1),
                    ),
                    child: const CustomText(
                      text: 'SIGN UP',
                      alignment: Alignment.center,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.facebook),
                        color: Colors.blue[800],
                        onPressed: () {},
                        iconSize: 40,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                        icon: const Icon(Icons.g_translate),
                        color: const Color(0xFF8857F1),
                        onPressed: () {},
                        iconSize: 40,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_outlined),
                        color: const Color(0xFF8857F1),
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

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
