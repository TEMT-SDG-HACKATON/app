import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/strings.dart';
import 'package:sdg_hackaton_app/utilities/ui_helpers/dimensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'info_alert_dialog_model.dart';

const double _graphicSize = 60;

class InfoAlertDialog extends StackedView<InfoAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InfoAlertDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: _graphicSize,
                height: _graphicSize,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(_graphicSize / 2),
                  ),
                ),
                alignment: Alignment.center,
                child: request.title == successString
                    ? const Icon(
                        Icons.check_circle_outline_rounded,
                        size: 48,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.info_outline_rounded,
                        size: 48,
                        color: Colors.red,
                      )),
            verticalSpaceTiny,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.sta,
                    children: [
                      Text(
                        request.title!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      verticalSpaceTiny,
                      Text(
                        request.description!,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.mediumGrey),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            GestureDetector(
              onTap: () {
                completer(DialogResponse(
                  confirmed: true,
                ));
                if (request.title == successString) {
                  viewModel.goToHome();
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Got it',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  InfoAlertDialogModel viewModelBuilder(BuildContext context) =>
      InfoAlertDialogModel();
}
