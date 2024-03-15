import 'package:flutter/material.dart';
import 'package:optical_sale/modules/auth/login.dart';
import 'package:optical_sale/modules/doctor/doctor_booking_list_screen.dart';
import 'package:optical_sale/utils/constants.dart';
import 'package:optical_sale/widgets/custom_card.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: KButtonColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
          child: Center(
        child: Row(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 2,
              child: CardWidget(
                iconData: Icons.add,
                title: 'View Booking',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorBookingListScreen(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width / 2,
              child: CardWidget(
                iconData: Icons.logout,
                title: 'Logout',
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false
                      );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
