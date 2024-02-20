import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:reservation_app/Cart/Cart.dart';
import 'package:reservation_app/Cart/CartController.dart';
import 'package:reservation_app/components/Custom_Button.dart';
import 'package:reservation_app/model/model.dart';
import 'package:reservation_app/view/main_screen.dart';

class ProductDetails extends StatelessWidget {
  final Products item;
  final CartController cartController = Get.find();
  ProductDetails({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 220, 220),
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
          'Products D'.tr,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // عرض صورة المنتج
          Expanded(
            flex: 5,
            child: Image.asset(
              '${item.img}',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          // عرض تفاصيل المنتج
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white70,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.title}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$${item.price}.00',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white70,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'The quick brown fox jumps over the lazy dog. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pulvinar gravida justo, sed accumsan nulla tempor eu. Vestibulum ante ',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Butuom
                  Row(
                    children: [
                      CustomButton(
                        onPressed: () {
                          print('Buy Now');
                        },
                        text: 'Buy Now',
                        color: Colors.black, // تخصيص لون الخلفية
                        textColor: Colors.white, // تخصيص لون النص
                      ),
                      SizedBox(width: 60),
                      if (item.added == false)
                        CustomButton(
                          onPressed: () {
                            cartController.addToCart(item);
                            Get.to(() => MainScreen());
                            item.added = true;
                          },
                          text: 'Add to Cart',
                          color: Colors.white,
                          textColor: Colors.black,
                        ),
                      if (item.added == true)
                        CustomButton(
                          onPressed: () {
                            Get.to(() => Cart());
                            item.added = true;
                          },
                          text: 'Show Cart',
                          color: Colors.white,
                          textColor: Colors.black,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
