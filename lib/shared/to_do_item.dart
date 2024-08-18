import 'package:flutter/material.dart';
import 'package:flutter_to_do_application/constants/colors.dart';

import '../screen/to_do.dart';

class ToDOItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChange;
  final onToDoDelete;
  const ToDOItem(
      {super.key,
      required this.toDo,
      required this.onToDoChange,
      required this.onToDoDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        onTap: () {
          onToDoChange();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlueColor,
        ),
        title: Text(
          toDo.toDoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlackColor,
            decoration: toDo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(6),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 18,
            ),
            onPressed: () {
              onToDoDelete(toDo.id);
            },
          ),
        ),
      ),
    );
  }
}
