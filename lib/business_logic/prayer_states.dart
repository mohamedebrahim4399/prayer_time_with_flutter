import 'package:flutter_prayer/model/prayer_model.dart';

abstract class PrayerStates{}

class InitialPrayerState extends PrayerStates{}
class GetPrayerTimeState extends PrayerStates{
  PrayerModel model;
  GetPrayerTimeState({required this.model});

}
class ChangeTheCurrentDayState extends PrayerStates{}
class LoadingState extends PrayerStates{}
