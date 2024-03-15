import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optical_sale/widgets/custom_button.dart';
import 'package:optical_sale/widgets/custom_text_field.dart';

class StaffAddLenseScreen extends StatefulWidget {
  const StaffAddLenseScreen({super.key});

  @override
  State<StaffAddLenseScreen> createState() => _StaffAddLenseScreenState();
}

class _StaffAddLenseScreenState extends State<StaffAddLenseScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  void _getFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
  }

  void _getFromgallary() async {
    image = await picker.pickImage(source: ImageSource.gallery);
  }

  String selectedGlass = 'EYE GLASS';

  final _nameController = TextEditingController();
  final _description = TextEditingController();
  final _priceController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Lense'),
      ),

      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CustomButton(
          text: 'Add',
          onPressed: () {

          
            
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            fixedSize: const Size(150, 50)),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            fixedSize: Size(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                50)),
                                        onPressed: () {
                                          _getFromCamera();
                                          Navigator.pop(context);
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.camera_alt_outlined),
                                            Text("Take a photo")
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            fixedSize: Size(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                50)),
                                        onPressed: () {
                                          _getFromgallary();
                                          Navigator.pop(context);
                                        },
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(CupertinoIcons
                                                .photo_on_rectangle),
                                            Text("Upload from gallary")
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text("Add photo")),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        print(image!.path);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: image == null
                                ? const Text("upload image")
                                : Image(image: FileImage(File(image!.path))),
                          ),
                        );
                      },
                      icon: const Icon(
                        CupertinoIcons.eye,
                        size: 30,
                      ))
                ],
              ),
              
             
             
             
              SizedBox(height: 20,),
              
             
              CustomTextField(
                hintText: 'Enter name',
                controller: _nameController,
                borderColor: Colors.grey,
              ),
               SizedBox(
                height: 20,
              ),
              
              CustomTextField(
                hintText: 'Enter description',
                controller: _description,
                borderColor: Colors.grey,
              ),
               SizedBox(
                height: 20,
              ),

              CustomTextField(
                hintText: 'Enter price',
                controller: _priceController,
                borderColor: Colors.grey,
              ),


              




            ],
          ),
        ),
      ),
    );
  }
}
