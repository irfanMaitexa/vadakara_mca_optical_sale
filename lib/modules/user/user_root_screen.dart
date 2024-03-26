
import 'package:flutter/material.dart';
import 'package:optical_sale/modules/user/cart_list_screen.dart';
import 'package:optical_sale/modules/user/home_screen.dart';
import 'package:optical_sale/modules/user/profile/user_profile_screen.dart';
import 'package:optical_sale/modules/user/user_booking_list.dart';
import 'package:optical_sale/service/db_service.dart';
import 'package:optical_sale/utils/constants.dart';


class UserRootScreen extends StatefulWidget {
  const UserRootScreen({super.key});

  @override
  State<UserRootScreen> createState() => _UserRootScreenState();
}

class _UserRootScreenState extends State<UserRootScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pagesList =  [

    UserHomeScreen(),

    UserBookingList(loginId: DbService.getLoginId()!,),

    UserCartListScreen(),
    UserProfileScreen(),
  
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: _pagesList[_selectedIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
    splashColor: Colors.transparent,
    
  ),

        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          selectedItemColor:  KButtonColor,
          unselectedItemColor: Colors.grey,
          useLegacyColorScheme: false,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'cart',
            ),
            
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}