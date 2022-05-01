import 'package:firebase_core/firebase_core.dart';

// ignore: avoid_classes_with_only_static_members
class FirebaseService {
  static Future<FirebaseService> init() async {
    await Firebase.initializeApp();
    return FirebaseService();
  }
}
