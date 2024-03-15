import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:optical_sale/modules/user/book_eye_specialist.dart';
import 'package:optical_sale/modules/user/book_service_screen.dart';
import 'package:optical_sale/modules/user/cart_list_screen.dart';
import 'package:optical_sale/modules/user/product_Details_screen.dart';
import 'package:optical_sale/modules/user/product_list_screen.dart';
import 'package:optical_sale/utils/constants.dart';
import 'package:optical_sale/widgets/custom_button.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final categoryList = [
    'https://e7.pngegg.com/pngimages/299/791/png-clipart-sunglasses-eyewear-glasses-black-glasses-thumbnail.png',
    'https://img.freepik.com/free-photo/sunglasses_1203-8703.jpg?size=626&ext=jpg&ga=GA1.1.1672774589.1699860837&semt=ais',
    'https://img.freepik.com/free-photo/sunglasses_1203-8703.jpg?size=626&ext=jpg&ga=GA1.1.1672774589.1699860837&semt=ais'
  ];

  final popularProduct = [
    'https://e7.pngegg.com/pngimages/299/791/png-clipart-sunglasses-eyewear-glasses-black-glasses-thumbnail.png',
    'https://img.freepik.com/free-photo/sunglasses_1203-8703.jpg?size=626&ext=jpg&ga=GA1.1.1672774589.1699860837&semt=ais',
    'https://img.freepik.com/free-photo/sunglasses_1203-8703.jpg?size=626&ext=jpg&ga=GA1.1.1672774589.1699860837&semt=ais'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: KButtonColor,
          leading: const Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.white,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: KButtonColor,
          padding:
                const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 30),
          child: SizedBox(
                height: 49,
                child: CustomButton(
                  color: Colors.white,
                  texColor: Colors.teal,
                  onPressed: () {

                     print('fff');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookServiceScreen(),
                    ));

                    
                  },
                  text: 'Book Service',
                ),
              ),
        ),
        Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 180,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    clipBehavior: Clip.hardEdge,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                      ),
                      items: [
                        'https://img.freepik.com/free-photo/mechanic-repairing-bicycle_23-2148138617.jpg?w=1380&t=st=1708497923~exp=1708498523~hmac=db0aa97cb4ebd6cb6b1a4e4f5a8da5d25d20e4a8be9b4bb5abeb10a7cbbcc7d0',
                        'https://img.freepik.com/free-photo/mechanic-repairing-bicycle_23-2148138617.jpg?w=1380&t=st=1708497923~exp=1708498523~hmac=db0aa97cb4ebd6cb6b1a4e4f5a8da5d25d20e4a8be9b4bb5abeb10a7cbbcc7d0'
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(i),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 30),
                                  )),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    height: 50,
                    child: CustomButton(
                      text: 'Book  eye specialist',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookEyeSpecialist(),
                          ),
                        );
                      },
                    ),
                  ),

                  //category
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Category',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductListNew(
                                        name: 'sun glass',
                                      ),
                                    ));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    color: KButtonColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(categoryList[index]),
                                      radius: 50,
                                    ),
                                    const Text(
                                      'Glases',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Trending products',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),

                  Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UserProductDetailsScreen(
                                        name: 'name',
                                        imageUrl: popularProduct[index],
                                      ),
                                    ));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: KButtonColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                        popularProduct[index],
                                      ),
                                      width: 60,
                                      height: 60,
                                    ),
                                    const Text(
                                      'product name',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    CustomButton(
                                      text: 'Add',
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const UserCartListScreen(),
                                            ));
                                      },
                                    )
                                  ],
                                ),
                              ),
                            )),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
