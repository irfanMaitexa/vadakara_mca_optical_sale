
import 'package:flutter/material.dart';
import 'package:optical_sale/utils/validator.dart';
import 'package:optical_sale/widgets/custom_button.dart';
import 'package:optical_sale/widgets/custom_text_field.dart';


class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  State<UserRegistrationScreen> createState() =>
      _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  String? emailError;
  String? passwordError;

  bool _obscureText = true;

  final _nameControllers = TextEditingController();
  final _phoneControllers = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _userRegisterFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameControllers.dispose();
    _phoneControllers.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'SignUp',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _userRegisterFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                CustomTextField(
                  hintText: 'Enter name',
                  controller: _nameControllers,
                  borderColor: Colors.grey.shade300,
                  validator: (value) => fieldValidate(value, 'name'),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Enter phone',
                  controller: _phoneControllers,
                  input: TextInputType.number,
                  borderColor: Colors.grey.shade300,
                   validator: (value) => fieldValidate(value, 'phone'),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Enter email',
                  controller: _emailController,
                
                  input: TextInputType.number,
                  borderColor: Colors.grey.shade300,
                   validator: (value) => validateEmail(value),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Enter password',
                  controller: _passwordController,
                  validator: (value) => validatePassword(value),
                  obscureText: _obscureText,
                  borderColor: Colors.grey.shade300,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Confirm password',
                  controller: _confirmPasswordController,
                  borderColor: Colors.grey.shade300,
                  
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomButton(
                    text: 'SIGN UP',
                    onPressed: () {
                      _signUpHandler(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signUpHandler(BuildContext context) {
    setState(() {
      
      if (_userRegisterFormKey.currentState!.validate()) {
        if (_passwordController.text == _confirmPasswordController.text) {
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password not match')));
        }
      } 
    });
  }
}