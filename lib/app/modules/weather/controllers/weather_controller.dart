import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/extensions.dart';
import '../../../../utils/constants.dart';
import '../../../data/models/weather_details_model.dart';
import '../../../data/models/api_call_status.dart';
import '../../../services/api_service.dart';

class WeatherController extends GetxController {
  static WeatherController get instance => Get.find();

  WeatherDetailsModel? weatherDetails;
  List<Forecastday>? forecastdays;

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;


  @override
  void onInit() async {
    super.onInit();
  }
  
  @override
  void onReady() {
    getWeatherDetails();
    super.onReady();
  }

  /// get weather details
  getWeatherDetails() async {
    await  await ApiService.getApi(
      Constants.forecastWeatherApiUrl,
      queryParameters: {
        Constants.key: Constants.apiKey,
        Constants.q: Get.arguments,
        Constants.days: 7,
      },
      onSuccess: (response) {
        weatherDetails = WeatherDetailsModel.fromJson(response.data);
        forecastdays = weatherDetails?.forecast.forecastday;
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      onError: () {
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }
}
