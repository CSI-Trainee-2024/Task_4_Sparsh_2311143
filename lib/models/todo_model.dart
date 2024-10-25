class Todo {
  String title;
  String description;
  String date;
  String startTime;
  String endTime;
  String category;
  bool isCompleted;

  Todo(
      {required this.title,
      required this.description,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.category,
      this.isCompleted = false});
}
