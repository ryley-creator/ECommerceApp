import 'package:ecommerce/utils/funcs/auth.dart';
import 'package:ecommerce/widgets/login/continue_with.dart';
import 'package:ecommerce/widgets/login/login_container.dart';
import 'package:ecommerce/widgets/login/textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final auth = Auth();
  final email = TextEditingController();
  final password = TextEditingController();

  signUp() async {
    final user = await auth.createUser(email.text, password.text);
    if (user != null) {
      print('User create succesfull');
      context.go('/home_page');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email is not correct or badly formatted!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'account',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Textfield(
                    controller: email,
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                  ),
                  SizedBox(height: 31),
                  Textfield(
                    controller: password,
                    hintText: 'New Password',
                    prefixIcon: Icon(Icons.lock),
                    obscure: true,
                  ),
                ],
              ),
              GestureDetector(
                onTap: signUp,
                child: LoginContainer(text: 'Create Account'),
              ),
              ContinueWith(
                text: 'Already have account? ',
                widget: GestureDetector(
                  onTap: () => context.go('/login_page'),
                  child: Text('Login', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
