import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_app/components/ProfileMenuWidget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:reservation_app/view/auth/AuthController.dart';
import 'package:reservation_app/view/auth/AuthService.dart';
import 'package:reservation_app/view/auth/login_page.dart';
import 'package:reservation_app/view/profile/profile_details.dart';

class HomeProfile extends StatelessWidget {
  HomeProfile({super.key});

  final AuthController authController = Get.find();
  final AuthService _authService = AuthService();
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
                ))
          ],
          title: Text(
            'Profile'.tr,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    /// Image
                    Stack(
                      children: [
                        if (authController.id != null && authController.id != 0)
                          SizedBox(
                            width: size.width / 2.8,
                            height: size.height / 6,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                'https://gweb-research-imagen.web.app/compositional/An%20oil%20painting%20of%20a%20British%20Shorthair%20cat%20wearing%20a%20cowboy%20hat%20and%20red%20shirt%20skateboarding%20on%20a%20beach./1_.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: size.height / 60),

                    Column(
                      children: [
                        if (authController.id != null && authController.id != 0)
                          Text('${authController.name}'),
                        if (authController.id != null && authController.id != 0)
                          Text('${authController.email}'),
                      ],
                    ),
                    SizedBox(height: size.height / 55),

                    /// -- BUTTON
                    if (authController.id != null && authController.id != 0)
                      SizedBox(
                        width: size.width / 2.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => ProfileDetails());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8857F1),
                            side: BorderSide.none,
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          child: Text(
                            'All Details'.tr,
                            style: const TextStyle(
                                color: Colors.white, fontFamily: 'Cairo'),
                          ),
                        ),
                      ),

                    if (authController.id == null || authController.id == 0)
                      SizedBox(height: size.height / 9),
                    if (authController.id == null || authController.id == 0)
                      SizedBox(
                        width: size.width / 2.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const LoginPage());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8857F1),
                            side: BorderSide.none,
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          child: Text(
                            'Login / register'.tr,
                            style: const TextStyle(
                                color: Colors.white, fontFamily: 'Cairo'),
                          ),
                        ),
                      ),
                    if (authController.id == null || authController.id == 0)
                      SizedBox(height: size.height / 7),
                    /*SizedBox(height: size.height / 5),
                    SizedBox(height: size.height / 40),*/
                    // const Divider(),

                    /// -- MENU
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          ProfileMenuWidget(
                            title: "My Puchases".tr,
                            icon: LineAwesomeIcons.user,
                            onPress: () {},
                            subItems: [
                              SubMenuItem(
                                title: "My Products".tr,
                                onPress: () {
                                  /*
                                  Get.to(() => profile());
                                  */
                                },
                              ),
                              SubMenuItem(
                                title: "My Reservations".tr,
                                onPress: () {},
                              ),
                            ],
                          ),
                          ProfileMenuWidget(
                            title: "Favorites".tr,
                            icon: LineAwesomeIcons.wallet,
                            onPress: () {},
                            subItems: [
                              SubMenuItem(
                                title: "My Favorites Products".tr,
                                onPress: () {},
                              ),
                            ],
                          ),
                          ProfileMenuWidget(
                            title: "Support".tr,
                            icon: LineAwesomeIcons.user_check,
                            onPress: () {},
                          ),
                          SizedBox(height: size.height / 200),
                          const Divider(),
                          SizedBox(height: size.height / 200),
                          ProfileMenuWidget(
                            title: "Languages".tr,
                            icon: LineAwesomeIcons.info,
                            onPress: () {},
                            subItems: [
                              SubMenuItem(
                                  title: "عربي",
                                  onPress: () {
                                    /*
                                    controllerlang.changeLang("ar");*/
                                  }),
                              SubMenuItem(
                                  title: "English",
                                  onPress: () {
                                    /*
                                    controllerlang.changeLang("en");*/
                                  }),
                            ],
                          ),
                          ProfileMenuWidget(
                            title: "Experince Evaluation".tr,
                            icon: LineAwesomeIcons.info,
                            onPress: () {},
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _authService.logout();
                              },
                              child: Text('logout'))
                        ],
                      ),
                    ),

                    SizedBox(
                      height: size.height / 45,
                    ),
                    Text('Copyright All rights reserved'.tr,
                        style: const TextStyle(
                          color: Color.fromARGB(153, 2, 0, 0),
                          fontSize: 12,
                        ))
                  ],
                ))));
  }
/*
  //logout funcation
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
        // تم تسجيل الخروج بنجاح
        Get.off(() => SplashScreen());
        print('Logged out successfully');
        authController.reset(); // استخدام الدالة reset لمسح قيم المتغيرات
      } else {
        // حدث خطأ ما
        print('Failed to logout. Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // حدث خطأ أثناء إرسال الطلب
      print('Error during logout: $error');
    }
  }*/
}
