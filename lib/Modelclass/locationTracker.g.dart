// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationTracker.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class locationTrackerAdapter extends TypeAdapter<locationTracker> {
  @override
  final int typeId = 0;

  @override
  locationTracker read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return locationTracker(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, locationTracker obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is locationTrackerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
