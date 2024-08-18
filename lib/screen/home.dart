import 'package:flutter/material.dart';
import 'package:flutter_to_do_application/constants/colors.dart';
import 'package:flutter_to_do_application/screen/to_do.dart';

import '../shared/search_box.dart';
import '../shared/to_do_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<List<ToDo>> toDoList = ValueNotifier(ToDo.toDoList());
  final ValueNotifier<List<ToDo>> foundToDo = ValueNotifier([]);
  final TextEditingController _addToDoController = TextEditingController();

  @override
  void initState() {
    foundToDo.value = toDoList.value;
    super.initState();
  }

  void _handleToDoChange(ToDo toDo) {
    toDo.isDone = !toDo.isDone;

    foundToDo.value = List.from(foundToDo.value);
  }

  void _deleteToDo(String id) {
    toDoList.value.removeWhere((item) => item.id == id);
    foundToDo.value = List.from(toDoList.value);
  }

  void _addToDo(String text) {
    toDoList.value.add(
      ToDo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        toDoText: text,
      ),
    );
    _addToDoController.clear();
    foundToDo.value = List.from(toDoList.value);
  }

  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      foundToDo.value = toDoList.value;
    } else {
      foundToDo.value = toDoList.value
          .where((item) => item.toDoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBgColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              color: tdBlackColor,
              size: 30,
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/girl_image.jpg"),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SearchBox(
              onchange: (value) => runFilter(value),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ValueListenableBuilder<List<ToDo>>(
                valueListenable: foundToDo,
                builder: (context, todoItems, child) {
                  return ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "All To Do's",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      for (ToDo todo in todoItems.reversed)
                        ToDOItem(
                          toDo: todo,
                          onToDoChange: () {
                            _handleToDoChange(todo);
                          },
                          onToDoDelete: _deleteToDo,
                        ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.00),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _addToDoController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: "Add a new todo item",
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDo(_addToDoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlueColor,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
