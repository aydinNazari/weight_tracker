import 'package:flutter/material.dart';
import 'package:flutter_weight_tracker/modul/get_sinifi.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../modul/record_model.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController? _controller = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  DateTime deneme = DateTime.now();
  int _selectedValue = 70;
 // final GetSinifi _controllerGetX = Get.find();
  final GetSinifi _controllerGetX = Get.put(GetSinifi());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Page'),
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.weightHanging, color: Colors.green),
                    /*Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Weight',
                          ),
                        ),
                      ),
                    )*/
                    Stack(
                      children: [
                        NumberPicker(
                          axis: Axis.horizontal,
                          minValue: 30,
                          maxValue: 220,
                          value: _selectedValue,
                          onChanged: (value) {
                            setState(
                              () {
                                _selectedValue = value;
                              },
                            );
                          },
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            left: 0,
                            bottom: -8,
                            child: Icon(
                              FontAwesomeIcons.chevronUp,
                              size: 22,
                              color: Colors.grey.shade600,
                            ))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TableCalendar(
                  onDaySelected: (value, deneme) {
                    _selectedDate = value;
                  },
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  currentDay: DateTime.now(),
                  calendarStyle: CalendarStyle(
                    rangeHighlightColor: Colors.red,
                    selectedDecoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Not',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff193642),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Record record = Record(
                      dateTime: _selectedDate,
                      weight: _selectedValue,
                      note: _controller?.text,
                    );
                    _controllerGetX.records.add(record);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:Text(
                          'Eklenme Başarılı',
                        ),
                        backgroundColor:Colors.green,
                        duration:const Duration(seconds:2),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Enter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
