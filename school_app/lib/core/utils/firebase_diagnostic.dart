import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseDiagnostic {
  static Future<void> run() async {
    debugPrint("--- Firebase Diagnostic Start ---");
    try {
      final auth = FirebaseAuth.instance;
      debugPrint("Auth Instance: OK");
      
      final firestore = FirebaseFirestore.instance;
      debugPrint("Firestore Instance: OK");
      
      debugPrint("Current User: ${auth.currentUser?.email ?? 'None'}");
      
      if (auth.currentUser != null) {
        debugPrint("Attempting Firestore connectivity test...");
        await firestore.collection('users').doc('test_connectivity').get().timeout(
          const Duration(seconds: 5),
          onTimeout: () => throw Exception("Firestore timeout - Check your Internet or Rules"),
        );
        debugPrint("Firestore Connectivity: OK");
      }
    } catch (e) {
      debugPrint("Firebase Diagnostic FAILED: $e");
    }
    debugPrint("--- Firebase Diagnostic End ---");
  }
}
