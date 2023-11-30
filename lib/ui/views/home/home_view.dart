import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/data/models/home_enum.dart';
import 'package:sdg_hackaton_app/ui/views/home/navbar.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  final HomeViewEnum homeViewEnum;
  const HomeView({required, Key? key, required this.homeViewEnum})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: viewModel.selectedPageIndex,
          children: viewModel.pages,
        ),
        bottomNavigationBar: NavBar(
          viewModel: viewModel,
        ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class HomeViewArguments {
  final HomeViewEnum homeViewEnum;
  HomeViewArguments({required this.homeViewEnum});
}
