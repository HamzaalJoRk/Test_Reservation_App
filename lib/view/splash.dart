import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
<<<<<<< HEAD
import 'package:reservation_app/view/bottom_bar.dart';
// import 'package:reservation_app/view/main_screen.dart';
=======
import 'package:reservation_app/view/main_screen.dart';
>>>>>>> main

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
<<<<<<< HEAD
          MaterialPageRoute(builder: (context) => const Bottombar()));
=======
          MaterialPageRoute(builder: (context) => const MainScreen()));
>>>>>>> main
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image(
                image: AssetImage('assets/images/kingdom.png'),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: SpinKitDoubleBounce(
                color: Colors.white,
                size: 50.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
