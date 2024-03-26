import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:optical_sale/widgets/custom_button.dart';

class UserBookingList extends StatefulWidget {
  final String loginId;

  UserBookingList({required this.loginId});

  @override
  _UserBookingListState createState() => _UserBookingListState();
}

class _UserBookingListState extends State<UserBookingList> {
  late Future<List<dynamic>> futureAppointments;

  @override
  void initState() {
    super.initState();
    futureAppointments = fetchAppointments();
  }

  Future<List<dynamic>> fetchAppointments() async {
    final response = await http.get(
      Uri.parse('http://localhost:8080/api/user/view-order/${widget.loginId}'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      print(jsonData);
      final List<dynamic> data = jsonData['Data'];
      return data;
    } else {
      throw Exception('Failed to load appointments');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Booking List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: futureAppointments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final appointment = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.event),
                      title: Text('${appointment['products_data']['brand']} ${appointment['products_data']['model']}'),
                      subtitle: Text('Price: ${appointment['price']}'),
                      trailing: CustomButton(
                        onPressed: () {
                         
                        },
                        text: 'View More',
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}