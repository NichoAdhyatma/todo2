import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yazid_todo/app/data/models/todo_model.dart';
import 'package:yazid_todo/app/modules/home/controllers/home_controller.dart';
import 'package:yazid_todo/app/modules/home/widgets/buildBottomSheet.dart';

class TodoCard extends GetView<HomeController> {
  const TodoCard(
    this.index, {
    super.key,
    required this.todoModel,
  });

  final int index;
  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todoModel.title),
      subtitle: Text(todoModel.content),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {
              controller.titleController.text = todoModel.title;
              controller.contentController.text = todoModel.content;

              buildBottomSheet(
                  title: "Edit todo",
                  buttonLabel: "Edit todo",
                  controller: controller,
                  onPressed: () {
                    controller.editTodo(index);
                    Get.back();
                    Get.snackbar(
                      "Berhasil",
                      "berhasil mengedit todo",
                    );
                  });
            },
            icon: const Icon(
              Icons.edit,
            ),
          ),
          Checkbox(
            value: todoModel.status,
            onChanged: (bool? value) {
              controller.checkTodo(index, value ?? false);
            },
          ),
          IconButton(
            onPressed: () {
              AwesomeDialog(
                      context: context,
                      dialogType: DialogType.noHeader,
                      animType: AnimType.scale,
                      title: 'Konfirmasi',
                      desc: 'Ingin menghapus todo ${todoModel.title} ?',
                      btnCancel: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Batal"),
                      ),
                      btnOk: ElevatedButton(
                        onPressed: () {
                          controller.deleteTodo(index);
                          Get.back();
                          Get.snackbar("Berhasil", "berhasil menghapus todo");
                        },
                        child: const Text("Hapus"),
                      ),
                      btnOkColor: Colors.blue[500],
                      btnCancelColor: Colors.grey,
                      btnCancelOnPress: () {})
                  .show();
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red[500],
            ),
          ),
        ],
      ),
    );
  }
}
