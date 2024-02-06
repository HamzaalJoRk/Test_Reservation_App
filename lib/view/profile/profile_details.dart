import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:reservation_app/view/profile/update_profile.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {/*
                if (Get.isDarkMode) {
                  Get.changeTheme(Themes.customLightTheme);
                  print("Light");
                } else {
                  Get.changeTheme(Themes.customDarkTheme);
                  print("Dark");
                }*/
              },
              icon: const Icon(
                Icons.brightness_6,
                // color: Colors.white,
              ),
            ),
          ],
          title: Text('All Details'.tr),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(35),
                child: Column(children: [
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
      TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(),
          ),
          label: Text('FullName'.tr),
          prefixIcon: const Icon(
            LineAwesomeIcons.user,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(height: 15),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Email'.tr,
          prefixIcon: const Icon(
            LineAwesomeIcons.envelope_1,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(height: 15),
      TextFormField(
        decoration: InputDecoration(
          label: Text('PhoneNo'.tr),
          prefixIcon: const Icon(
            LineAwesomeIcons.phone,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(height: 15),
      TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          label: Text('Password'.tr),
          prefixIcon: const Icon(
            Icons.fingerprint,
          ),
          suffixIcon: IconButton(
            icon: const Icon(LineAwesomeIcons.eye_slash),
            onPressed: () {},
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
      const SizedBox(height: 50),

      // -- Form Submit Button
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const UpdateProfileScreen());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8857F1),
            side: BorderSide.none,
            shape: const StadiumBorder(),
            textStyle: const TextStyle(
                            color: Colors.white,
                          ),
          ),
          child: Text('Go to the edit page'.tr,style: const TextStyle(color: Colors.white,fontFamily: 'Cairo'),),
        ),
      ),
      const SizedBox(height: 50),
    ],
  ),
)
                ]))));
  }
}