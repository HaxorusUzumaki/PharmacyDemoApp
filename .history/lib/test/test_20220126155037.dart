import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;
StreamProvider<String> futureProvider = StreamProvider<String>((ref) async {
  return firebase();
});


Stream<String> firebase() async {
  Query ref = database.ref("product tab/groups").orderByChild("index");
    Stream stream = ref.onValue;
    stream.map((groupData) => );
}
