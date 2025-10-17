import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addProduct() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    await firestore.collection('product').add({
      'category': 'phones',
      'amount': 10,
      'isFavorite': false,
      'name': 'Iphone 14 pro',
      'description': 'The best phone ever made by Apple',
      'price': 1199.9,
      'imageUrl':
          'https://images.unsplash.com/photo-1727079525588-4638ea8301e0?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=3132',
      'createdAt': FieldValue.serverTimestamp(),
      'productDetails':
          'The 14 Pro has Apple’s latest A16 Bionic chip, making it the fastest iPhone available by about 10% over the previous A15 chips. It is easily capable of handling everything you might want to do with a smartphone and will stay fast for years to come.The battery life is solid but more variable than other iPhones. Leaving the 14 Pro flat on a desk for most of the day, the battery lasts about 39 hours with 5.5 hours of active use. Keep the phone in a pocket, which shuts the display off, and it lasts about 45 hours between charges.In the US the iPhone 14 line ships without a sim card tray, relying entirely on eSim, a purely digital version of the sim. In the UK, it will continue to have a sim tray. Emergency satellite SOS is rolling out in November, but only to phones sold in the US or Canada.',
    });
    print('Product added succesfully!');
  } catch (error) {
    print('Error:$error');
  }
}
