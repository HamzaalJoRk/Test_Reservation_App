import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation_app/Reservation/request.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReservationTable extends StatefulWidget {
  const ReservationTable({super.key});

  @override
  _ReservationTableState createState() => _ReservationTableState();
}

class _ReservationTableState extends State<ReservationTable> {
  List<Map<String, dynamic>> reservations = [];
  DateTime? selectedDate;
  bool isDaySelected = false;
  bool isLoading = false;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchData() async {
    try {
      final response =
      await http.get(Uri.parse("http://10.0.2.2:8000/api/reservation/houres"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (kDebugMode) {
          print(data);
        }
        setState(() {
          reservations = List<Map<String, dynamic>>.from(data["reservations"]);
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load data");
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error loading data: $error");
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _focusedDay = day;
      isDaySelected = true;
      selectedDate = focusedDay;
      isLoading = true;
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Data'),
      ),
      // backgroundColor: Colors.black,
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            rowHeight: 45,
            selectedDayPredicate: (day) => isSameDay(day, _focusedDay),
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            focusedDay: _focusedDay,
            firstDay: DateTime(2022, 1, 1),
            lastDay: DateTime(2025, 12, 31),
          ),
          if (!isDaySelected)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Select Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 20,),
          // List of reservations
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemExtent: 40,
                  itemCount: reservations
                      .where((reservation) =>
                  selectedDate == null ||
                      reservation["date"] ==
                          selectedDate!.toLocal().toString().split(' ')[0])
                      .length,
                  itemBuilder: (context, index) {
                    final filteredReservations = reservations
                        .where((reservation) =>
                    selectedDate == null ||
                        reservation["date"] ==
                            selectedDate!.toLocal().toString().split(' ')[0])
                        .toList();

                    final reservation = filteredReservations[index];
                    if (kDebugMode) {
                      print('Reservation Is :');
                    }
                    // print(filteredReservations[index]);
                    if (filteredReservations.isEmpty) {
                      return const Text('Not Reservation');
                    } else {
                      return FractionallySizedBox(
                        widthFactor: 0.6,
                        heightFactor: 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => RequestReservationPage(id: reservation["id"]));
                            if (kDebugMode) {
                              print("Button pressed for ID: ${reservation["id"]}");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Time: ${reservation["time"]}, Total Number: ${reservation["totalNumber"]}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}