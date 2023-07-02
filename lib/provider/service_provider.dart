import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/model/model.dart';

import '../services/todo_service.dart';

final stateNotifierProvider =
    StateNotifierProvider<TodoStateNotifier, List<TodoModel>>(
        (ref) => TodoStateNotifier(ref));

class TodoStateNotifier extends StateNotifier<List<TodoModel>> {
  TodoStateNotifier(Ref ref)
      : _api = ref.watch(todoServideProvider),
        super([]);

  TodoService _api;
}
