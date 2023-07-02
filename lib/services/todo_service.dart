import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/model/model.dart';

final todoServideProvider = Provider((ref) => TodoService());

class TodoService {
  final collection = FirebaseFirestore.instance.collection('todoApp');

  void addNewTask(TodoModel todo) {
    collection.add(todo.toMap());
  }
}
