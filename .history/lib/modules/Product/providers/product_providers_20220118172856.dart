import 'package:demo_catalog_app/modules/Product/models/group.dart';
import 'package:demo_catalog_app/modules/Product/models/product.dart';
import 'package:demo_catalog_app/utils/helper/firebase_db_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupProvider = StateProvider<Group>((ref) async {
  await getData();
});

final productsProvider = StateProvider<List<Product>>((ref) {});

final productProvider = StateProvider<Product>((ref) {});
