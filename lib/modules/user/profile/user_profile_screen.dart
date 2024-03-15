import 'package:flutter/material.dart';
import 'package:optical_sale/modules/auth/login.dart';
import 'package:optical_sale/modules/user/profile/user_edit_screen.dart';
import 'package:optical_sale/widgets/custom_button.dart';
import 'package:optical_sale/widgets/custom_text_field.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Text('logout'),
              IconButton(onPressed: () {

                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
                
              }, icon: Icon(Icons.logout),)
            ],
          ),
          const CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D'),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextField(
              hintText: 'name',
              controller: _nameController,
              isEnabled: false,
              borderColor: Colors.grey.shade500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextField(
              hintText: 'email',
              controller: _nameController,
              isEnabled: false,
              borderColor: Colors.grey.shade500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextField(
              hintText: 'phone',
              controller: _nameController,
              isEnabled: false,
              borderColor: Colors.grey.shade500,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: CustomButton(
              text: 'Edit',
              color: Colors.teal,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserEditProfileScreen(),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
