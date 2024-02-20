import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_app/Cart/CartController.dart';
import 'package:reservation_app/components/Custom_Button.dart';
import 'package:reservation_app/components/Custom_text.dart';
import 'package:reservation_app/model/model.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int quantity = 1;
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 220, 220),
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                Products item = cartController.cartItems[index];
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
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${item.title}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$${item.price}.00',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                                Text(
                                  '$quantity',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity--;
                                      });
                                      //print(item.added);
                                    }
                                  },
                                  icon: Icon(Icons.remove),
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
          Container(
            height: size.height / 4,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
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
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: size.height / 8,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
