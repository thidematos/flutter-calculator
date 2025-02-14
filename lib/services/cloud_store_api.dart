import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _cloudInstance = FirebaseFirestore.instance;

class CloudStoreApi {
  const CloudStoreApi();

  static setUserData(userID, name) async {
    try {
      final data = await _cloudInstance.collection('users').doc(userID).set({
        'name': name,
      });
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  static getHistory() async {
    final user = FirebaseAuth.instance.currentUser;
    final historyData = await _cloudInstance.collection('history').get();

    final data = historyData.docs;

    return data;
  }

  static setHistory(value) async {
    final user = FirebaseAuth.instance.currentUser;
    await _cloudInstance.collection('history').add({
      'user': user!.uid,
      'value': value,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
