import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/service_model.dart';

class ServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ServiceModel>> fetchServices() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('services').get();
      return snapshot.docs
          .map((doc) => ServiceModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Error fetching services: $e');
    }
  }
}
