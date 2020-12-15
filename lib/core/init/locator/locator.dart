import 'package:get_it/get_it.dart';
import 'package:ne_sever_mobile/views/router_view/viewmodel/router_view_model.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => RouterViewModel());
  // locator.registerLazySingleton(() => TicketService());
  // locator.registerLazySingleton(() => TicketViewModel());
  // locator.registerLazySingleton(() => Logger());
}
