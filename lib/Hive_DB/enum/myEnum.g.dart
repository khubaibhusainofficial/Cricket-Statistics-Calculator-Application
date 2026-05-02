// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myEnum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatTypeAdapter extends TypeAdapter<StatType> {
  @override
  final int typeId = 1;

  @override
  StatType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return StatType.BAT_AVG;
      case 1:
        return StatType.BAT_SR;
      case 2:
        return StatType.BOWL_AVG;
      case 3:
        return StatType.BOWL_SR;
      case 4:
        return StatType.BOWL_ECONOMY;
      default:
        return StatType.BAT_AVG;
    }
  }

  @override
  void write(BinaryWriter writer, StatType obj) {
    switch (obj) {
      case StatType.BAT_AVG:
        writer.writeByte(0);
        break;
      case StatType.BAT_SR:
        writer.writeByte(1);
        break;
      case StatType.BOWL_AVG:
        writer.writeByte(2);
        break;
      case StatType.BOWL_SR:
        writer.writeByte(3);
        break;
      case StatType.BOWL_ECONOMY:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
