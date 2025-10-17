import 'package:ecommerce/widgets/user/email_box.dart';
import 'package:ecommerce/widgets/user/gender_selector.dart';
import 'package:ecommerce/widgets/user/user_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage({super.key});
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = firebaseAuth.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Center(
                child: user?.photoURL != null && user!.photoURL!.isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL.toString()),
                      )
                    : const CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.person, size: 80),
                      ),
              ),
              SizedBox(height: 28),
              Text(
                'Account Details',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(height: 20),
              Text('Email Address'),
              SizedBox(height: 15),
              EmailBox(text: user!.email.toString()),
              SizedBox(height: 32),
              Container(height: 0.5, color: Colors.grey),
              SizedBox(height: 20),
              Text(
                'Personal Details',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(height: 10),
              UserTextfield(
                hintText: 'Full name',
                controller: userNameController,
                inputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              UserTextfield(
                controller: phoneNumberController,
                hintText: 'Phone number',
                inputType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              UserTextfield(
                controller: dateController,
                hintText: 'Date of birth',
                inputType: TextInputType.datetime,
              ),
              SizedBox(height: 20),
              GenderSelector(),
            ],
          ),
        ),
      ),
    );
  }
}
