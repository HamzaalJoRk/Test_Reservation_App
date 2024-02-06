import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RequestReservationPage extends StatefulWidget {
  final int id;

  const RequestReservationPage({Key? key, required this.id}) : super(key: key);

  @override
  State<RequestReservationPage> createState() => _RequestReservationPageState();
}

class _RequestReservationPageState extends State<RequestReservationPage> {
  TextEditingController numberOfChildrenController = TextEditingController();
  TextEditingController numberOfAdultsController = TextEditingController();

  Future<void> sendReservationRequest() async {
    int numberOfChildren = int.parse(numberOfChildrenController.text);
    int numberOfAdults = int.parse(numberOfAdultsController.text);

    // Data Send
    Map<String, String> requestData = {
      "user_id": "1",
      "reservation_id": "${widget.id}",
      "bigPersonNumber": "$numberOfAdults",
      "littlePersonNumber": "$numberOfChildren",
      "priceLittle": "20",
      "priceBig": "20",
    };

    String apiUrl = "http://10.0.2.2:8000/api/reservations/request/${widget.id}/add";

    http.Response response = await http.post(
      Uri.parse(apiUrl),
      body: requestData,
    );

    if (response.statusCode == 200) {
      Get.off(() => const SuccessPage());
    } else {
      if (kDebugMode) {
        print("Error: ${response.statusCode}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Request Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: numberOfChildrenController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Little Person'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: numberOfAdultsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Big Person'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                sendReservationRequest();
              },
              child: const Text('Make a reservation'),
            ),
          ],
        ),
      ),
    );
  }
}


class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success Page'),
      ),
      body: const Center(
        child: Text('Second Page'),
      ),
    );
  }
}