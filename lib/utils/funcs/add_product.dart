import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addProduct() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    await firestore.collection('product').add({
      'name': 'Macbook Pro 14.2',
      'description':
          'Apple"s innovation Macbook Pro with a lot of new features',
      'price': 1199.9,
      'imageUrl':
          'https://images.unsplash.com/photo-1651241680016-cc9e407e7dc3?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1287',
      'createdAt': FieldValue.serverTimestamp(),
    });
    print('Product added succesfully!');
  } catch (error) {
    print('Error:$error');
  }
}
