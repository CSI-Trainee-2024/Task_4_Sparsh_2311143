class Todo{
  String? title;
  String? description;
  String? date;
  String? time;
  bool? isCompleted;

  Todo({required this.title, required this.description, required this.date, required this.time , this.isCompleted= false });
}