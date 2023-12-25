import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers/constants/constant.dart';

import '../models/product_model.dart';

class FireStoreHelper {
  static FireStoreHelper instance = FireStoreHelper();
  final FirebaseFirestore _FireBaseStore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProduct() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _FireBaseStore.collection('categories').get();

      List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();


      return productList;


    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }
}
