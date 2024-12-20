import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'db_stockitems.g.dart';

@HiveType(typeId: 0)
class StockItems extends HiveObject {
  @HiveField(0)
  final Uint8List hiveimg;
  @HiveField(1)
  final String hivebrand;
  @HiveField(2)
  final String hivemodel;
  @HiveField(3)
  final String hivecolor;
  @HiveField(4)
  final String hivestorage;
  @HiveField(5)
  final String hivecondtion;
  @HiveField(6)
  late final String hiveitemcount;
  @HiveField(7)
  final String hiveprice;
  @HiveField(8)
  String purschaseprice;
  StockItems(
      {required this.hiveimg,
      required this.hivebrand,
      required this.hivemodel,
      required this.hivecolor,
      required this.hivestorage,
      required this.hivecondtion,
      required this.hiveitemcount,
      required this.hiveprice,
      required this.purschaseprice});

  get id => null;
}

@HiveType(typeId: 1)
class Saleitems extends HiveObject {
  @HiveField(0)
  final String saleHivebrand;
  @HiveField(1)
  final String saleHivemodel;
  @HiveField(2)
  final String saleHiveColor;
  @HiveField(3)
  final String saleHiveStroage;
  @HiveField(4)
  final String saleHiveCondtion;
  @HiveField(5)
  final String saleHiveitemcount;
  @HiveField(6)
  final String saleHiveprice;
  @HiveField(7)
  final Uint8List saleimgpath;
//newfiled
  @HiveField(8)
  final String empolye;
  @HiveField(9)
  final String salepurshaceamount;
  @HiveField(10)
  final String saledate;
  @HiveField(11)
  final String phonenumber;
  @HiveField(12)
  final String invoiceno;
  Saleitems(
      {required this.saleHivebrand,
      required this.saleHivemodel,
      required this.saleHiveColor,
      required this.saleHiveStroage,
      required this.saleHiveCondtion,
      required this.saleHiveitemcount,
      required this.saleHiveprice,
      required this.saleimgpath,
      required this.empolye,
      required this.salepurshaceamount,
      required this.saledate,
      required this.phonenumber,
      required this.invoiceno});
  factory Saleitems.fromMap(Map<String, dynamic> map) {
    return Saleitems(
        saleHivebrand: map["brand"],
        saleHivemodel: map["Modee"],
        saleHiveColor: map["Color"],
        saleHiveStroage: map["Stroage"],
        saleHiveCondtion: map["Condtion"],
        saleHiveitemcount: map["itemcount"],
        saleHiveprice: map["Price"],
        saleimgpath: map["Image"],
        empolye: map["Empolye"],
        salepurshaceamount: map["Salepurschaseamount"],
        saledate: map["Saledate"],
        phonenumber: map["phonenumber"],
        invoiceno: map["invoiceno"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "brand": saleHivebrand,
      "Modee": saleHivemodel,
      "Color": saleHiveColor,
      "Stroage": saleHiveStroage,
      "Condtion": saleHiveCondtion,
      "itemcount": saleHiveitemcount,
      "Price": saleHiveprice,
      "Image": saleimgpath,
      "Empolye": empolye,
      "Salepurschaseamount": salepurshaceamount,
      "Saledate": saledate,
      "phonenumber": phonenumber,
      "invoiceno": invoiceno
    };
  }
}

@HiveType(typeId: 2)
class CreateAccount extends HiveObject {
  @HiveField(0)
  String Email;
  @HiveField(1)
  String USername;
  @HiveField(2)
  String phonenumber;
  @HiveField(3)
  String password;
  @HiveField(4)
  Uint8List createimg;
  @HiveField(5)
  String city;
  CreateAccount(
      {required this.Email,
      required this.USername,
      required this.password,
      required this.phonenumber,
      required this.createimg,
      required this.city});
}

@HiveType(typeId: 3)
class CreatePin extends HiveObject {
  @HiveField(0)
  String enterpin;
  CreatePin({required this.enterpin});
}
