
import 'package:flutter_weight_tracker/modul/record_model.dart';
import 'package:get/get.dart';

class GetSinifi extends GetxController{
  var records=<Record>[
   /* Record(weight: 80, dateTime: DateTime.now(),note: 'AAAAAAA'),
    Record(weight: 40, dateTime: DateTime.now(),note: 'BBBBBBB'),
    Record(weight: 50, dateTime: DateTime.now(),note: 'CCCCCCC'),*/
  ].obs;
  void addRecord(){
    records.add(Record(weight: 80, dateTime: DateTime.now(),note: 'note'));
    print(records.length);
  }
  void deletRecord(Record record){
    records.remove(record);
  }

}