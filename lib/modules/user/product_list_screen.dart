import 'package:flutter/material.dart';
import 'package:optical_sale/modules/user/cart_list_screen.dart';
import 'package:optical_sale/widgets/custom_button.dart';

class ProductListNew extends StatefulWidget {
  const ProductListNew({Key? key, required this.name}) : super(key: key);

  final String? name;

  @override
  State<ProductListNew> createState() => _ProductListNewState();
}

class _ProductListNewState extends State<ProductListNew> {
  @override
  void initState() {
    super.initState();
  }

  List productsList = [
    'https://img.freepik.com/free-photo/sunglasses_1203-8703.jpg?size=626&ext=jpg&ga=GA1.1.1672774589.1699860837&semt=ais',
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int? check;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          widget.name ?? 'category',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey)),
              child: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          var customOutlineButton = CustomButton(
            text: 'add',
            onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserCartListScreen(),
                ),
              );
            },
          );
          return GestureDetector(
            onTap: () {
             
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const Image(
                        image: NetworkImage(
                          'https://img.freepik.com/free-photo/sunglasses_1203-8703.jpg?size=626&ext=jpg&ga=GA1.1.1672774589.1699860837&semt=ais',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, bottom: 15, top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('name'),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            width: 120,
                            child: Text(
                              "Honey: Nature's Sweet Elixir",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '₹80',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 3),
                                  ),
                                  Text(
                                    '₹180',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      decorationThickness: 3,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: customOutlineButton),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .6,
        ),
      ),
    );
  }
}
