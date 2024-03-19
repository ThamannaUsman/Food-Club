import 'package:food_club/src/core/constants/firebase_const.dart';

class FirebaseService {
  static getCart(uid) {
    return fireStore
        .collection('cart')
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  static getUser(uid) {
    return fireStore
        .collection('users')
        .where('uid', isEqualTo: uid)
        .snapshots();
  }

  static getRecommendedProduct() {
    final result = categoriesCollection
        .collection('All')
        .where('isRecommended', isEqualTo: true)
        .get();
    return result;
  }

  static getMostProduct() {
    final result = categoriesCollection
        .collection('All')
        .where('isMostPopular', isEqualTo: true)
        .get();
    return result;
  }

  static searchProducts(title) {
    return categoriesCollection.collection('All').get();
  }

  static getOrders() {
    return fireStore
        .collection('orders')
        .where('order_by', isEqualTo: authentication.currentUser!.uid)
        .snapshots();
  }
  static deleteDocument(docId) {
    return cartCollection.doc(docId).delete();
  }
}

