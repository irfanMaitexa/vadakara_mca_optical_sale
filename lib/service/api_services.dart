import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:optical_sale/modules/user/cart_list_screen.dart';
import 'package:optical_sale/modules/user/user_order_confirm_screen.dart';
import 'package:optical_sale/service/db_service.dart';

class ApiServiece {
  final baseUrl = 'https://optical-management-system.onrender.com';

  Future<void> registerUser(String name, String email, String phone,
      String password, BuildContext context) async {
    final url = Uri.parse('$baseUrl/api/register/user');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        },
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data['Message'])));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data['Message'])));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> loginUser(
      String email, String password, BuildContext context) async {
    final url = Uri.parse('$baseUrl/api/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'email': email,
          'password': password,
        },
      );

      print(url);

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        DbService.setLoginId(data['login_id']);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data['message'])));

        return data['role'];
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data['Message'])));
      }
    } catch (e) {
      rethrow;
    }
  }

//change password
  Future<void> changePassword(BuildContext context, String loginId,
      String password, String newPassword) async {
    final url = Uri.parse('$baseUrl/api/register/pass-change/$loginId');
    final body = {'password': password, 'new_password': newPassword};

    try {
      final response = await http.put(
        url,
        body: body,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        encoding: Encoding.getByName('utf-8'),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password changed successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Failed to change password. Error: ${response.statusCode}'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occurred: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

//

  Future<List<dynamic>> fetchglasses(String cat) async {
    final url = Uri.parse('$baseUrl/api/view-prod/$cat');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load!!!!');
    }
  }

  //view doctores

  Future<List<dynamic>> fetchDoctors() async {
    final response = await http.get(Uri.parse('$baseUrl/api/view-doctors'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      return parsed['data'];
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  //add cart

  Future<void> addToCart(BuildContext context, String loginId, String productId,
      String price) async {
    try {
      var url = Uri.parse('$baseUrl/api/user/add-cart/$loginId/$productId');

      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          'price': price,
        },
      );

      if (response.statusCode == 200) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Item added'),
              action: SnackBarAction(
                label: 'go to cart',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserCartListScreen(),
                      ));
                },
              ),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to add item to cart'),
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adding item to cart: $e'),
          ),
        );
      }
    }
  }

  Future<void> addUserAddress(
      String loginId, Map<String, dynamic> data, BuildContext context) async {
    final url = Uri.parse('$baseUrl/api/user/add-address/$loginId');

    print(url);
    try {
      final response = await http.post(
        url,
        body: data,
      );

      if (response.statusCode == 201) {
        // Request successful
        var data = jsonDecode(response.body)['data'];

        Navigator.pop(context, data);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Address added successfully')),
        );
      } else {
        // Request failed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Failed to add address. Please try again later.')),
        );
      }
    } catch (e) {
      // Exception occurred
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'An error occurred while adding the address. Please try again later.')),
      );
    }
  }

//place order

  Future<void> placeOrder(BuildContext context) async {
    try {
      var url = Uri.parse(
          '$baseUrl/api/user/place-order-prod/${DbService.getLoginId()}');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Order placed sccessfully')),
          );

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderConfirmScreen(),
              ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error placing order. Please try again later.')),
        );
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error placing order. Please try again later.')),
      );
    }
  }


    Future<List<dynamic>> fetchUserOrdes() async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/view-order/${DbService.getLoginId()}'),
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

  //
    Future<List<dynamic>> fetchCartItems(String loginId) async {
    final url = Uri.parse('$baseUrl/api/user/view-cart/$loginId');
    final response = await http.get(url);

    
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      
      return jsonData['data'];
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  //fetch 
  Future<List<dynamic>> fetchDocBookings(String loginId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/user/view-doc-booking/$loginId'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  //doc booking

  Future<void> bookDoctor(BuildContext context,String docId,String date) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/user/doctor-booking/${DbService.getLoginId()}/$docId'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'date': date,
      
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('successful'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed'),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error making POST request: $e'),
      ),
    );
  }
}

 //fetch all product
 Future<List<dynamic>> fetchAllProduct() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/view-prod'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  //book service
  Future<void> bookService(BuildContext context, String loginId, String date, String complaint) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/user/service-booking/$loginId'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'date': date,
        'complaint': complaint,
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Service booking successful'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to make service booking. Status code: ${response.statusCode}'),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error making service booking: $e'),
      ),
    );
  }
}


}
