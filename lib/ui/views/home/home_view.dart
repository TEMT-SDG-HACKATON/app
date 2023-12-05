import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/models/home_enum.dart';
import 'package:sdg_hackaton_app/ui/views/home/dashboard_view.dart';
import 'package:sdg_hackaton_app/ui/views/home/widgets/navbar.dart';
import 'package:sdg_hackaton_app/ui/views/investment/investment_view.dart';
import 'package:sdg_hackaton_app/ui/views/profile/profile_view.dart';
import 'package:sdg_hackaton_app/ui/views/savings/savings_view.dart';
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
    List<Widget> pages = <Widget>[
      DashboardView(viewModel: viewModel),
      SavingsView(),
      InvestmentView(),
      ProfileView()
    ];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: viewModel.selectedPageIndex,
          children: pages,
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
