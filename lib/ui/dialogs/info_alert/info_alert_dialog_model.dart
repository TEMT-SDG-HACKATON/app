import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/models/home_enum.dart';
import 'package:sdg_hackaton_app/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InfoAlertDialogModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void goToHome() {
    _navigationService.navigateTo(Routes.homeView,
        arguments: HomeViewArguments(homeViewEnum: HomeViewEnum.dashboard));
  }
}
