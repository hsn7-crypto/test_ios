// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_information_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainInformationEntityAdapter extends TypeAdapter<MainInformationEntity> {
  @override
  final int typeId = 0;

  @override
  MainInformationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainInformationEntity(
      fields[0] as double,
      fields[1] as int,
      fields[2] as double,
      fields[3] as double,
      fields[4] as double,
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MainInformationEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.mainSalary)
      ..writeByte(1)
      ..write(obj.childrenNum)
      ..writeByte(2)
      ..write(obj.numberOfHoursPerDay)
      ..writeByte(3)
      ..write(obj.personalLoan)
      ..writeByte(4)
      ..write(obj.personalLoanInstallment)
      ..writeByte(5)
      ..write(obj.overnight)
      ..writeByte(6)
      ..write(obj.maritalStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainInformationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
