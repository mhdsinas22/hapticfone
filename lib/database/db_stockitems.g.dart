// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_stockitems.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockItemsAdapter extends TypeAdapter<StockItems> {
  @override
  final int typeId = 0;

  @override
  StockItems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockItems(
      hiveimg: fields[0] as Uint8List,
      hivebrand: fields[1] as String,
      hivemodel: fields[2] as String,
      hivecolor: fields[3] as String,
      hivestorage: fields[4] as String,
      hivecondtion: fields[5] as String,
      hiveitemcount: fields[6] as String,
      hiveprice: fields[7] as String,
      purschaseprice: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StockItems obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.hiveimg)
      ..writeByte(1)
      ..write(obj.hivebrand)
      ..writeByte(2)
      ..write(obj.hivemodel)
      ..writeByte(3)
      ..write(obj.hivecolor)
      ..writeByte(4)
      ..write(obj.hivestorage)
      ..writeByte(5)
      ..write(obj.hivecondtion)
      ..writeByte(6)
      ..write(obj.hiveitemcount)
      ..writeByte(7)
      ..write(obj.hiveprice)
      ..writeByte(8)
      ..write(obj.purschaseprice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SaleitemsAdapter extends TypeAdapter<Saleitems> {
  @override
  final int typeId = 1;

  @override
  Saleitems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Saleitems(
      saleHivebrand: fields[0] as String,
      saleHivemodel: fields[1] as String,
      saleHiveColor: fields[2] as String,
      saleHiveStroage: fields[3] as String,
      saleHiveCondtion: fields[4] as String,
      saleHiveitemcount: fields[5] as String,
      saleHiveprice: fields[6] as String,
      saleimgpath: fields[7] as Uint8List,
      empolye: fields[8] as String,
      salepurshaceamount: fields[9] as String,
      saledate: fields[10] as String,
      phonenumber: fields[11] as String,
      invoiceno: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Saleitems obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.saleHivebrand)
      ..writeByte(1)
      ..write(obj.saleHivemodel)
      ..writeByte(2)
      ..write(obj.saleHiveColor)
      ..writeByte(3)
      ..write(obj.saleHiveStroage)
      ..writeByte(4)
      ..write(obj.saleHiveCondtion)
      ..writeByte(5)
      ..write(obj.saleHiveitemcount)
      ..writeByte(6)
      ..write(obj.saleHiveprice)
      ..writeByte(7)
      ..write(obj.saleimgpath)
      ..writeByte(8)
      ..write(obj.empolye)
      ..writeByte(9)
      ..write(obj.salepurshaceamount)
      ..writeByte(10)
      ..write(obj.saledate)
      ..writeByte(11)
      ..write(obj.phonenumber)
      ..writeByte(12)
      ..write(obj.invoiceno);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleitemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CreateAccountAdapter extends TypeAdapter<CreateAccount> {
  @override
  final int typeId = 2;

  @override
  CreateAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreateAccount(
      Email: fields[0] as String,
      USername: fields[1] as String,
      password: fields[3] as String,
      phonenumber: fields[2] as String,
      createimg: fields[4] as Uint8List,
      city: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CreateAccount obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.Email)
      ..writeByte(1)
      ..write(obj.USername)
      ..writeByte(2)
      ..write(obj.phonenumber)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.createimg)
      ..writeByte(5)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CreatePinAdapter extends TypeAdapter<CreatePin> {
  @override
  final int typeId = 3;

  @override
  CreatePin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreatePin(
      enterpin: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CreatePin obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.enterpin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatePinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
