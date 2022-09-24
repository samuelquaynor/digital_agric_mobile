// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderEntityAdapter extends TypeAdapter<OrderEntity> {
  @override
  final int typeId = 1;

  @override
  OrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderEntity(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      userId: fields[2] as String,
      totalPrice: fields[4] as double,
      deliveryPrice: fields[5] as double,
      destinationLongitude: fields[6] as double,
      destinationLatitude: fields[7] as double,
      destinationName: fields[8] as String,
      carts: (fields[3] as List).cast<Cart?>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.totalPrice)
      ..writeByte(5)
      ..write(obj.deliveryPrice)
      ..writeByte(6)
      ..write(obj.destinationLongitude)
      ..writeByte(7)
      ..write(obj.destinationLatitude)
      ..writeByte(8)
      ..write(obj.destinationName)
      ..writeByte(3)
      ..write(obj.carts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: json['userId'] as String,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      deliveryPrice: (json['deliveryPrice'] as num).toDouble(),
      destinationLongitude: (json['destinationLongitude'] as num).toDouble(),
      destinationLatitude: (json['destinationLatitude'] as num).toDouble(),
      destinationName: json['destinationName'] as String,
      carts: json['items'] == null ? [] : _cartFromJson(json['items'] as List),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'userId': instance.userId,
      'totalPrice': instance.totalPrice,
      'deliveryPrice': instance.deliveryPrice,
      'destinationLongitude': instance.destinationLongitude,
      'destinationLatitude': instance.destinationLatitude,
      'destinationName': instance.destinationName,
      'items': instance.carts.map((e) => e?.toJson()).toList(),
    };
