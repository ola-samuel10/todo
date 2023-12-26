// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todoadapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoadapterAdapter extends TypeAdapter<Todoadapter> {
  @override
  final int typeId = 1;

  @override
  Todoadapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todoadapter(
      id: fields[0] as int,
      title: fields[1] as String,
      body: fields[2] as String,
      todoChecker: fields[3] as bool,
      date: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Todoadapter obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.todoChecker)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoadapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
