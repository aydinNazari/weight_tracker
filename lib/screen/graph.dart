import 'package:flutter/material.dart';
import 'package:flutter_weight_tracker/modul/get_sinifi.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_weight_tracker/modul/record_model.dart';
import 'package:intl/intl.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

final GetSinifi _controller = Get.put(GetSinifi());
var records = _controller.records;

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Graph',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .7,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Weight Tracker'),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<Record, String>>[
                  LineSeries<Record, String>(
                      dataSource: records,
                      xValueMapper: (Record record, _) =>

                      DateFormat('EEE,MMM d').format(
                          record.dateTime
                      ),
                      yValueMapper: (Record record, _) =>
                          record.weight,
                  name: '',
                    dataLabelSettings: DataLabelSettings(isVisible: true)
                  ),

                ],
              ),
            ),
          )),
    );
  }
}
