import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_text.dart';
import './log_data_view_model.dart';

class LogDataView extends StatelessWidget {
  const LogDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LogDataViewModel>.reactive(
      viewModelBuilder: () => LogDataViewModel(),
      onViewModelReady: (LogDataViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        LogDataViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: model.isBusy
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Image(
                            image: AssetImage("assets/logo.png"),
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          " Log Data Tambak",
                          style: boldTextStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Table(
                          border: TableBorder.all(),
                          children: [
                            // Header Row
                            TableRow(
                              children: [
                                TableCell(
                                  child: Center(
                                    child: Text(
                                      'Waktu',
                                      style: boldTextStyle.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text(
                                      'Ph 1',
                                      style: boldTextStyle.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text(
                                      'Ph 2',
                                      style: boldTextStyle.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Ketinggian Air',
                                      style: boldTextStyle.copyWith(
                                        fontSize: 11,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text(
                                      'TDS 1',
                                      style: boldTextStyle.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text(
                                      'TDS 2',
                                      style: boldTextStyle.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Data Rows
                            for (var i = 0; i < model.listData.length; i++)
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        model.otherFunction.formatDateString2(
                                            model.listData[i]['waktu']
                                                .toString()),
                                        style: regularTextStyle.copyWith(
                                          fontSize: 11,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        model.listData[i]['ph1'].toString(),
                                        style: regularTextStyle.copyWith(
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        model.listData[i]['ph2'].toString(),
                                        style: regularTextStyle.copyWith(
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "${model.listData[i]['ultrasonic1']} cm",
                                        style: regularTextStyle.copyWith(
                                          fontSize: 11,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        "${model.listData[i]['tds1']} ppm",
                                        style: regularTextStyle.copyWith(
                                          fontSize: 11,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        "${model.listData[i]['tds2']} ppm",
                                        style: regularTextStyle.copyWith(
                                          fontSize: 11,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        Text(
                          " Log Data Saluran Air",
                          style: boldTextStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Table(
                          border: TableBorder.all(),
                          children: [
                            // Header Row
                            TableRow(
                              children: [
                                TableCell(
                                  child: Center(
                                    child: Text(
                                      'Waktu',
                                      style: boldTextStyle.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text(
                                      'Ph',
                                      style: boldTextStyle.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Ketinggian Air',
                                      style: boldTextStyle.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text(
                                      'Salinitas',
                                      style: boldTextStyle.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Data Rows
                            for (var i = 0; i < model.listData.length; i++)
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        model.otherFunction.formatDateString2(
                                            model.listData[i]['waktu']
                                                .toString()),
                                        style: regularTextStyle.copyWith(
                                          fontSize: 11,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        model.listData[i]['ph3'].toString(),
                                        style: regularTextStyle.copyWith(
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "${model.listData[i]['ultrasonic1']} cm",
                                        style: regularTextStyle.copyWith(
                                          fontSize: 11,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Center(
                                      child: Text(
                                        "${model.listData[i]['tds1']} ppm",
                                        style: regularTextStyle.copyWith(
                                          fontSize: 11,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
