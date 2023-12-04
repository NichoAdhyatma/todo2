import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yazid_todo/app/modules/home/controllers/home_controller.dart';
import 'package:yazid_todo/app/modules/home/widgets/todo_card.dart';

import '../../../data/models/todo_model.dart';

class ListTodo extends GetView<HomeController> {
  const ListTodo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.listTodo.length,
        itemBuilder: (BuildContext context, int index) {
          final TodoModel todo = controller.listTodo[index];
          return TodoCard(
            index,
            todoModel: todo,
          );
        },
      );
    });
  }
}
