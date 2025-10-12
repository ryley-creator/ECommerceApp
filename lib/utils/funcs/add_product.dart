import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addProduct() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    await firestore.collection('product').add({
      'name': 'Iphone 14 pro',
      'description': 'New iphone 14 pro with new dinamic island',
      'price': 1199.9,
      'imageUrl':
          'https://images.unsplash.com/photo-1680687688158-e9165395ff00?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1528',
      'createdAt': FieldValue.serverTimestamp(),
    });
    print('Product added succesfully!');
  } catch (error) {
    print('Error:$error');
  }
}
