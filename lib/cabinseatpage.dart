import 'package:flutter/material.dart';
import 'package:trainapp/listpage.dart';
import 'package:trainapp/purchase.dart';
import 'package:trainapp/seat_widget.dart';

class CabinSeatPage extends StatefulWidget {
  final TrainSchedule trainSchedule;

  CabinSeatPage({required this.trainSchedule});

  @override
  _CabinSeatPageState createState() => _CabinSeatPageState();
}

class SeatInfoWidget extends StatelessWidget {
  final int totalPrice;
  final TrainSchedule trainSchedule;
  final List<String> selectedSeats;

  SeatInfoWidget({
    required this.totalPrice,
    required this.trainSchedule,
    required this.selectedSeats,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'จาก',
                  style: TextStyle(fontSize: 15 , color: Colors.white),
                ),
                Text(
                  '${trainSchedule.departure}',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'กำหนดเวลาออก: ${trainSchedule.departureTime}',
                  style: TextStyle(fontSize: 15 ,color: Colors.white),
                ),
                
              ],
            ),
          ),
          SizedBox(width: 2), // Add spacing between left and right sides
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'ไป',
                  style: TextStyle(fontSize: 15 , color: Colors.white),
                ),
                Text(
                  '${trainSchedule.destination}',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'ราคารวม $totalPrice บาท',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),
                ),
                SizedBox(height: 20),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CabinSeatPageState extends State<CabinSeatPage> {
  List<String> selectedSeats = []; // List to store selected seat numbers
  int totalPrice = 0; // Variable to store total price

  // Function to calculate total price based on selected seats
  void calculateTotalPrice() {
    setState(() {
      totalPrice = selectedSeats.length * 60; // Price per seat is 60
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 148, 137, 121),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(200, 148, 137, 121),
        title: Text('Select Seats'),
      ),
      body: Column(
        children: [
          SeatInfoWidget(
            totalPrice: totalPrice,
            trainSchedule: widget.trainSchedule,
            selectedSeats: selectedSeats,
          ),
          // Rows of seats
          for (int i = 1; i <= 10; i++) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Seat widgets in a row
                for (int j = 1; j <= 4; j++) ...[
                  SeatWidget(
                    seatNumber: "${String.fromCharCode(i + 64)}$j",
                    width: (MediaQuery.of(context).size.width - 24 - 33) / 8,
                    height: (MediaQuery.of(context).size.width - 24 - 33) / 8,
                    isAvailable: i != 10,
                    isSelected: selectedSeats.contains("${String.fromCharCode(i + 64)}$j"),
                    onTap: () {
                      setState(() {
                        if (selectedSeats.contains("${String.fromCharCode(i + 64)}$j")) {
                          selectedSeats.remove("${String.fromCharCode(i + 64)}$j");
                        } else {
                          selectedSeats.add("${String.fromCharCode(i + 64)}$j");
                        }
                        calculateTotalPrice(); // Recalculate total price
                      });
                    },
                  ),
                  if (j != 8) SizedBox(width: j == 2 ? 40 : 4), // Gap between seats
                ],
              ],
            ),
            if (i != 10) SizedBox(height: 6), // Gap between rows
          ],
          SizedBox(height: 24),
          Container(
                width: 360,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchasePage(
                          totalPrice: totalPrice,
                          trainSchedule: widget.trainSchedule,
                          selectedSeats: selectedSeats,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8.0), // Adjust the padding as needed
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0), // Adjust the border radius as needed
                          ),
                    backgroundColor: Color.fromARGB(255, 60, 91, 111)
                  ),
                  child: Text(
                    'CONTINUE',
                    style: 
                    TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                  ),
                ),
              ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

