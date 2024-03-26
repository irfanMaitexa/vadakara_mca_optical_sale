import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  

}
