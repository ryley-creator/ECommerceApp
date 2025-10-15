import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/bloc/favorite/favorite_bloc.dart';
import 'package:ecommerce/bloc/product/product_bloc.dart';
import 'package:ecommerce/utils/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final firestore = FirebaseFirestore.instance;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductBloc()..add(LoadProducts())),
        BlocProvider(
          create: (_) =>
              FavoriteBloc(firestore: firestore)..add(LoadFavorites()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
