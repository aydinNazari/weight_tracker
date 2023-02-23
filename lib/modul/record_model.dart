/*
import  'package:freezed_annotation/freezed_annotation.dart';

part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class Record with _$Record {


  factory Record({required DateTime dateTime, required int weight, String? photoUrl, String? note}) = _Record;

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
class Record{
   int weight;
  final String? imageUrl;
  final DateTime dateTime;
  final String? note;

  Record({required this.weight,required this.dateTime,this.imageUrl,this.note});

  int get getWight=> weight;
  String? get getimageUrl=> imageUrl;
  DateTime get getDate=>dateTime;
  String? get getNot=>note;

}*/
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'record_model.freezed.dart';
part 'record_model.g.dart';
@freezed
class Record with _$Record{

  factory Record({required int weight,required DateTime dateTime,String? imageUrl,String? note})=_Record;
  factory Record.fromJson(Map<String, Object?> json)
  => _$RecordFromJson(json);

}