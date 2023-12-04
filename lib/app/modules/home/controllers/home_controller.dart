import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/models/todo_model.dart';

class HomeController extends GetxController {
  final RxList<TodoModel> _listTodo = RxList.empty();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  RxList<TodoModel> get listTodo => _listTodo;

  TextEditingController get titleController => _titleController;

  TextEditingController get contentController => _contentController;

  void addTodo() {
    listTodo.add(
      TodoModel(
        title: titleController.text,
        content: contentController.text,
      ),
    );

    clearField();
  }

  void editTodo(int index) {
    TodoModel todoModel = listTodo.elementAt(index);

    todoModel.title = titleController.text;
    todoModel.content = contentController.text;

    listTodo.refresh();

    clearField();
  }

  void deleteTodo(int index) {
    listTodo.removeAt(index);
  }

  void checkTodo(int index, bool value) {
    TodoModel todoModel = listTodo.elementAt(index);

    todoModel.status = value;

    listTodo.refresh();
  }

  void clearField() {
    titleController.clear();
    contentController.clear();
  }
}
