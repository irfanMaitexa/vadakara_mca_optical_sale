import 'package:flutter/material.dart';


import 'package:optical_sale/service/api_services.dart';
import 'package:optical_sale/service/db_service.dart';
import 'package:optical_sale/widgets/custom_button.dart';

class DoctorListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ApiServiece().fetchDoctors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic> doctors = snapshot.data!;
            return ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                var doctor = doctors[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(doctor['name']),
                    subtitle: Text(doctor['email']),
                    trailing: CustomButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Enter Something'),
                              content: const TextField(
                                decoration:
                                    InputDecoration(hintText: 'Type here...'),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('CANCEL'),
                                ),
                                CustomButton(
                                  text: 'Book',
                                  onPressed: () {
                                    ApiServiece().bookDoctor(
                                        context,
                                        '${ApiServiece().baseUrl}/api/user/doctor-booking/${DbService.getLoginId()}/$doctor',
                                        {'date': '28-03-2024'});
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      text: 'Book Now',
                    ),
                    onTap: () {
                      // Add navigation logic here
                    },
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
