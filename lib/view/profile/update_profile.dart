import 'dart:convert';
import 'package:reservation_app/view/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:reservation_app/components/Custom_text.dart';
import 'package:reservation_app/view/auth/AuthController.dart';
import 'package:reservation_app/view/splash.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.find();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
            ),
          ),
        ],
        title: Text("Edit Profile".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              // -- IMAGE with ICON
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
                          color: const Color(0xFF8857F1)),
                      child: const Icon(LineAwesomeIcons.camera,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // -- Form Fields
              Form(
                child: Column(
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
                                color: Colors.black,
                              ),
                              SizedBox(height: size.height / 300),
                              // First Name field
                              TextFormField(
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
                                style: const TextStyle(color: Colors.black),
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
                                color: Colors.black,
                              ),
                              SizedBox(height: size.height / 300),
                              // Last Name field
                              TextFormField(
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
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email'.tr,
                        prefixIcon: const Icon(
                          LineAwesomeIcons.envelope_1,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        label: Text('PhoneNo'.tr),
                        prefixIcon: const Icon(
                          LineAwesomeIcons.phone,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: locationController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        label: Text('Location'.tr),
                        prefixIcon: const Icon(
                          Icons.fingerprint,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 50),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // تنفيذ طلب التحديث هنا
                          updateProfile();
                          Get.to(() => SplashScreen());
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
                          'Edit Profile'.tr,
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
      ),
    );
  }

  // دالة لتحديث ملف التعريف
  void updateProfile() async {
    try {
      Map<String, dynamic> body = {
        'fname': firstNameController.text,
        'lname': lastNameController.text,
        'email': emailController.text,
        'location': locationController.text,
        'phoneNumber': phoneNumberController.text,
      };

      // إرسال طلب التحديث
      final response = await http.put(
        Uri.parse(
            'http://10.0.2.2:8000/api/Mobile_Application/user/${authController.id}'), // استبدل بعنوان URL الخاص بك وبالقيمة الفعلية لمعرف المستخدم
        body: jsonEncode(body),
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          //'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(authController.id);
      // التحقق من نجاح الطلب
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.off(() => Bottombar());
        print('Profile Updated Successfully');
      } else {
        print('Failed to update profile');
      }
    } catch (e) {
      print('Error updating profile: $e');
    }
  }
}
