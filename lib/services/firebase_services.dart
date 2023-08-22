import 'package:market/consts/consts.dart';

// get user from database
class FirestoreServices {
  static getUser(uid) {
    return fireStore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

// get product according to Category

  static getProducts(category) {
    return fireStore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }
}
