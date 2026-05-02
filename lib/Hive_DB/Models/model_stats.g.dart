// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_stats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelStatsAdapter extends TypeAdapter<ModelStats> {
  @override
  final int typeId = 0;

  @override
  ModelStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelStats(
      type: fields[0] as StatType,
      result: fields[1] as double,
      input: (fields[2] as Map).cast<String, dynamic>(),
      createdAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ModelStats obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.result)
      ..writeByte(2)
      ..write(obj.input)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
