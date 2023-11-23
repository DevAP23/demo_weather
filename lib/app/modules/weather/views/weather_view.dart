import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/weather_controller.dart';
import '../wdgets/today_forecast.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<WeatherController>(
          builder: (_) => Stack(
            children: [
              controller.weatherDetails == null
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        controller.weatherDetails?.location
                                                .name ??
                                            "",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        "${controller.weatherDetails?.location.region}, ${controller.weatherDetails?.location.country}" ??
                                            "",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.height * 0.015,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Align(
                                      child: Text(
                                        '${controller.weatherDetails?.current.feelslikeC}˚C',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      child: Text(
                                        controller.weatherDetails?.current
                                                .condition.text ??
                                            "",
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    'Forecast for today',
                                    style: GoogleFonts.questrial(
                                      color: Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20),
                                    itemCount:
                                        controller.forecastdays?.length ?? 0,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var forecast =
                                          controller.forecastdays?[index];
                                      return ForecastToday(
                                          forecast?.date.toString() ?? "",
                                          forecast?.day.avgtempC.toString() ??
                                              "",
                                          forecast?.day.maxwindKph.toString() ??
                                              "",
                                          forecast?.day.dailyChanceOfRain
                                                  .toString() ??
                                              "",
                                          FontAwesomeIcons.cloudRain,
                                          size);
                                    }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
