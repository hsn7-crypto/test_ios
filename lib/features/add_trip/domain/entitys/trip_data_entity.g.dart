// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_data_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripDataEntityAdapter extends TypeAdapter<TripDataEntity> {
  @override
  final int typeId = 1;

  @override
  TripDataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TripDataEntity(
      fridayAndSaturdayAndHolidayValue: fields[17] as double,
      startTripDate: fields[0] as DateTime?,
      endTripDate: fields[1] as DateTime?,
      mainInformation: fields[2] as MainInformationEntity,
      jobdays: (fields[3] as List).cast<DateTime>(),
      holidays: (fields[4] as List).cast<DateTime>(),
      totalSalary: fields[5] as double,
      netSalary: fields[6] as double,
      fieldAllowance: fields[7] as int,
      extraWork: fields[8] as double,
      fridayAndSaturdayHoliday: (fields[9] as List).cast<DateTime>(),
      solidarityTax: fields[10] as double,
      guaranteeTax: fields[11] as double,
      jihadTax: fields[12] as double,
      incomeTax: fields[13] as double,
      bonuses: fields[14] as double,
      discounts: fields[15] as double,
      hourlyValue: fields[16] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TripDataEntity obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.startTripDate)
      ..writeByte(1)
      ..write(obj.endTripDate)
      ..writeByte(2)
      ..write(obj.mainInformation)
      ..writeByte(3)
      ..write(obj.jobdays)
      ..writeByte(4)
      ..write(obj.holidays)
      ..writeByte(5)
      ..write(obj.totalSalary)
      ..writeByte(6)
      ..write(obj.netSalary)
      ..writeByte(7)
      ..write(obj.fieldAllowance)
      ..writeByte(8)
      ..write(obj.extraWork)
      ..writeByte(9)
      ..write(obj.fridayAndSaturdayHoliday)
      ..writeByte(10)
      ..write(obj.solidarityTax)
      ..writeByte(11)
      ..write(obj.guaranteeTax)
      ..writeByte(12)
      ..write(obj.jihadTax)
      ..writeByte(13)
      ..write(obj.incomeTax)
      ..writeByte(14)
      ..write(obj.bonuses)
      ..writeByte(15)
      ..write(obj.discounts)
      ..writeByte(16)
      ..write(obj.hourlyValue)
      ..writeByte(17)
      ..write(obj.fridayAndSaturdayAndHolidayValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripDataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
