import 'dart:async';
<<<<<<< HEAD
import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/Cart/Cart.dart';
import 'package:reservation_app/Cart/CartController.dart';
=======

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
>>>>>>> main
import 'package:reservation_app/Reservation/index.dart';
import 'package:reservation_app/components/big_item.dart';
import 'package:reservation_app/components/middle_text.dart';
import 'package:reservation_app/data/dummy_data.dart';
import 'package:reservation_app/utils/strings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
<<<<<<< HEAD

=======
>>>>>>> main
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    /// For Changing Index of Page View Automatically
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentIndex < offersList.length - 1) {
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        _currentIndex = 0;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double iconSize = 25.0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage('assets/images/kingdom.png'),
            //       fit: BoxFit.fill
            //   ),
            // ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// AppBar
                  CustomAppBar(
                    iconSize: iconSize,
                  ),

                  /// Body
                  Container(
                    margin: const EdgeInsets.only(
                      top: 0,
                      right: 10,
                      left: 10,
                      bottom: 0,
                    ),
                    width: size.width,
                    height: size.height / 1.21,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          /// Offer Section
                          OffersSection(
                            currentIndex: _currentIndex,
                            pageController: _pageController,
                            func: (value) {
                              setState(() {
                                _currentIndex = value;
                              });
                            },
                          ),

                          ///
                          const SizedBox(
                            height: 20,
                          ),

                          /// Middle Text
                          FadeInRight(
                            delay: const Duration(milliseconds: 600),
                            child: const MiddleText(
                              text: MyStrings.Reservation,
                              delay: 1,
                            ),
                          ),

                          /// Categories Section
                          FadeInRight(
                            delay: const Duration(milliseconds: 700),
                            child: const CategoriesSection(),
                          ),

                          /// Product Text
                          FadeInRight(
                            delay: const Duration(milliseconds: 1300),
                            child: const MiddleText(
                              text: MyStrings.Products,
                              delay: 4,
                            ),
                          ),

                          FadeInRight(
                            delay: const Duration(milliseconds: 1400),
<<<<<<< HEAD
                            child:
                                BigItemSection(itemList: bestsForCustomerList),
=======
                            child: BigItemSection(itemList: bestsForCustomerList),
>>>>>>> main
                          ),

                          /// Product Text
                          FadeInRight(
                            delay: const Duration(milliseconds: 1300),
                            child: const MiddleText(
                              text: MyStrings.Products,
                              delay: 4,
                            ),
                          ),

                          /// Big Item Section - ListView
                          FadeInRight(
                            delay: const Duration(milliseconds: 1400),
<<<<<<< HEAD
                            child:
                                BigItemSection(itemList: bestsForCustomerList),
=======
                            child: BigItemSection(itemList: bestsForCustomerList),
>>>>>>> main
                          ),

                          ///
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Categories Section
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: size.width,
      height: size.height / 7,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (ctx, index) {
            return FadeInRight(
              delay: Duration(milliseconds: index * 300),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => ReservationIndex());
                    },
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      width: size.width / 4.7,
                      height: size.height / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(categoriesList[index].img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    categoriesList[index].title,
                    style: textTheme.headlineMedium,
                  )
                ],
              ),
            );
          }),
    );
  }
}

/// Offer Section
class OffersSection extends StatelessWidget {
  const OffersSection({
    super.key,
    required this.currentIndex,
    required this.pageController,
    required this.func,
  });

  final int currentIndex;
  final PageController pageController;
  final Function(int) func;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        FadeInLeft(
          delay: const Duration(milliseconds: 400),
          child: Row(
            children: [
              Text(
                MyStrings.kigromBridge,
                style: textTheme.displayMedium,
              ),
            ],
          ),
        ),
        FadeInUp(
          delay: const Duration(milliseconds: 500),
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: size.width,
            height: size.height / 4.5,
            child: PageView.builder(
                onPageChanged: func,
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: offersList.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(offersList[index]),
                          fit: BoxFit.cover),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

/// AppBar
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.iconSize,
  });

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
<<<<<<< HEAD
    final CartController cartController = Get.find<CartController>();
=======
>>>>>>> main
    return SizedBox(
        width: size.width,
        height: size.height / 8,
        child: Stack(
          children: [
<<<<<<< HEAD
=======

>>>>>>> main
            // Top Right Nav bar icons
            Positioned(
              top: 35,
              left: 0,
              right: 0,
              child: FadeInRight(
                delay: const Duration(milliseconds: 100),
                child: SizedBox(
                  height: size.height / 15,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu_rounded,
                            size: iconSize,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
<<<<<<< HEAD
                      Expanded(
                        child: Container(
                          height: (size.height / 15) / 1.8,
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              // contentPadding: const EdgeInsets.all(10),
                              suffixIcon: const Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 146, 146, 146),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              hintText: "Search here",
                              hintStyle: const TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 131, 131, 131)),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(() => Cart());
                        },
                        icon: Stack(
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 25,
                              color: Colors.white,
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Obx(() => Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    constraints: BoxConstraints(
                                      minWidth: 10,
                                      minHeight: 15,
                                    ),
                                    child: Text(
                                      '${cartController.countProducts.value}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
=======
                      Expanded(child:
                      Container(
                        height: (size.height / 15) / 1.8,
                        padding: const EdgeInsets.only(right: 5,left: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            // contentPadding: const EdgeInsets.all(10),
                            suffixIcon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 146, 146, 146),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            hintText: "Search here",
                            hintStyle: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 131, 131, 131)),
                          ),
                        ),
                      ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            size: iconSize,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart,
                            size: iconSize,
                            color: Colors.white,
                          )),
>>>>>>> main
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
<<<<<<< HEAD
=======



>>>>>>> main
