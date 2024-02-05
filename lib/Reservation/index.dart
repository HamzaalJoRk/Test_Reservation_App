import 'dart:convert';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reservation_app/components/table.dart';

class ReservationIndex extends StatefulWidget {
  const ReservationIndex({super.key});

  @override
  State<ReservationIndex> createState() => _ReservationIndexState();
}



class _ReservationIndexState extends State<ReservationIndex> {
  List<Map<String, dynamic>> reservations = [];

  @override
  void initState() {
    super.initState();
    getReservation();
  }

  // Get All Reservation dates / Hours
  Future<void> getReservation() async {
    try {
      final response =
      await http.get(Uri.parse("http://10.0.2.2:8000/api/reservation/houres"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (kDebugMode) {
          print(data);
        }

        List<Map<String, dynamic>> reservationsList =
        List<Map<String, dynamic>>.from(data["reservations"]);

        if (data["status"] != 200) {
          throw Exception("Failed to load data: ${data['status']}");
        }

        setState(() {
          reservations = reservationsList;
        });
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error: $error");
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: MyDataTable()
      ),
    );
  }
}
