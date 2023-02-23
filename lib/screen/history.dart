
import 'package:flutter_weight_tracker/modul/record_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weight_tracker/modul/get_sinifi.dart';
import 'package:flutter_weight_tracker/modul/record_list.dart';
import 'package:flutter_weight_tracker/screen/add_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final GetSinifi _controller = Get.put(GetSinifi());

  @override
  Widget build(BuildContext context) {
    List<Record> records=_controller.records;
    return SafeArea(
        child: Obx(
      () => Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(AddPage());
              },
              child: Icon(Icons.add),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'History',
          ),
        ),
        body: Center(
          child: records.isEmpty
              ? Container(
                child: Text('Please Add Som Records'),
              )
              :  ListView(
            physics: const BouncingScrollPhysics(),
            children: records
                .map((element) => RecordList(record: element))
                .toList(),
          ),
        ),
      ),
    ));
  }
}
