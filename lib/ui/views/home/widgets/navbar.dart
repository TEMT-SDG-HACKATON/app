import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sdg_hackaton_app/ui/views/home/home_viewmodel.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';

class NavBar extends StatelessWidget {
  final HomeViewModel viewModel;
  const NavBar({Key? key, required this.viewModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.15),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.05),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 9),
          child: GNav(
            rippleColor: AppColors.primaryColor.withOpacity(0.3),
            hoverColor: AppColors.primaryColor.withOpacity(0.3),
            gap: 8,
            tabBorderRadius: 10,
            activeColor: AppColors.primaryColor,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: AppColors.primaryColor.withOpacity(0.2),
            color: Colors.red,
            tabs: [
              GButton(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                icon: Icons.home,
                leading: SvgPicture.asset(homeImage,
                    height: 20.h,
                    width: 20.w,
                    color: viewModel.selectedPageIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.darkGreyColor),
                text: 'Home',
              ),
              GButton(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                icon: Icons.headphones,
                leading: SvgPicture.asset(targetImage,
                    height: 20.h,
                    width: 20.w,
                    color: viewModel.selectedPageIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.darkGreyColor),
                text: 'Save',
              ),
              GButton(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                icon: CupertinoIcons.tv,
                leading: SvgPicture.asset(investImage,
                    height: 20.h,
                    width: 20.w,
                    color: viewModel.selectedPageIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.darkGreyColor),
                text: 'Invest',
              ),
              GButton(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                icon: Icons.clean_hands,
                leading: SvgPicture.asset(userImage,
                    height: 20.h,
                    width: 20.w,
                    color: viewModel.selectedPageIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.darkGreyColor),
                text: 'Profile',
              ),
            ],
            selectedIndex: viewModel.selectedPageIndex,
            onTabChange: (index) {
              //Provider.of<AppProvider>(context, listen: false).goToTab(-1);
              viewModel.goToTab(index);
            },
          ),
        ),
      ),
    );
  }
}
