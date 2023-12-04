class TodoModel {
  final int id;
  final String title;
  final String body;
   final bool todoChecker;
  final String date;

  const TodoModel(
  {  
   required this.id, 
   required this.title, 
   required this.body, 
   required this.todoChecker, 
   required this.date});

    TodoModel copyWith(
     {
       int? id,
      String? title,
      String? body,
      bool? todoChecker,
      String? date
     }

    ){
return TodoModel(
  id: id ?? this.id, 
  title: title ?? this.title, 
  body: body ?? this.body, 
  todoChecker: todoChecker ?? this.todoChecker, 
  date : date ?? this.date,);
    }

    List<Object?> get props => [id, title, body, todoChecker, date];
}
