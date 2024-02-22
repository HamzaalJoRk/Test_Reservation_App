import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_app/Cart/CartController.dart';
import 'package:reservation_app/components/Custom_Button.dart';
import 'package:reservation_app/components/Custom_text.dart';
import 'package:reservation_app/model/model.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController cartController = Get.find();
  int totalprice = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 220, 220),
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          //Products List
          Expanded(
            child: ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                Products item = cartController.cartItems[index];
                totalprice = item.count * item.price;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      height: size.height / 7,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                '${item.img}',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: item.title,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: '\$${item.price}.00',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                Row(
                                  children: [
                                    const CustomText(
                                      text: 'Total: ',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text: '\$$totalprice.00',
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      item.count++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                                CustomText(
                                  text: '${item.count}',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (item.count > 1) {
                                      setState(() {
                                        item.count--;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          //Payment Summary
          Container(
            height: size.height / 4,
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.all(17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Payment Summary',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Sub Total',
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: '\$324.00',
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Discount',
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: '\$0.00',
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Tax %',
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: '\$64.00',
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Total Payment Amount',
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: '\$388.00',
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          //Button Proceed to Payment
          Container(
            width: double.infinity,
            height: size.height / 8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Grand Total',
                      ),
                      CustomText(
                        text: '\$388.00',
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: 'Proceed to Payment',
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
