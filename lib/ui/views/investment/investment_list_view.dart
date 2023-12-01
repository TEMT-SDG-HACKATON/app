import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/views/investment/investment_viewmodel.dart';
import 'package:sdg_hackaton_app/ui/views/investment/widgets/investment_tile.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:stacked/stacked.dart';

class InvestmentListView extends StackedView<InvestmentViewModel> {
  final String type;
  const InvestmentListView({Key? key, required this.type}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InvestmentViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(color: Colors.black),
              Gap(12.h),
              CustomTextDisplay(
                inputText: type,
                textFontSize: 20,
                textFontWeight: FontWeight.w500,
              ),
              Gap(24.h),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 30,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        viewModel.showDetilsBottomSheet();
                      },
                      child: investmentTile(
                          name: 'Kanayo Farms',
                          percentage: '11%',
                          logo: logoImage),
                    );
                  }),
            ],
          ),
        ),
      )
    ]);
  }

  @override
  InvestmentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InvestmentViewModel();
}

class InvestmentListViewArguments {
  final String type;
  InvestmentListViewArguments({required this.type});
}
