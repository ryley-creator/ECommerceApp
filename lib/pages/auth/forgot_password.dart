import 'package:ecommerce/utils/funcs/auth.dart';
import 'package:ecommerce/widgets/login_container.dart';
import 'package:ecommerce/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final auth = Auth();
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 63),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Password?',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 32),
            Textfield(
              controller: email,
              hintText: 'Enter your email address',
              prefixIcon: Icon(Icons.email),
            ),
            SizedBox(height: 27),
            Text(
              '* We will send you a message to set or reset your new password',
            ),
            SizedBox(height: 26),
            GestureDetector(
              onTap: () async {
                await auth.sendPasswordResetLink(email.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('An email for password reset has been sent!'),
                  ),
                );
                context.pop('/login_page');
              },
              child: LoginContainer(text: 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
