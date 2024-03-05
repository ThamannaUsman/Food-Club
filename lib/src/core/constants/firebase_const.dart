import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_club/src/features/domain/usecases/auth_usecase.dart';
import 'package:food_club/src/features/domain/usecases/cart_usecase.dart';
import 'package:food_club/src/features/domain/usecases/categories_usecase.dart';
import 'package:food_club/src/features/domain/usecases/wishlist_usecase.dart';
import 'package:intl/intl.dart';

import '../../features/domain/usecases/order_usecase.dart';


//firebase
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore fireStore = FirebaseFirestore.instance;

//useCases
AuthUseCase authUseCase = AuthUseCase();
CartUseCase cartUseCase = CartUseCase();
OrderUseCase orderUseCase=OrderUseCase();
CategoryUseCase categoryUseCase=CategoryUseCase();
WishlistUseCase   wishlistUseCase=WishlistUseCase();

//collection
final categoriesCollection = fireStore.collection('Categories').doc('KyE7S2pcJxW1S0nNhKjW');
final menuCollection = fireStore.collection('Menu').doc('7u46g0FyAJF7Kc6mZcQR');
final userCollection = fireStore.collection("users");
final cartCollection = fireStore.collection('cart');
final orderCollection = fireStore.collection('orders');
final wishlistCollection = fireStore.collection('wishlist');

//category collection
final chineseFoodCollection= categoriesCollection.collection('Chinese');
final indianFoodCollection= categoriesCollection.collection('Indian');
final italianFoodCollection= categoriesCollection.collection('Italian');
final japaneseFoodCollection= categoriesCollection.collection('Japanese');
final pakistaniFoodCollection= categoriesCollection.collection('Pakistani');
final spanishFoodCollection=categoriesCollection.collection('Spanish');
final thaiFoodCollection= categoriesCollection.collection('Thai');
final turkishFoodCollection= categoriesCollection.collection('Turkish');
final allFoodCollection= categoriesCollection.collection('All');

//menu collection
final dessertCollection= menuCollection.collection('Dessert');
final drinksCollection= menuCollection.collection('Drinks');
final iceCreamCollection= menuCollection.collection('Ice Cream');
final nonVegFoodCollection= menuCollection.collection('Non Veg');
final sideDishCollection=menuCollection.collection('Side Dish');
final vegFoodCollection= menuCollection.collection('Veg');

//subTotalCalculate
int subTotal = 0;

subTotalCalculate(data) {
  subTotal = 0;
  for (var i = 0; i < data.length; i++) {
    subTotal = subTotal + int.parse(data[i]['totalPrice'].toString());
  }

}


//getProductDetails
dynamic itemsSnapshot;
var items = [];

getProductDetails() {
  items.clear();
  for (var i = 0; i < itemsSnapshot.length; i++) {
    items.add({
      'image': itemsSnapshot[i]['image'],
      'price': itemsSnapshot[i]['price'],
      'totalPrice': itemsSnapshot[i]['totalPrice'],
      'quantity': itemsSnapshot[i]['quantity'],
      'name': itemsSnapshot[i]['name'],
    });
  }
}


//clearCart
clearCart() {
  for (var i = 0; i < itemsSnapshot.length; i++) {
    fireStore.collection('cart').doc(itemsSnapshot[i].id).delete();
  }
}

//date
var now = DateTime.now();
var formatter = DateFormat('yyyy-MM-dd');
String formattedDate = formatter.format(now);