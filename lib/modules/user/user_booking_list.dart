import 'package:flutter/material.dart';
import 'package:optical_sale/modules/user/user_booking_details.dart';
import 'package:optical_sale/widgets/custom_button.dart';

class UserBookingList extends StatefulWidget {
  @override
  _UserBookingListState createState() => _UserBookingListState();
}

class _UserBookingListState extends State<UserBookingList> {
  List<Appointment> appointments = [
    Appointment(icon: Icons.event, bookingDate: '2024-03-10'),
    Appointment(icon: Icons.event, bookingDate: '2024-03-15'),
    Appointment(icon: Icons.event, bookingDate: '2024-03-20'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Booking List'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.teal), // Set border color to teal
              ),
              child: ListTile(
                leading: Icon(appointments[index].icon),
                title: Text(appointments[index].bookingDate),
                trailing: CustomButton(
                  // Use CustomButton widget for the 'View More' button
                  onPressed: () {
                    // Handle View More button press

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const  BookingDetailsScreen(),
                      ),
                    );
                  },
                  text: 'View More',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Appointment {
  final IconData icon;
  final String bookingDate;

  Appointment({required this.icon, required this.bookingDate});
}
