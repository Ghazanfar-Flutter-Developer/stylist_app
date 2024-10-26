import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:savey_econers/screen/authentication/signup_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  String? userName;
  String? userEmail;
  File? _image;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection(
              'users') // Make sure your Firestore collection is named 'users'
          .doc(user.uid) // Get the document for the current user
          .get();
      setState(() {
        userName =
            doc['name']; // Assuming you have a 'name' field in your Firestore
        userEmail = doc[
            'email']; // Assuming you have an 'email' field in your Firestore
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // You may want to upload the image to Firebase Storage here
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: size.height * 0.4,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: _pickImage, // Allow image upload
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 42,
                                        backgroundImage: _image != null
                                            ? FileImage(_image!)
                                            : const AssetImage(
                                                    "assets/images/Profile1.jpg")
                                                as ImageProvider,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(
                                                255, 95, 225, 99),
                                          ),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.black54)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 9, horizontal: 12),
                                      child: const Text(
                                        "ADD FRIEND",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: () async {
                                        await FirebaseAuth.instance.signOut();
                                        Navigator.push(
                                            // ignore: use_build_context_synchronously
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignupScreen(),
                                            ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.pink,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12),
                                        child: const Icon(
                                          Icons.logout,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 7),
                            Text(
                              userName ?? "User Name",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 30),
                            ),
                            Text(
                              userEmail ?? "User Email",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black45),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "A Flutter developer is a software engineer who has proficiency with the Flutter framework to develop mobile, web,",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
