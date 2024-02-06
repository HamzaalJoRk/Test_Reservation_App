import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:reservation_app/components/Custom_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  bool _agreeToTerms = false;

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
              onPressed: () {
                /*
                  if (Get.isDarkMode) {
                    Get.changeTheme(Themes.customLightTheme);
                  } else {
                    Get.changeTheme(Themes.customDarkTheme);
                  }*/
              },
              icon: const Icon(
                Icons.brightness_6,
              ))
        ],
        title: const Text('Sign Up', style: TextStyle(fontSize: 25.0)),
        centerTitle: true,
      ),
      body: Container(
        /*decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/1.png'),
            fit: BoxFit.cover,
          ),
        ),*/
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*const CustomText(
                    text: 'Sign Up',
                    fontSize: 30.0,
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),*/
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
                      const SizedBox(width: 20), // مسافة بين الحقلين
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
                  /*CustomText(
                    text: 'Full Name :',
                    color: Colors.white60,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    // Full Name field
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: 'Enter your full name',
                      hintStyle: TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),*/
                  SizedBox(height: size.height / 100),
                  const CustomText(
                    text: 'E-mail',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  // Email field
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: 'email@gmail.com',
                      hintStyle: TextStyle(color: Colors.black26),
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
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.black26),
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
                  CustomText(
                    text: 'Phone Number:',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  TextField(
                    // Phone Number field
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: '+352 681 000 000',
                      hintStyle: TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 100),
                  CustomText(
                    text: 'Location',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  TextField(
                    // location
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintStyle: TextStyle(color: Colors.black26),
                      hintText: 'location',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
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
                        child: CustomText(
                          text: 'I agree to the terms and policies',
                          color: Colors.white60,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height / 50),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF8857F1),
                    ),
                    child: CustomText(
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
                        icon: Icon(Icons.facebook),
                        color: Colors.blue[800],
                        onPressed: () {},
                        iconSize: 40,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                        icon: Icon(Icons.g_translate),
                        color: Color(0xFF8857F1),
                        onPressed: () {},
                        iconSize: 40,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                        icon: Icon(Icons.close_outlined),
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
