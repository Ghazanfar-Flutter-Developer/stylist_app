import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:savey_econers/res/colors.dart';
import 'package:savey_econers/res/components/bottom_nav_bar.dart';
import 'package:savey_econers/res/components/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  String? selectBudget;
  List<String> budgetOptions = [
    "\$ 1 To 10",
    "\$ 10 To 20",
    "\$ 20 To 50",
    "\$ 50 To 80",
    "\$ 80 To 100",
  ];

  Future<void> signUpUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );

      // Store user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'name': nameController.text.trim(),
        'favoriteColor': colorController.text.trim(),
        'budget': selectBudget,
        'email': emailcontroller.text.trim(),
      });

      // Navigate to profile page or display success message
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      // Handle error, e.g., display an alert dialog with `e.message`
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              TextFieldT(
                title: 'Enter Full Name',
                controller: nameController,
                type: TextInputType.text,
              ),
              const SizedBox(height: 10),
              TextFieldT(
                title: 'Enter Color Name',
                controller: colorController,
                type: TextInputType.text,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.orange.shade100,
                    filled: true,
                    labelText: 'Select You Budget',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  items: budgetOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {}),
              const SizedBox(height: 10),
              TextFieldT(
                title: 'Enter Email',
                controller: emailcontroller,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              TextFieldT(
                title: 'Enter Password',
                controller: passwordcontroller,
                type: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  signUpUser();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBar(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.kprimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
