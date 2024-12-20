// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Dummy {
  static List<Map<String, dynamic>> addmuiltsale = [];
}

class Ok {
  static List<Map<String, dynamic>> tryy = [];
}

class Notif {
  static List<Map<String, dynamic>> notf = [];
}

class SalesADDModel {
  final String brand;
  final String model;
  final String color;
  final String storage;
  final String condition;
  final String employee;
  final String itemCount;
  final String price;
  final String image;
  final String purchacePrice;

  final String date;
  SalesADDModel({
    required this.brand,
    required this.model,
    required this.color,
    required this.storage,
    required this.condition,
    required this.employee,
    required this.itemCount,
    required this.price,
    required this.image,
    required this.purchacePrice,
    required this.date,
  });

  SalesADDModel copyWith({
    String? brand,
    String? model,
    String? color,
    String? storage,
    String? condition,
    String? employee,
    String? itemCount,
    String? price,
    String? image,
    String? purchacePrice,
    String? date,
  }) {
    return SalesADDModel(
      brand: brand ?? this.brand,
      model: model ?? this.model,
      color: color ?? this.color,
      storage: storage ?? this.storage,
      condition: condition ?? this.condition,
      employee: employee ?? this.employee,
      itemCount: itemCount ?? this.itemCount,
      price: price ?? this.price,
      image: image ?? this.image,
      purchacePrice: purchacePrice ?? this.purchacePrice,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Brand': brand,
      'Model': model,
      'Color': color,
      'Storage': storage,
      'Condition': condition,
      'Employee': employee,
      'itemcount': itemCount,
      'Price': price,
      'Image': image,
      'PurshacePrice': purchacePrice,
      'saledate': date,
    };
  }

  factory SalesADDModel.fromMap(Map<String, dynamic> map) {
    return SalesADDModel(
      brand: map['brand'] as String,
      model: map['Model'] as String,
      color: map['Color'] as String,
      storage: map['Storage'] as String,
      condition: map['Condition'] as String,
      employee: map['Employee'] as String,
      itemCount: map['itemcount'] as String,
      price: map['Price'] as String,
      image: map['Image'] as String,
      purchacePrice: map['PurshcePrice'] as String,
      date: map['saledate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SalesADDModel.fromJson(String source) =>
      SalesADDModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SalesADDModel(brand: $brand, model: $model, color: $color, storage: $storage, condition: $condition, employee: $employee, itemCount: $itemCount, price: $price, image: $image, purchacePrice: $purchacePrice, date: $date)';
  }

  @override
  bool operator ==(covariant SalesADDModel other) {
    if (identical(this, other)) return true;

    return other.brand == brand &&
        other.model == model &&
        other.color == color &&
        other.storage == storage &&
        other.condition == condition &&
        other.employee == employee &&
        other.itemCount == itemCount &&
        other.price == price &&
        other.image == image &&
        other.purchacePrice == purchacePrice &&
        other.date == date;
  }

  @override
  int get hashCode {
    return brand.hashCode ^
        model.hashCode ^
        color.hashCode ^
        storage.hashCode ^
        condition.hashCode ^
        employee.hashCode ^
        itemCount.hashCode ^
        price.hashCode ^
        image.hashCode ^
        purchacePrice.hashCode ^
        date.hashCode;
  }
}
// /  "brand": brand,
        // "Model": model,
        // "Color": color,
        // "Storage": storage,
        // "Condition": condition,
        // "Employee": emplyename.text,
        // "itemcount": itemCount,
        // "Price": price,
        // "Image": image,
        // "PurshcePrice": purchasePrice,
        // "saledate": date
