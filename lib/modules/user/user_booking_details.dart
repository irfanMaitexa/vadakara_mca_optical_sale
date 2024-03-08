import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Booking Details'),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'QR Code',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: Container(
                width: MediaQuery.of(context).size.width,
                child:  QrImageView(
              data: 'booking',
              version: QrVersions.auto,
          
              gapless: false,
              backgroundColor: Colors.white,

              
            ),
                
              )),
             
              const Padding(
                padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   
                    Text(
                      'John Doe',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Divider(indent: 15,endIndent: 15,),
              const Padding(
                padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Age',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                 
                    Text(
                      '30',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
               const Divider(indent: 15,endIndent: 15,),
              const Padding(
                padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Booking Date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2024-03-10',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}


