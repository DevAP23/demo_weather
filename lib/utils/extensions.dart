import 'package:get/get.dart';
import 'package:weather_app/utils/app_strings.dart';

extension StringExtension on String {
  /// get the existing countries only
  String toRightCountry() {
    if (this == 'Israel') return 'Palestine';
    return this;
  }

  /// get the existing cities only
  String toRightCity() {
    if (this == 'Sederot') return 'Gaza';
    return this;
  }

  /// convert icon resolution from 64x64 to 128x128
  String toHighRes() {
    return replaceFirst('64x64', '128x128');
  }

  /// add http: before the icon link
  String addHttpPrefix() {
    return 'https:$this';
  }

  /// convert wind direction from letters to words => N = North
  String getWindDir() {
    switch (this) {
      case 'N':
        return AppStrings.north.tr;
      case 'S':
        return AppStrings.south.tr;
      case 'E':
        return AppStrings.east.tr;
      case 'W':
        return AppStrings.west.tr;
      case 'NE':
      case 'NNE':
      case 'ENE':
        return AppStrings.northeast.tr;
      case 'SE':
      case 'ESE':
      case 'SSE':
        return AppStrings.southeast.tr;
      case 'SW':
      case 'SSW':
      case 'WSW':
        return AppStrings.southwest.tr;
      case 'NW':
      case 'WNW':
      case 'NNW':
        return AppStrings.northwest.tr;
      default:
        return this;
    }
  }
}
/*
  /// convert the date to time => 2023-09-24 01:00 = 01:00
  String convertToTime() {
    var dateTime = DateTime.parse(this);
    if (dateTime.hour == DateTime.now().hour) return AppStrings.now.tr;
    return DateFormat('HH:mm').format(dateTime);
  }

  /// format the time => 01:00 AM = 01:00
  String formatTime() {
    var dateTime = DateFormat("hh:mm a").parse(this);
    return DateFormat("hh:mm").format(dateTime);
  }
}

extension DateTimeExtension on DateTime {
  /// convert the DateTime to day => 2023-09-24 = Sunday
  String convertToDay() {
    if (day == DateTime.now().day) return AppStrings.today.tr;
    return DateFormat.EEEE().format(this);
  }
}*/
