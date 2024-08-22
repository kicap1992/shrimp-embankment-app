import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tambak_app/ui/widgets/my_button.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './monitoring_view_model.dart';

class MonitoringView extends StatelessWidget {
  const MonitoringView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MonitoringViewModel>.reactive(
      viewModelBuilder: () => MonitoringViewModel(),
      onViewModelReady: (MonitoringViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MonitoringViewModel model,
        Widget? child,
      ) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Monitoring Tambak App",
                    style: boldTextStyle.copyWith(fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  const Image(
                    image: AssetImage("assets/logo.png"),
                    width: 125,
                    height: 125,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Dalam Tambak",
                          style: boldTextStyle,
                        ),
                        _ChildText(
                          title: "Ketinggian Air",
                          text: "${model.socketIoClient.ultrasonic1} cm",
                        ),
                        _ChildText(
                          title: "Ph 1",
                          text: model.socketIoClient.ph1,
                        ),
                        _ChildText(
                          title: "Ph 2",
                          text: model.socketIoClient.ph2,
                        ),
                        _ChildText(
                          title: "TDS 1",
                          text: "${model.socketIoClient.tds1} ppm",
                        ),
                        _ChildText(
                          title: "TDS 2",
                          text: "${model.socketIoClient.tds2} ppm",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Saluran Air",
                          style: boldTextStyle,
                        ),
                        _ChildText(
                          title: "Ketinggian Air",
                          text: "${model.socketIoClient.ultrasonic2} cm",
                        ),
                        _ChildText(
                          title: "Ph",
                          text: model.socketIoClient.ph3,
                        ),
                        _ChildText(
                          title: "TDS",
                          text: "${model.socketIoClient.tds3} ppm",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Status Gerbang: ",
                              style: regularTextStyle,
                            ),
                            TextSpan(
                              text: model.socketIoClient.status == "buka"
                                  ? "Terbuka"
                                  : model.socketIoClient.status == "tutup"
                                      ? "Tertutup"
                                      : "Idle",
                              style: boldTextStyle,
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                    child: MyButton(
                      text: model.isBusy
                          ? "Loading..."
                          : model.socketIoClient.status == "buka"
                              ? "Tutup Gerbang"
                              : "Buka Gerbang",
                      onPressed: () {
                        if (model.isBusy) {
                          return;
                        }
                        model.changeStatus();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ChildText extends StatelessWidget {
  const _ChildText({
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title: ",
              style: regularTextStyle,
            ),
            TextSpan(
              text: text,
              style: italicTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
