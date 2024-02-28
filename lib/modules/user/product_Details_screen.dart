import 'package:flutter/material.dart';
import 'package:optical_sale/modules/user/cart_list_screen.dart';
import 'package:optical_sale/widgets/custom_button.dart';

class UserProductDetailsScreen extends StatelessWidget {
  const UserProductDetailsScreen(
      {super.key, required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Card(
                color: Colors.white,
                elevation: .6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Card(
              elevation: .6,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 18),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: .6,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Expanded(
                        child: const Text(
                      'Sunglasses are stylish eyewear designed to protect the eyes from sunlight and UV rays. They come in various shapes, sizes, and colors to suit different face shapes and fashion preferences. With their tinted lenses, sunglasses reduce glare and improve visual comfort outdoors.',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '100',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CustomButton(
                        text: 'Add to Cart',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserCartListScreen(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
