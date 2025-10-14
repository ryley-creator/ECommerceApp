import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    handleStartLogic();
  }

  Future<void> handleStartLogic() async {
    await Future.delayed(Duration(milliseconds: 1500));

    final prefs = await SharedPreferences.getInstance();
    final hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;
    final user = _auth.currentUser;

    if (!hasSeenSplash) {
      await prefs.setBool('hasSeenSplash', true);
      if (mounted) {
        context.go('/welcome_page1');
      }
      return;
    }

    if (user != null) {
      if (mounted) {
        context.go('/main_page');
      } else {
        if (mounted) {
          context.go('/login_page');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: SvgPicture.asset('assets/icons/stylish.svg')),
    );
  }
}
