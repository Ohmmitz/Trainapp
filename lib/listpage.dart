import 'package:flutter/material.dart';
import 'package:trainapp/cabinseatpage.dart';
import 'package:intl/intl.dart';
import 'package:trainapp/purchase.dart'; // Import PurchasePage to access purchased ticket info

class ScheduleListPage extends StatefulWidget {
  @override
  _ScheduleListPageState createState() => _ScheduleListPageState();
}

class TrainSchedule {
  final String departure;
  final String destination;
  final String departureTime;
  final String routeNo;
  final List<String> purchasedTickets; // Add list of purchased tickets

  TrainSchedule({
    required this.departure,
    required this.destination,
    required this.departureTime,
    required this.routeNo,
    this.purchasedTickets = const [], // Initialize as empty list
  });
}

List<TrainSchedule> trainSchedules = [
  TrainSchedule(departure: 'กรุงเทพอภิวัฒน์', destination: 'เชียงใหม่', departureTime: '05:30', routeNo: '9051'),
  TrainSchedule(departure: 'เชียงใหม่', destination: 'กรุงเทพอภิวัฒน์', departureTime: '05:30', routeNo: '9052'),
  TrainSchedule(departure: 'กรุงเทพอภิวัฒน์', destination: 'พิษณุโลก', departureTime: '09:25', routeNo: '201'),
  TrainSchedule(departure: 'พิษณุโลก', destination: 'กรุงเทพอภิวัฒน์', departureTime: '06:05', routeNo: '202'),
  TrainSchedule(departure: 'กรุงเทพอภิวัฒน์', destination: 'ลพบุรี', departureTime: '17:25', routeNo: '317'),
  TrainSchedule(departure: 'ลพบุรี', destination: 'กรุงเทพอภิวัฒน์', departureTime: '06:00', routeNo: '318'),
  TrainSchedule(departure: 'กรุงเทพอภิวัฒน์', destination: 'อุบลราชธานี', departureTime: '06:00', routeNo: '9071'),
  TrainSchedule(departure: 'อุบลราชธานี', destination: 'กรุงเทพอภิวัฒน์', departureTime: '06:00', routeNo: '9072'),
  TrainSchedule(departure: 'กรุงเทพอภิวัฒน์', destination: 'หนองคาย', departureTime: '07:00', routeNo: '9075'),
  TrainSchedule(departure: 'หนองคาย', destination: 'กรุงเทพอภิวัฒน์', departureTime: '07:00', routeNo: '9076'),
  TrainSchedule(departure: 'กรุงเทพอภิวัฒน์', destination: 'ชุมทางแก่งคอย', departureTime: '05:20', routeNo: '339'),
  TrainSchedule(departure: 'ชุมทางแก่งคอย', destination: 'กรุงเทพอภิวัฒน์', departureTime: '08:45', routeNo: '340'),
  TrainSchedule(departure: 'นครราชสีมา', destination: 'หนองคาย', departureTime: '06:20', routeNo: '415'),
  TrainSchedule(departure: 'หนองคาย', destination: 'นครราชสีมา', departureTime: '12:55', routeNo: '418'),
  TrainSchedule(departure: 'นครราชสีมา', destination: 'อุบลราชธานี', departureTime: '06:10', routeNo: '421'),
  TrainSchedule(departure: 'อุบลราชธานี', destination: 'นครราชสีมา', departureTime: '12:35', routeNo: '426'),
  TrainSchedule(departure: 'นครราชสีมา', destination: 'อุดรธานี', departureTime: '15:55', routeNo: '417'),
  TrainSchedule(departure: 'อุดรธานี', destination: 'นครราชสีมา', departureTime: '05:15', routeNo: '416'),
  TrainSchedule(departure: 'นครราชสีมา', destination: 'อุบลราชธานี', departureTime: '14:20', routeNo: '427'),
  TrainSchedule(departure: 'อุบลราชธานี', destination: 'นครราชสีมา', departureTime: '06:20', routeNo: '428'),
  TrainSchedule(departure: 'นครราชสีมา', destination: 'ชุมทางบัวใหญ่', departureTime: '17:55', routeNo: '429'),
  TrainSchedule(departure: 'ชุมทางบัวใหญ่', destination: 'นครราชสีมา', departureTime: '05:50', routeNo: '430'),
  TrainSchedule(departure: 'ชุมทางแก่งคอย', destination: 'ลำนารายณ์', departureTime: '16:55', routeNo: '437'),
  TrainSchedule(departure: 'ลำนารายณ์', destination: 'ชุมทางแก่งคอย', departureTime: '06:05', routeNo: '438'),
  TrainSchedule(departure: 'ชุมทางแก่งคอย', destination: 'ชุมทางบัวใหญ่', departureTime: '11:45', routeNo: '439'),
  TrainSchedule(departure: 'ชุมทางบัวใหญ่', destination: 'ชุมทางแก่งคอย', departureTime: '05:50', routeNo: '440'),
  TrainSchedule(departure: 'กรุงเทพอภิวัฒน์', destination: 'ทุ่งสน', departureTime: '05:00', routeNo: '9085'),
  TrainSchedule(departure: 'ทุ่งสน', destination: 'กรุงเทพอภิวัฒน์', departureTime: '05:00', routeNo: '9086'),
  TrainSchedule(departure: 'หลังสวน', destination: 'ธนบุรี', departureTime: '05:45', routeNo: '254'),
  TrainSchedule(departure: 'ธนบุรี', destination: 'หลังสวน', departureTime: '07:30', routeNo: '255'),
  TrainSchedule(departure: 'ธนบุรี', destination: 'น้ำตก', departureTime: '07:50', routeNo: '257'),
  TrainSchedule(departure: 'น้ำตก', destination: 'ธนบุรี', departureTime: '12:55', routeNo: '258'),
  TrainSchedule(departure: 'สุราษฎร์ธานี', destination: 'คีรีรัฐนิคม', departureTime: '16:55', routeNo: '489'),
  TrainSchedule(departure: 'คีรีรัฐนิคม', destination: 'สุราษฎร์ธานี', departureTime: '06:00', routeNo: '490'),
];

class _ScheduleListPageState extends State<ScheduleListPage> {
  List<TrainSchedule> _trainSchedules = trainSchedules;
  String? _selectedDepartureStation;
  String? _selectedDestinationStation;
  DateTime _selectedDate = DateTime.now(); // Default to current date

  List<String> getUniqueStations(List<TrainSchedule> schedules) {
    Set<String> uniqueStations = Set();
    for (var schedule in schedules) {
      uniqueStations.add(schedule.departure);
      uniqueStations.add(schedule.destination);
    }
    return uniqueStations.toList();
  }

  List<TrainSchedule> getFilteredSchedules() {
      DateTime now = DateTime.now();
  
  if (_selectedDepartureStation != null && _selectedDestinationStation != null) {
    return _trainSchedules.where((schedule) =>
        schedule.departure == _selectedDepartureStation &&
        schedule.destination == _selectedDestinationStation &&
        DateTime.parse(schedule.departureTime).isAfter(_selectedDate)).toList();
  } else if (_selectedDepartureStation != null) {
    return _trainSchedules.where((schedule) =>
        schedule.departure == _selectedDepartureStation &&
        DateTime.parse(schedule.departureTime).isAfter(_selectedDate)).toList();
  } else if (_selectedDestinationStation != null) {
    return _trainSchedules.where((schedule) =>
        schedule.destination == _selectedDestinationStation &&
        DateTime.parse(schedule.departureTime).isAfter(_selectedDate)).toList();
  }
  return _trainSchedules.where((schedule) =>
      DateTime.parse(schedule.departureTime).isAfter(_selectedDate)).toList();
}


  void clearFilters() {
    setState(() {
      _selectedDepartureStation = null;
      _selectedDestinationStation = null;
      _trainSchedules = trainSchedules;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    List<String> uniqueStations = getUniqueStations(_trainSchedules);

    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 148, 137, 121),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(200, 148, 137, 121),
        title: Text('Train Schedule'),
        actions: [
          if (_trainSchedules.isNotEmpty)
            IconButton(
              icon: Icon(Icons.airplane_ticket_rounded),
              onPressed: () {
                if (_selectedDepartureStation != null &&
                    _selectedDestinationStation != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PurchasePage(
                        // Pass purchased ticket info to PurchasePage
                        totalPrice: 0, // Replace with actual total price
                        trainSchedule: _trainSchedules.first,
                        selectedSeats: ['', ''], // Replace with actual selected seats
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select departure and destination stations.'),
                    ),
                  );
                }
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Color.fromARGB(255, 223, 208, 184),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text('Departure Station',style: TextStyle(fontWeight: FontWeight.w700,),),
                        trailing: DropdownButton<String>(
                          value: _selectedDepartureStation,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedDepartureStation = newValue;
                              _trainSchedules = getFilteredSchedules();
                            });
                          },
                          items: uniqueStations.map<DropdownMenuItem<String>>((String station) {
                            return DropdownMenuItem<String>(
                              value: station,
                              child: Text(station),
                            );
                          }).toList(),
                        ),
                      ),
                      ListTile(
                        title: Text('Destination Station',style: TextStyle(fontWeight: FontWeight.w700,),),
                        trailing: DropdownButton<String>(
                          value: _selectedDestinationStation,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedDestinationStation = newValue;
                              _trainSchedules = getFilteredSchedules();
                            });
                          },
                          items: uniqueStations.map<DropdownMenuItem<String>>((String station) {
                            return DropdownMenuItem<String>(
                              value: station,
                              child: Text(station),
                            );
                          }).toList(),
                        ),
                      ),
                      ListTile(
                        title: Text('Date of Travel',style: TextStyle(fontWeight: FontWeight.w700,),),
                        trailing: TextButton(
                          onPressed: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 1),
                            );
                            if (pickedDate != null && pickedDate != _selectedDate) {
                              setState(() {
                                _selectedDate = pickedDate;
                              });
                            }
                          },
                          child: Text(
                            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',style: TextStyle(fontWeight: FontWeight.w700,),
                          ),
                        ),
                      ),
                      ListTile(
                        title: TextButton(
                          onPressed: clearFilters,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8.0), // Adjust the padding as needed
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0), // Adjust the border radius as needed
                                  ),
                            backgroundColor: Color.fromARGB(255, 60, 91, 111),
                          ),
                          child: Text('CLEAR',style: 
                            TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Train Schedules:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _trainSchedules.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromARGB(255, 223, 208, 184),
                    child: ListTile(
                      title: Text('ขบวนที่ ${_trainSchedules[index].routeNo} ${_trainSchedules[ index].departure} - ${_trainSchedules[index].destination}'),

                      subtitle: Text('เวลาออก ${_trainSchedules[index].departureTime} '),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CabinSeatPage(
                              trainSchedule: _trainSchedules[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
