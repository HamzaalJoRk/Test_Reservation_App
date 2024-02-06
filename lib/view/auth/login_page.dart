import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:reservation_app/components/Custom_text.dart';
import 'package:reservation_app/view/auth/regester_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;

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
        title: const Text('Log In', style: TextStyle(fontSize: 25.0)),
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
                  const CustomText(
                    text: 'E-mail',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  TextField(
                    onTap: () {
                      double increasedHeight =
                          MediaQuery.of(context).size.height * 0.3;
                      Scaffold.of(context).showBottomSheet(
                        (context) => Container(
                          height: increasedHeight,
                          color: Colors.transparent,
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      hintText: 'ex@email.com',
                      hintStyle: const TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),/*
                      suffixIcon: const Icon(
                        Icons.phone,
                        color: Color(0xFF8857F1),
                      ),*/
                    ),
                  ),
                  SizedBox(height: size.height / 30),
                  const CustomText(
                    text: 'Password',
                    color: Colors.white60,
                  ),
                  SizedBox(height: size.height / 300),
                  TextField(
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
                  /*SizedBox(height: size.height/55),
                  const CustomText(
                    text: 'Forgot your password?',
                    color: Colors.white60,
                    fontSize: 14,
                  ),*/
                  SizedBox(height: size.height/25),

                  SizedBox(
                    width: size.width/2,
                    child: ElevatedButton(
                      onPressed: () {},
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
