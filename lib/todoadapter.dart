




import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'todoadapter.g.dart';

@HiveType(typeId: 1)
class Todoadapter extends Equatable {
 
  const Todoadapter({required this.id, required this.title, required this.body, required this.todoChecker, required this.date,});
  @HiveField(0)
  final int id;

  @HiveField(1)
 final String title;

  @HiveField(2)
  final String body;

   @HiveField(3)
  final bool todoChecker;

   @HiveField(4)
  final String date;
 
 

  Todoadapter copyWith({
    int id = 0,
    String title = "",
    String body = "",
   bool todoChecker= false,
    String date = "",
  }) {
    return Todoadapter(
      body: '', id: 0, date: '', title: '', todoChecker: false
     
    );
  }

  @override
   List<Object?> get props => [id, title, body, todoChecker, date];

  
}





// @HiveType(typeId: 2)
// class BeneficiaryDB extends Equatable {
//   @HiveField(0)
//   final String phone;

//   @HiveField(1)
//   final int network;

//   const BeneficiaryDB({
//     required this.phone,
//     required this.network,
//   });

//   BeneficiaryDB copyWith({
//     String phone = '',
//     int network = 0,
//   }) {
//     return BeneficiaryDB(
//       phone: phone,
//       network: network,
//     );
//   }

//   @override
//   List<Object?> get props => [phone,network];
// }


// class Todoadapter extends TypeAdapter<TodoModel> {
//   @override
//   final typeId = 0;

//   @override
//  TodoModel read(BinaryReader reader) {
//     return TodoModel(reader.read());
//   }

//   @override
//   void write(BinaryWriter writer, TodoModel obj) {
//     writer.write(obj.title);
//     writer.write(obj.body);
//     writer.write(obj.todoChecker);
//     writer.write(obj.date);
//     writer.write(obj.id);
//   }
// }
