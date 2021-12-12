import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prayer/business_logic/prayer_cubit.dart';
import 'package:flutter_prayer/business_logic/prayer_states.dart';
import 'package:flutter_prayer/constants/colors.dart';
import 'package:flutter_prayer/presentation/widgets/bottom_screen.dart';
import 'package:flutter_prayer/presentation/widgets/default_widget.dart';
import 'package:flutter_prayer/presentation/widgets/top_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.accentBlueColor,
      body: SafeArea(
        child:
            BlocBuilder<PrayerCubit, PrayerStates>(builder: (context, state) {
          if (state is LoadingState) {
            return DefaultWidget.defaultCircularProgressIndicator();
          }
          return Column(children: [
             TopScreen(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: MyColors.whiteColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: const BottomScreen(),
              ),
            )
          ]);
        }),
      ),
    );
  }
}
