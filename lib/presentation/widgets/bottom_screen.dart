import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prayer/business_logic/prayer_cubit.dart';
import 'package:flutter_prayer/business_logic/prayer_states.dart';
import 'package:flutter_prayer/constants/colors.dart';
import 'package:flutter_prayer/model/prayer_model.dart';
import 'package:flutter_prayer/presentation/widgets/default_widget.dart';

class BottomScreen extends StatelessWidget {
  const BottomScreen({Key? key}) : super(key: key);

  Widget _widgetForaPrayerTime({required Map fivePrayer, required int index}) {
    return Row(
      children: [
        Expanded(child: Text(fivePrayer.keys.take(index + 1).last,style: TextStyle(color: MyColors.burbleColor,fontSize: 18,fontWeight: FontWeight.bold),)),
        Text(fivePrayer.values.take(index + 1).last),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerCubit, PrayerStates>(
      builder: (context, state) {
        PrayerModel model = BlocProvider.of<PrayerCubit>(context).model!;
        int index = BlocProvider.of<PrayerCubit>(context).index;

        final Map<String, String> fivePrayer = {
          'Fajr': '${model.results!.datetime![index].times!.fajr}',
          'Dhuhr': '${model.results!.datetime![index].times!.dhuhr}',
          'Asr': '${model.results!.datetime![index].times!.asr}',
          'Maghrib': '${model.results!.datetime![index].times!.maghrib}',
          'Isha': '${model.results!.datetime![index].times!.isha}'
        };
        return ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child:
                    _widgetForaPrayerTime(index: index, fivePrayer: fivePrayer),
              );
            },
            separatorBuilder: (context, index) {
              return DefaultWidget.defaultSeparate();
            },
            itemCount: 5);
      },
    );
  }
}
