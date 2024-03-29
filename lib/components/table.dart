import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:reservation_app/Reservation/request.dart';

class MyDataTable extends StatefulWidget {
  const MyDataTable({Key? key});

  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  List<Map<String, dynamic>> allReservations = [];
  List<Map<String, dynamic>> filteredReservations = [];
  bool loading = true;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    getReservation();
  }

  // Get All Reservation dates / Hours
  Future<void> getReservation() async {
    try {
      setState(() {
        loading = true;
      });
<<<<<<< HEAD
      final response = await http
          .get(Uri.parse("http://10.0.2.2:8000/api/reservation/houres"));
=======
      final response = await http.get(Uri.parse("http://10.0.2.2:8000/api/reservation/houres"));
>>>>>>> main

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);

<<<<<<< HEAD
        List<Map<String, dynamic>> reservationsList =
            List<Map<String, dynamic>>.from(data["reservations"]);
=======
        List<Map<String, dynamic>> reservationsList = List<Map<String, dynamic>>.from(data["reservations"]);
>>>>>>> main

        if (data["status"] != 200) {
          throw Exception("Failed to load data: ${data['status']}");
        }

        setState(() {
          allReservations = reservationsList;
          filterReservationsByDate();
          loading = false;
        });
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (error) {
      print("Error: $error");
      setState(() {
        loading = false;
      });
    }
  }

  // Filter reservations based on selected date
  void filterReservationsByDate() {
    filteredReservations = allReservations
<<<<<<< HEAD
        .where((reservation) =>
            DateTime.parse(reservation["date"]).isAtSameMomentAs(selectedDate))
=======
        .where((reservation) => DateTime.parse(reservation["date"]).isAtSameMomentAs(selectedDate))
>>>>>>> main
        .toList();
  }

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
<<<<<<< HEAD
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2022),
          lastDate: DateTime(2023),
        )) ??
        selectedDate;
=======
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    )) ?? selectedDate;
>>>>>>> main

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        filterReservationsByDate();
      });
    }
  }

  // Function to show available dates
  Future<void> _showAvailableDates(BuildContext context) async {
    final List<DateTime> availableDates = allReservations.map((reservation) {
      return DateTime.parse(reservation["date"]);
    }).toList();

    await showDatePicker(
      context: context,
      initialDate: selectedDate,
<<<<<<< HEAD
      firstDate: availableDates.reduce(
          (value, element) => value.isBefore(element) ? value : element),
      lastDate: availableDates
          .reduce((value, element) => value.isAfter(element) ? value : element),
=======
      firstDate: availableDates.reduce((value, element) => value.isBefore(element) ? value : element),
      lastDate: availableDates.reduce((value, element) => value.isAfter(element) ? value : element),
>>>>>>> main
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
<<<<<<< HEAD
          if (loading) const CircularProgressIndicator(),
=======
          if (loading)
            const CircularProgressIndicator(),
>>>>>>> main
          if (!loading)
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Select Date'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Time')),
                      DataColumn(label: Text('Total Number')),
                      DataColumn(label: Text('Action')),
                      // Add more DataColumn widgets as needed
                    ],
<<<<<<< HEAD
                    rows: filteredReservations
                        .map(
                          (reservation) => DataRow(
                            cells: [
                              DataCell(Text(reservation["time"])),
                              DataCell(Text(reservation["totalNumber"])),
                              DataCell(
                                ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => RequestReservationPage(
                                        id: reservation["id"]));
                                    print(
                                        "Button pressed for ID: ${reservation["id"]}");
                                  },
                                  child: const Text("Action"),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
=======
                    rows: filteredReservations.map(
                          (reservation) => DataRow(
                        cells: [
                          DataCell(Text(reservation["time"])),
                          DataCell(Text(reservation["totalNumber"])),
                          DataCell(
                            ElevatedButton(
                              onPressed: () {
                                Get.to(() => RequestReservationPage(id: reservation["id"]));
                                print("Button pressed for ID: ${reservation["id"]}");
                              },
                              child: const Text("Action"),
                            ),
                          ),
                        ],
                      ),
                    ).toList(),
>>>>>>> main
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
