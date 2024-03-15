import 'package:flutter/material.dart';
import 'package:optical_sale/modules/auth/login.dart';
import 'package:optical_sale/modules/staff/staff_add_frames.dart';
import 'package:optical_sale/modules/staff/staff_add_glasses.dart';
import 'package:optical_sale/modules/staff/staff_add_lense_screen.dart';
import 'package:optical_sale/modules/staff/staff_view_service.dart';
import 'package:optical_sale/utils/constants.dart';
import 'package:optical_sale/widgets/custom_card.dart';


class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({super.key});

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {
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
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            CardWidget(
              iconData: Icons.add,
              title: 'Add Glass',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  StaffAddGlassScreen(),
                    ));
              },
            ),
            CardWidget(
              iconData: Icons.rectangle_outlined,
              title: 'Add Frame',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StaffAddFrameScreen();
                }));
              },
            ),
            CardWidget(
              iconData: Icons.lens_outlined,
              title: 'Add Lense',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StaffAddLenseScreen(),
                  ),
                );
              },
            ),
            CardWidget(
              iconData: Icons.playlist_add_check,
              title: 'View Service',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StaffViewServiceScreen(),
                  ),
                );
              },
            ),
           
            CardWidget(
                iconData: Icons.logout,
                title: 'Logout',
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false);
                }),
          ],
        ),
      
      
      
      
      ),
    );
  }
}
