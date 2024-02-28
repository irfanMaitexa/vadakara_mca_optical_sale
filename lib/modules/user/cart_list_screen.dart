import 'package:flutter/material.dart';
import 'package:optical_sale/modules/user/user_check_out_screen.dart';
import 'package:optical_sale/widgets/cart_item_card.dart';
import 'package:optical_sale/widgets/custom_button.dart';

class UserCartListScreen extends StatefulWidget {
  const UserCartListScreen({super.key});

  @override
  State<UserCartListScreen> createState() => _UserCartListScreenState();
}

class _UserCartListScreenState extends State<UserCartListScreen> {


@override
  void initState() {

    print('ffff');
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  '₹100',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                text: 'Check Out',
                onPressed: () {
                  print('fffffff');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckOut(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemBuilder: (context, index) => ItemCard(
            name: 'sun glass',
            imageUrl:
                'https://img.freepik.com/free-photo/sunglasses_1203-8703.jpg?size=626&ext=jpg&ga=GA1.1.1672774589.1699860837&semt=ais',
          ),
        ),
      ),
    );
  }
}
