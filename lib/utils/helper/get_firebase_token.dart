/*
import 'package:cloud_firestore/cloud_firestore.dart';

getTokenFirebase(_firebaseMessaging, uid) async {
  _firebaseMessaging.getToken().then((token) {
    var documentReference =
        Firestore.instance.collection('users').document(uid.toString());

    Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        {
          'iduser': uid,
          'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
          'token': token,
        },
      );
    });
    print(token);
  });
}
*/
