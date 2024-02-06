import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_app/components/ProfileMenuWidget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:reservation_app/view/auth/login_page.dart';
import 'package:reservation_app/view/profile/profile_details.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({super.key});

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
                    /// -- IMAGE
                    Stack(
                      children: [
                        SizedBox(
                            width: size.width / 2.8,
                            height: size.height / 6,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  'https://cdn.pixabay.com/photo/2015/04/19/08/32/rose-729509_640.jpg',
                                  /*width: 100,
                                  height: 100,*/
                                  fit: BoxFit.cover,
                                ))),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                                width: size.width / 11,
                                height: size.height/25,
                                //35
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color(0xFF8857F1),
                                ),
                                child: const Icon(
                                  LineAwesomeIcons.alternate_pencil,
                                  color: Colors.black,
                                  size: 20,
                                )))
                      ],
                    ),
                    SizedBox(height: size.height/60),
                    const Text('Ahmad Aldali'),
                    const Text('ahmadaldali110@gmail.com'),
                    SizedBox(height: size.height/55),

                    /// -- BUTTON
                    SizedBox(
                      width: size.width/2.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const ProfileDetails());
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
                    SizedBox(
                      width: size.width/2.5,
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
                    SizedBox(height: size.height/40),
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
                          SizedBox(height: size.height/200),
                          const Divider(),
                          SizedBox(height: size.height/200),
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height/45,
                    ),
                    Text('Copyright All rights reserved'.tr,
                        style: const TextStyle(
                          color: Color.fromARGB(153, 2, 0, 0),
                          fontSize: 12,
                        ))
     ],
   ))));
  }
}
