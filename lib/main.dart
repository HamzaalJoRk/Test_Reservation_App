import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservation_app/Cart/CartController.dart';
import 'package:reservation_app/view/auth/AuthController.dart';
import 'package:reservation_app/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Reservation App',
      initialBinding: InitialBinding(), // تثبيت المراقب هنا
      home: const SplashScreen(),
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.normal,
          ),
          displayMedium: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          headlineSmall: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: GoogleFonts.roboto(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(CartController());
  }
}
