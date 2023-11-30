import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import 'splash_viewmodel.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SplashViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: SvgPicture.asset(
          logoImage,
          semanticsLabel: 'logo',
          height: 120,
          width: 120,
        ),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashViewModel();

  @override
  void onViewModelReady(SplashViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
