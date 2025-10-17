import 'package:ecommerce/utils/funcs/auth.dart';
import 'package:ecommerce/widgets/login/continue_with.dart';
import 'package:ecommerce/widgets/login/login_container.dart';
import 'package:ecommerce/widgets/login/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final auth = Auth();
  // User? _user;
  // @override
  // void initState() {
  //   super.initState();
  //   _auth.authStateChanges().listen((event) {
  //     setState(() {
  //       _user = event;
  //     });
  //   });
  // }
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  Future<void> _handleSignIn() async {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      await _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }

  login() async {
    final user = await auth.loginUser(email.text, password.text);
    if (user != null) {
      print('User logged in');
      context.go('/home_page');
    } else if (user!.email != email.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Email is not correct!')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Password is incorrect')));
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
                    'Welcome',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Back!',
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
                    hintText: 'Username or email',
                  ),
                  SizedBox(height: 31),
                  Textfield(
                    controller: password,
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    obscure: true,
                  ),
                  SizedBox(height: 9),
                  GestureDetector(
                    onTap: () => context.push('/forgot_password'),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: login,
                child: LoginContainer(text: 'Login'),
              ),
              GestureDetector(
                onTap: _handleSignIn,
                child: ContinueWith(
                  text: 'Dont have an account? ',
                  widget: GestureDetector(
                    onTap: () => context.go('/sign_up_page'),
                    child: Text('Sign Up', style: TextStyle(color: Colors.red)),
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
