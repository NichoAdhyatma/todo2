import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yazid_todo/app/modules/home/controllers/home_controller.dart';

Future<dynamic> buildBottomSheet({
  String title = "",
  String buttonLabel = "",
  required HomeController controller,
  void Function()? onPressed,
}) {
  return Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          TextField(
            controller: controller.titleController,
            decoration: const InputDecoration(
                labelText: "Judul", hintText: "Masukan judul"),
          ),
          TextField(
            controller: controller.contentController,
            decoration: const InputDecoration(
              labelText: "Isi",
              hintText: "Masukan isi",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Tambah Todo'),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
