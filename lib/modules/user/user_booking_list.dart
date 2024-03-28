import 'package:flutter/material.dart';
import 'package:optical_sale/service/api_services.dart';
import 'package:optical_sale/service/db_service.dart';
import 'package:optical_sale/widgets/custom_button.dart';

class UserBookingList extends StatefulWidget {
  final String loginId;

  UserBookingList({Key? key, required this.loginId}) : super(key: key);

  @override
  _UserBookingListState createState() => _UserBookingListState();
}

class _UserBookingListState extends State<UserBookingList> {
  late Future<List<dynamic>> futureAppointments;
  late Future<List<dynamic>> futureDocServiceList;

  @override
  void initState() {
    super.initState();
    futureDocServiceList =
        ApiServiece().fetchDocBookings(DbService.getLoginId()!);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Booking List'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Orders'),
              Tab(text: 'Service Booking'),
              Tab(text: 'Doctor Booking'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.event),
                      title: const Text('Product'),
                      subtitle: const Text('Price:'),
                      trailing: CustomButton(
                        onPressed: () {},
                        text: 'View More',
                      ),
                    ),
                  ),
                );
              },
            ),

            // Placeholder for Service Booking tab
            const Center(child: Text('Service Booking Tab')),
            // Placeholder for Doctor Booking tab

            FutureBuilder<List<dynamic>>(
                future: futureDocServiceList,
                builder: (context, snapshot) {

                
                  if (snapshot.connectionState == ConnectionState.waiting) {
                     
                    return const Center(child: CircularProgressIndicator(color: Colors.teal,));
                  } else if (snapshot.hasError) {
                   
                     
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {

                    
                    return snapshot.data!.length == 0 ?Center(child: Text('no  data'),) :
                    ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                       

                        
                        final appointment = snapshot.data![index];
                      
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.teal),
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.event),
                              title: const Text('Product'),
                              subtitle: const Text('Price:'),
                              trailing: CustomButton(
                                onPressed: () {},
                                text: 'View More',
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
