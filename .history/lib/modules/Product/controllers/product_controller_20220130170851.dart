import 'package:demo_catalog_app/models/img.dart';
import 'package:demo_catalog_app/utils/helper/firebase_db_helper.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductController {
  final String id;
  Future<DatabaseReference?>? futureRef;
  ProductController({required this.id}) {
    futureRef = getProductRef();
  }
  Future<DatabaseReference?> getProductRef() async {
    DatabaseReference? ref;
    await FirebaseDBHelper.database.ref("product tab/groups").get().then(
      (groupsSnapshot) async {
        for (DataSnapshot groupSnapshot in groupsSnapshot.children) {
          Query groupQuery = groupSnapshot.ref
              .child("products")
              .orderByChild("id")
              .equalTo(id);
          await groupQuery.get().then(
            (productsSnapshot) {
              productsSnapshot.children.forEach(
                (product) {
                  ref = product.ref;
                },
              );
            },
          );
        }
      },
    );
    return ref;
  }

  Future<void> rename(String newName) async {
    DatabaseReference? ref = await futureRef;
    await ref?.update({"name": newName});
  }

  Future<void> setTagline(String tagline) async {
    DatabaseReference? ref = await futureRef;
    await ref?.update({"tagline": tagline});
  }

  Future<void> setLogo(Img logo) async {
    DatabaseReference? ref = await futureRef;
    await ref?.update({"logo": logo.toMap()});
  }

  Future<void> setOffer(Img offer) async {
    DatabaseReference? ref = await futureRef;
    await ref?.update({"offer": offer.toMap()});
  }

  Future<void> setOther(Img other) async {
    DatabaseReference? ref = await futureRef;
    await ref?.update({"other": other.toMap()});
  }

  Future<void> addImage(int index) async {
    DatabaseReference? ref = (await futureRef)?.child("images");
    await FirebaseDBHelper.addObjectByIndex(
      object: Img.emptyIndexedImg(index: index).toMap(),
      baseRef: ref,
      index: index,
    );
  }

  Future<void> deleteImage(int index) async {
    await FirebaseDBHelper.deleteByIndex(
      baseRef: ref,
      index: index,
    );
  }
}
