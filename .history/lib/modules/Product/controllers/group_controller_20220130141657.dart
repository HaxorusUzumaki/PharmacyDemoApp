import 'package:demo_catalog_app/modules/Product/models/product.dart';
import 'package:demo_catalog_app/utils/helper/firebase_db_helper.dart';
import 'package:firebase_database/firebase_database.dart';

import 'groups_controller.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;

class GroupController {
  final int index;
  late Future<DatabaseReference?> futureRef;
  GroupController({required this.index}) {
    futureRef = getDatabaseRef();
  }
  Future<DatabaseReference?> getDatabaseRef() async {
    DatabaseReference? ref;
    Query targetedGroupQuery =
        GroupsController.ref.orderByChild("index").equalTo(index);
    await targetedGroupQuery.get().then(
      (groupsSnapshot) {
        groupsSnapshot.children.forEach(
          (group) {
            ref = group.ref;
          },
        );
      },
    );
    return ref;
  }

  Future<void> rename(String newName) async {
    DatabaseReference? ref = await futureRef;
    await ref?.update({"name": newName});
  }

  Future<void> addProduct(int index) async {
    DatabaseReference? ref = (await futureRef)?.child("products");
    await FirebaseDbHelper.addObjectByIndex(
        object: Product.emptyProduct(index: index).toMap(),
        baseRef: ref,
        index: index);
  }

  Future<void> deleteProduct(int index) async {
    DatabaseReference ref = (await futureRef).child("products");
    await FirebaseDbHelper.deleteByIndex(baseRef: ref, index: index);
  }

  Future<void> reorderProduct(int oldIndex, int newIndex) async {
    DatabaseReference ref = (await futureRef).child("products");
    await FirebaseDbHelper.reorder(
        baseRef: ref, oldIndex: oldIndex, newIndex: newIndex);
  }
}
