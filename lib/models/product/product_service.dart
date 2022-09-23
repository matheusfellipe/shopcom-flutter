import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_application_1/models/product/product.dart';

class ProductService {
  //obtendo a instâancia do Firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  late CollectionReference firestoreRef;
  Product _product = Product();

  //método construtor
  ProductService() {
    firestoreRef = _firestore.collection('products');
    //child acessa pasta
  }
  //método para adicionar os dados ao FIREBASE
  Future<bool> add(Product product, dynamic imageFile, bool plat) async {
    final _uuid = const Uuid().v1();

    try {
      final doc = await firestoreRef.add(product.toMap());
      product.id = doc.id;

      Reference storageRef = storage.ref().child('products').child(product.id!);
      final UploadTask task;
      if (!plat) {
        task = storageRef.child(_uuid).putFile(imageFile);
        storageRef.putFile(imageFile);
      } else {
        task = storageRef.child(_uuid).putData(imageFile);
        storageRef.putData(imageFile);
      }
      final String url = await (await task).ref.getDownloadURL();
      DocumentReference docRef = firestoreRef.doc(product.id);
      await docRef.update({'image': url});
      // firestoreRef.doc(product.id).set('image');
      product.image = url;
      // product.id = _uuid;
      // final doc = await firestoreRef.add(product.toMap());
      //  product.id = doc.id;
      return Future.value(true);
    } on FirebaseException catch (e) {
      if (e.code != 'OK') {
        debugPrint('Problemas ao gravar dados');
      } else if (e.code == 'ABORTED') {
        debugPrint('Inclusão de dados abortada');
      }
      return Future.value(false);
    }
  }

  //método para deletar produto
  Future<bool> delete(String productId) async {
    try {
      await firestoreRef.doc(productId).delete();
      return Future.value(true);
    } on FirebaseException catch (e) {
      if (e.code != 'OK') {
        debugPrint('Problemas ao deletar dados');
      } else if (e.code == 'ABORTED') {
        debugPrint('Deleção abortada');
      }
      return Future.value(false);
    }
  }
}
