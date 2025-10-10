import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    print(auth.currentUser!.photoURL.toString());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.white,
        title: SvgPicture.asset('assets/icons/stylish_home_page.svg'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: auth.currentUser!.photoURL != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(auth.currentUser!.photoURL!),
                    radius: 18,
                  )
                : const CircleAvatar(child: Icon(Icons.person), radius: 18),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(child: Text('Hello world')),
    );
  }
}
