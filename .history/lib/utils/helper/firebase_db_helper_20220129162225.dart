import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

class FirebaseDbHelper {
  static Future<void> addObjectByIndex({
    required Object? object,
    required DatabaseReference baseRef,
    required int index,
  }) async {
    Query query = baseRef.orderByChild("index").startAt(index);
    await query.get().then(
          (elementsSnapshot) => elementsSnapshot.children.forEach(
            (element) async {
              await element.ref.child("index").set(ServerValue.increment(1));
            },
          ),
        );
    baseRef.update({Uuid().v4(): object});
  }

  static Future<void> deleteByIndex({
    required DatabaseReference baseRef,
    required int index,
  }) async {
    Query targetedElementQuery = baseRef.orderByChild("index").equalTo(index);
    targetedElementQuery.get().then((elementsSnapshot) {
      elementsSnapshot.children.forEach(
        (element) {
          element.ref.remove();
        },
      );
    });
    Query elementsQuery = baseRef.orderByChild("index").startAfter(index);
    await elementsQuery.get().then(
          (elementsSnapshot) => elementsSnapshot.children.forEach(
            (element) async {
              await element.ref.child("index").set(ServerValue.increment(-1));
            },
          ),
        );
  }

  static void reorder({
    required DatabaseReference baseRef,
    required int oldIndex,
    required int newIndex,
  }) {
    Query query = baseRef.orderByChild("index")
        .startAt(oldIndex < newIndex ? oldIndex : newIndex)
        .limitToFirst((oldIndex - newIndex).abs() + 1);
    query.get().then(
      (elementsSnapshot) {
        elementsSnapshot.children.forEach(
          (element) {
            if ((element.value as Map)["index"] == oldIndex) {
              element.ref.update({"index": newIndex});
            } else {
              element.ref
                  .child("index")
                  .set(ServerValue.increment((oldIndex - newIndex).sign));
            }
          },
        );
      },
    );
  }
}