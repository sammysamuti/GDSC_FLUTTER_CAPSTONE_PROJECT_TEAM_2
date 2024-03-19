

import 'dart:convert'; // Import for base64 encoding
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/pages/FireBase/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class EditProduct extends StatefulWidget {
  EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  // final Firebase_auth_service _auth = Firebase_auth_service();
  // late final Firebase_auth_service _auth;
  String? _selectedSize;
  File? _image;
  List<String> size = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];

  final Name = TextEditingController();
  final Price = TextEditingController();
  final Description = TextEditingController();
  String _imageUrl = "FrontPage_asset/image/front_girl.png";

  bool ischecked = false;


Future<void> _imagePicker() async {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image == null) return;

  if (kIsWeb) {
    // Convert image data to base64 for web
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);
    setState(() {
      _imageUrl = 'data:image/jpeg;base64,$base64Image';
    });
  } else {
    // For mobile platforms, set the image directly
    final imageTemp = File(image.path);
    setState(() {
      _image = imageTemp;
    });
  }
}


  @override
  void dispose() {
    Name.dispose();
    Price.dispose();
    Description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                    padding: EdgeInsets.only(
              top: height * 0.05, left: width * 0.1, right: width * 0.1),
                    child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Edit Product",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                height: height * 0.03,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: height * 0.1,
                      width: width * 0.5,
                      child: ElevatedButton(
                        onPressed: _imagePicker,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              side: const BorderSide(
                                  color: Color(0XFF6055D8)), // Adjust border color here
                            ),
                          ),
                          
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_upload_outlined,
                              color: Color(0XFF6055D8),
                            ),
                            Text(
                              "Upload product picture",
                              style: TextStyle(color: Color(0XFF6055D8)),
                            ),
                          ],
                        ), // Add your button text here
                      ),
                    ),
                  _imageUrl != null
                  ? Image.network(
                      _imageUrl,
                      width: width * 0.5,
                      height: height * 0.1,
                    )
                  : Image.asset("FrontPage_asset/image/front_girl.png"),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "Product Name",
                style: TextStyle(color: Colors.black),
              ),
              textfield(
                "Nike shoes",
                Name,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "Product Price",
                style: TextStyle(color: Colors.black),
              ),
              textfield(
                "\$200",
                Price,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                "Product Description",
                style: TextStyle(color: Colors.black),
              ),
              textfield("Description", Description),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                "Product Size",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              DropdownButton<String>(
                value: _selectedSize,
                hint: Text("Select Size"),
                items: size.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSize = newValue!;
                  });
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.8,
                    child: ElevatedButton(
                      onPressed: _addProduct,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF6055D8)),
                      child: Text(
                        "Edit Product ",
                        style: TextStyle(color: Colors.white),
                      ), // Add your button text here
                    ),
                  ),
                ],
              ),
             

             
            ],
                    ),
                  ),
          )),
    );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some action to take when the user presses the action button
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _addProduct() async {
    String name = Name.text;
    double price = Price.text as double;
    String description = Description.text;
  }
}

Widget textfield(
  String hint,
  TextEditingController controller,
) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontStyle: FontStyle.italic,
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0XFF6055D8)),
      ),
    ),
  );
}
