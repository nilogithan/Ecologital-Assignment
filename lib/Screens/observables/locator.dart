import 'package:ecologital_assignment/Screens/observables/service/Basket_Change_Service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setup(){
 getIt.registerSingleton<BasketChangeService>(BasketChangeService());
}