import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';


class BaseUi extends StatelessWidget {
  final List<Widget> children;
  final FloatingActionButton? floatingActionButton;
  final AppBar? appBar;
  final bool? allowBackButton;
  final bool? safeTop;
  final Function? onRefreshFunction;
  final bool refreshedEnabled;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;

  const BaseUi(
      {Key? key,
      this.allowBackButton,
      required this.children,
      this.floatingActionButton,
      this.appBar,
      this.safeTop,
      this.refreshedEnabled = true,
      this.resizeToAvoidBottomInset = true,
      this.backgroundColor,
      this.onRefreshFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return allowBackButton ?? true;
        },
        child: !refreshedEnabled
            ? Scaffold(
                appBar: appBar,
                backgroundColor: backgroundColor ?? AppColors.backgroundColor,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                body: SafeArea(
                  top: safeTop ?? false,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(children: [
                      ...children,
                      //loader
                      // isBusyState
                      //     ? Container(
                      //         height: sS(context).h,
                      //         width: sS(context).w,
                      //         color: AppColors.black().withOpacity(0.5),
                      //         child: Center(
                      //           child: customDialog(
                      //             Center(child: loading()),
                      //             align: Alignment.center,
                      //             height: 150,
                      //             width: 150,
                      //           ), //CircularProgressIndicator(),
                      //         ))
                      //     : Container()
                    ]),
                  ),
                ),
                floatingActionButton: floatingActionButton,
              )
            : RefreshIndicator(
                displacement: 100,
                backgroundColor: AppColors.primaryColor,
                color: AppColors.white,
                strokeWidth: 3,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: () async {
                  if (onRefreshFunction != null) {
                    return onRefreshFunction!();
                  }
                },
                child: Scaffold(
                  appBar: appBar,
                  backgroundColor: backgroundColor ?? AppColors.backgroundColor,
                  resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                  body: SafeArea(
                    bottom: false,
                    top: safeTop ?? false,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          ...children,
                          //loader
                          // isBusyState
                          //     ? Container(
                          //         height: sS(context).h,
                          //         width: sS(context).w,
                          //         color:
                          //             AppColors.black().withOpacity(0.5),
                          //         child: Center(
                          //           child: customDialog(
                          //             Center(child: loading()),
                          //             align: Alignment.center,
                          //             height: 150,
                          //             width: 150,
                          //           ), //CircularProgressIndicator(),
                          //         ))
                          //     : Container()
                        ],
                      ),
                    ),
                  ),
                  floatingActionButton: floatingActionButton,
                ),
              ));
  }
}
