import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prayer/budiness_logic/prayer_states.dart';
import 'package:flutter_prayer/helpers/dio_helper.dart';
import 'package:flutter_prayer/helpers/location_helper.dart';
import 'package:flutter_prayer/model/prayer_model.dart';
import 'package:geolocator/geolocator.dart';

class PrayerCubit extends Cubit<PrayerStates> {
  PrayerCubit() : super(InitialPrayerState());
  PrayerModel? model;
  int index = 0;

  void getPrayerTime() async {
    emit(LoadingState());
    DioHelper dioHelper = DioHelper();
    Position position = await LocationHelper.determineCurrentLocation();
    model = PrayerModel.fromJson(
      await dioHelper.getPrayerTime(
        endPoint: 'this_month.json',
        query: {
          'longitude': position.longitude.toString(),
          'latitude': position.latitude.toString(),
          'elevation': '333'
        },
      ),
    );
    emit(GetPrayerTimeState(model: model!));
  }

  void changeTheCurrentDay(int index) {
    this.index = index;
    emit(ChangeTheCurrentDayState());
  }
}
