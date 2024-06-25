import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController namecontroller = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();
  String? imageUrl;
  bool isLoading = false;

  Future<void> pickImage() async {
    try {
      XFile? res = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (res != null) {
        await uploadProfilePic(File(res.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Faild To Upload $e"),
        ),
      );
    }
  }

  Future<void> uploadProfilePic(File image) async {
    setState(() {
      isLoading = true;
    });
    try {
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("images/${DateTime.now().millisecondsSinceEpoch}.png");
      await reference.putFile(image).whenComplete(
        () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Upload Successfully"),
            ),
          );
        },
      );
      imageUrl = await reference.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Faild To Upload $e"),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.arrow_left,
                      color: Colors.white,
                    ),
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "PoppinsB",
                        fontSize: 21,
                      ),
                    ),
                    Icon(
                      CupertinoIcons.question,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: CircleAvatar(
                  radius: 60,
                  child: InkWell(
                    onTap: () {
                      pickImage();
                    },
                    child: CircleAvatar(
                      radius: 60,
                      child: imageUrl == null
                          ? Icon(
                              CupertinoIcons.question,
                              size: 45,
                            )
                          : SizedBox(
                              height: 200,
                              width: 200,
                              child: ClipOval(
                                child: Image.network(
                                  imageUrl!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: namecontroller,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PoppinsB",
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 15),
                  backgroundColor: Colors.blueAccent.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection("user details");
                  collRef.add(
                    {
                      'Username': namecontroller. text,
                    },
                  );
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontFamily: "PoppinsB",
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
