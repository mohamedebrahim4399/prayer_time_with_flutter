import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prayer/business_logic/prayer_cubit.dart';
import 'package:flutter_prayer/business_logic/prayer_states.dart';
import 'package:flutter_prayer/constants/colors.dart';
import 'package:flutter_prayer/model/prayer_model.dart';

class TopScreen extends StatelessWidget {
   TopScreen({
    Key? key,
  }) : super(key: key);

  final List<String> daysInMonth = [];

  final List<String> _monthsInTheYear = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  Widget buildCurrentMonthAndYear() {
    return BlocBuilder<PrayerCubit, PrayerStates>(
      builder: (context, state) {
        PrayerModel model = BlocProvider.of<PrayerCubit>(context).model!;
        int currentMonth = model.results!.datetime![0].date!.gregorian!.month;
        String currentYear =
            model.results!.datetime![0].date!.gregorian!.year.toString();
        return Expanded(
          child: Text(
            returnCurrentMonthAndYear(currentMonth, currentYear),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyColors.burbleColor),
          ),
        );
      },
    );
  }

  Widget buildMonthsWidget() {
    return BlocBuilder<PrayerCubit, PrayerStates>(
      builder: (context, state) {
        PrayerModel model = BlocProvider.of<PrayerCubit>(context).model!;
        _daysInMonth(model.results!.datetime!);
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: daysInMonth.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      minWidth: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: context.read<PrayerCubit>().index == index
                          ? MyColors.blueColor
                          : Colors.transparent,
                      onPressed: () {
                        BlocProvider.of<PrayerCubit>(context)
                            .changeTheCurrentDay(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * .042),
                        child: SizedBox(
                          width: 20,
                          child: Text(
                            daysInMonth[index],
                            style: TextStyle(
                                color: MyColors.burbleColor, fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildDaysWidgets() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 20,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _daysInWeeks().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .03),
                  child: SizedBox(
                      width: 30,
                      child: Text(
                        _daysInWeeks()[index],
                        style: TextStyle(
                            color: MyColors.burbleColor, fontSize: 15),
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              buildCurrentMonthAndYear(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
          ),
          buildDaysWidgets(),
          buildMonthsWidget(),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }

  String returnCurrentMonthAndYear(int month, String year) =>
      _monthsInTheYear[month - 1] + ' ' + year;

  String returnDaysInMonth(String day) => day.substring(8, 10) + ' ';
  List<String> _daysInWeeks() {
    List days = [
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
      "Sun",
    ];
    DateTime date = DateTime.now();
    List<String> arrangeDays = [];
    for (int i = 0; i < days.length; i++) {
      if (i + date.weekday >= 8) {
        arrangeDays.add(days[i + date.weekday - 8]);
      } else {
        arrangeDays.add(days[i + (date.weekday - 1)]);
      }
    }
    return arrangeDays;
  }

  void _daysInMonth(List days) {
    for (int i = 0; i < days.length; i++) {
      String x = DateTime.now().toString().substring(8, 10);
      String y = days[i].date.gregorian.toString().substring(8, 10);
      if (int.parse(x) <= int.parse(y)) {
        daysInMonth.add(y);
      }
    }
  }
}
