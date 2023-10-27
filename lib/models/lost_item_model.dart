import 'package:cloud_firestore/cloud_firestore.dart';

class LostItem {
  final String id;
  final String name;
  final String description;
  final String location;
  final String? imageUrl;
  final DateTime? timestamp;
  final String userId;
  final String userEmail;

  LostItem({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    this.imageUrl,
    this.timestamp,
    required this.userId,
    required this.userEmail,
  });

  factory LostItem.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return LostItem(
      id: doc.id,
      name: data['name'],
      description: data['description'],
      location: data['location'],
      imageUrl: data['imageUrl'],
      timestamp: (data['timestamp'] as Timestamp?)?.toDate(),
      userId: data['userId'],
      userEmail: data['userEmail'],
    );
  }
}
