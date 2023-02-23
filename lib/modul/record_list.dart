import 'package:flutter_weight_tracker/modul/record_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:intl/intl.dart';

import 'get_sinifi.dart';

class RecordList extends StatelessWidget {
  final Record record;

  RecordList({Key? key, required this.record}) : super(key: key);
  final GetSinifi _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                DateFormat('EEE, MMM d').format(
                  record.dateTime,
                ),
              ),
            ),
            Text('${record.note}')
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: Icon(
                Icons.edit,
                color: Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                _controller.deletRecord(record);
              },
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
        title: Center(
          child: Text(
            '${record.weight}',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 22),
          ),
        ),
      ),
    );
  }
}
