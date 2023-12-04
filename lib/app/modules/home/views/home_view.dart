import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/add_todo_button.dart';
import '../widgets/list_todo.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo ')),
      body: const ListTodo(),
      floatingActionButton: const AddTodoButton(),
    );
  }
}
