import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trainapp/listpage.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  '${trainSchedule.departure}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'กำหนดเวลาออก: ${trainSchedule.departureTime}',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'ที่นั่ง',
                  style: TextStyle(fontSize: 20, color: Colors.white),
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
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  '${trainSchedule.destination}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'ราคารวม $totalPrice บาท',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  '${selectedSeats.join(", ")}',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PurchasePage extends StatefulWidget {
  final int totalPrice;
  final TrainSchedule trainSchedule;
  final List<String> selectedSeats;

  PurchasePage({
    required this.totalPrice,
    required this.trainSchedule,
    required this.selectedSeats,
  });

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  late Timer _timer;
  int _remainingTime = 900; // 15 minutes in seconds

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
        // Handle what to do when the countdown reaches 0
        // For example, navigate back to the previous page
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 148, 137, 121),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(200, 148, 137, 121),
        title: Text('TICKET'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SeatInfoWidget(
              totalPrice: widget.totalPrice,
              trainSchedule: widget.trainSchedule,
              selectedSeats: widget.selectedSeats,
            ),
            QrImageView(
              data: "Your QR code data here",
              version: QrVersions.auto,
              size: 200.0,
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'เวลาที่เหลือ: ${_formatDuration(Duration(seconds: _remainingTime))}',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'กรุณาไปชำระเงินผ่านทางช่อยจำหน่ายตั๋ว',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'ขอให้เดินทางอย่างสวัสดิภาพ',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              width: 360,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScheduleListPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8.0), // Adjust the padding as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0), // Adjust the border radius as needed
                  ),
                  backgroundColor: Color.fromARGB(255, 60, 91, 111),
                ),
                child: Text(
                  'กลับสู่หน้าหลัก',
                  style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
