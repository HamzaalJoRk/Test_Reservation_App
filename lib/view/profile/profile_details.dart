import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:reservation_app/view/auth/AuthController.dart';
import 'package:reservation_app/view/profile/update_profile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({Key? key});
  final AuthController authController = Get.find();

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final userData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(LineAwesomeIcons.angle_left),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // Add your action here
                  },
                  icon: const Icon(Icons.brightness_6),
                ),
              ],
              title: Text('All Details'.tr),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(35),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2015/04/19/08/32/rose-729509_640.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xFF8857F1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.camera,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            labelText: 'FullName'.tr,
                            prefixIcon: const Icon(LineAwesomeIcons.user),
                          ),
                          style: const TextStyle(color: Colors.black),
                          initialValue: userData != null ? "${userData['fname'] ?? ''} ${userData['lname'] ?? ''}" : '',
                          readOnly: true,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email'.tr,
                            prefixIcon: const Icon(LineAwesomeIcons.envelope_1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                          initialValue: userData?['email'],
                          readOnly: true,  
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          
                          decoration: InputDecoration(
                            labelText: 'PhoneNo'.tr,
                            prefixIcon: const Icon(LineAwesomeIcons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          style: const TextStyle(color: Colors.black),
                          initialValue: userData?['phoneNumber'],
                          readOnly: true,  
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            labelText: 'Password'.tr,
                            prefixIcon: const Icon(Icons.fingerprint),
                          ),
                          style: const TextStyle(color: Colors.black),
                          initialValue: userData?['location'],
                          readOnly: true,
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => UpdateProfileScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8857F1),
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                              textStyle: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            child: Text(
                              'Go to the edit page'.tr,
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: 'Cairo'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
