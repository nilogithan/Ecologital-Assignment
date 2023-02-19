// ignore_for_file: file_names

import 'package:ecologital_assignment/Screens/observables/service/state/Basket_Change.dart';

class BasketChangeService {
  final BasketChange _sbasketChangeNotifier = BasketChange();

  BasketChange get basketChangeNotifier => _sbasketChangeNotifier;
}