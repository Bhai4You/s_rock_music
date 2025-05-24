import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String bgImagePath;
  final String iconPath;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.bgImagePath,
    required this.iconPath,
  });

  factory ServiceModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ServiceModel(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconPath: data['iconPath'] ?? '',
      bgImagePath: data['bgImagePath'] ?? '',
    );
  }
}
