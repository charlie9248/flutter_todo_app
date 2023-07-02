import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? docId;
  final String? category;
  final String dateTask;
  final String timeTask;
  final String description;
  final String titleTask;

  TodoModel({
    this.docId,
    required this.category,
    required this.dateTask,
    required this.timeTask,
    required this.description,
    required this.titleTask,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docId': docId,
      'category': category,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'description': description,
      'titleTask': titleTask,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
      description: map['description'] as String,
      titleTask: map['titleTask'] as String,
    );
  }

  factory TodoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> map) {
    return TodoModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
      description: map['description'] as String,
      titleTask: map['titleTask'] as String,
    );
  }
}
