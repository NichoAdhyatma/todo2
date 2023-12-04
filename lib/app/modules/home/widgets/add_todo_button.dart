import 'package:flutter/material.dart';
import 'package:yazid_todo/app/modules/home/controllers/home_controller.dart';

import 'buildBottomSheet.dart';
import 'package:get/get.dart';

class AddTodoButton extends GetView<HomeController> {
  const AddTodoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        buildBottomSheet(
          title: "Tambah Todo",
          controller: controller,
          buttonLabel: "Tambah Todo",
          onPressed: () {
            controller.addTodo();
            Get.back();
            Get.snackbar(
              "Sukses",
              "Berhasil menambah Todo",
            );
          },
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
