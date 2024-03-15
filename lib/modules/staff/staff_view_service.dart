import 'package:flutter/material.dart';
import 'package:optical_sale/modules/staff/staff_service_details.dart';
import 'package:optical_sale/widgets/custom_button.dart';


class StaffViewServiceScreen extends StatefulWidget {
  const StaffViewServiceScreen({super.key});

  @override
  State<StaffViewServiceScreen> createState() =>
      _StaffViewServiceScreenState();
}

class _StaffViewServiceScreenState extends State<StaffViewServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            title: const Text('Bookings'),
            centerTitle: true,
          ),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            )),
                        child: ListTile(
                          onTap: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context) => StaffServiceDeatilsScreen(image: "https://img.freepik.com/free-photo/sunglasses_1203-8703.jpg?size=626&ext=jpg&ga=GA1.1.1672774589.1699860837&semt=ais"),));
                          },
    
                          leading: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                              "https://img.freepik.com/free-photo/sunglasses_1203-8703.jpg?size=626&ext=jpg&ga=GA1.1.1672774589.1699860837&semt=ais"
                            ),
                          ),
                          title: const Text(
                            'Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: const Text('booking time'),
                          trailing: CustomButton(
                            text: 'Accept',
                            onPressed: () {},
                          ),
                        ),
                      )))
        ],
      ),
    );
  }
}
