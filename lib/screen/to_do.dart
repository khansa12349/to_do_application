class ToDo {
  String? id;
  String? toDoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.toDoText,
    this.isDone = false,
  });
  static List<ToDo> toDoList() {
    return [
      ToDo(id: "01", toDoText: "Morning Exercise", isDone: true),
      ToDo(id: "02", toDoText: "Buy Groceries", isDone: true),
      ToDo(
        id: "03",
        toDoText: "Check Emails",
      ),
      ToDo(
        id: "04",
        toDoText: "Team Meeting",
      ),
      ToDo(
        id: "05",
        toDoText: "Work On App Project",
      ),
      ToDo(
        id: "06",
        toDoText: "Dinner With Jenny",
      ),
    ];
  }
}
