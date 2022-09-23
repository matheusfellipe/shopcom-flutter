//classe de dados para envio e recebimento
//do Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? id;
  String? name;
  String? description;
  String? price;
  String? unit;
  String? image;
  //método construtor
  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.unit,
      this.image});

  //Método utilizado para armazenar dados do documento obtido do Firebase
  Product.fromDocument(DocumentSnapshot doc) {
    id = doc.id;
    name = doc.get('name');
    description = doc.get('defirescription');
    price = doc.get('price') as String;
    unit = doc.get('unit') as String;
    image = doc.get('image') as String;
  }

  //método utilizado para enviar dados ao Firebase (conversão de informações
  //para Json) <String, dynamic> no formato de coleção do tipo Map
  //compatível com Json
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'unit': unit,
      'price': price,
      'image': image
    };
  }
}
