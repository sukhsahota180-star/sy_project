import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseInitializerProvider = FutureProvider<void>((ref) async {
  await Firebase.initializeApp();
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
final firebaseStorageProvider = Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);

class FirebaseService {
  FirebaseService(this._firestore, this._auth, this._storage);

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  Future<void> signInAdmin({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOutAdmin() async {
    await _auth.signOut();
  }

  Future<List<Map<String, dynamic>>> getProjects() async {
    final snapshot = await _firestore.collection('projects').orderBy('createdAt', descending: true).get();
    return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }

  Future<List<Map<String, dynamic>>> getEnquiries() async {
    final snapshot = await _firestore.collection('enquiries').orderBy('createdAt', descending: true).get();
    return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
  }

  Future<void> submitEnquiry(Map<String, dynamic> enquiry) async {
    await _firestore.collection('enquiries').add({
      ...enquiry,
      'createdAt': FieldValue.serverTimestamp(),
      'status': 'new',
    });
  }

  Future<String> uploadImage(String path, String fileName) async {
    final ref = _storage.ref().child(path).child(fileName);
    final snapshot = await ref.putString(await _readStringAsBase64(fileName));
    return await snapshot.ref.getDownloadURL();
  }

  Future<String> _readStringAsBase64(String fileName) async {
    throw UnimplementedError('Use a real file upload path for production; this is a placeholder service layer.');
  }
}
