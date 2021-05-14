
import 'package:e_ticaret_flutter_app/Core/Service/chat_service.dart';
import 'package:e_ticaret_flutter_app/Core/Service/product_share_service.dart';
import 'package:e_ticaret_flutter_app/ViewModal/chats_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt=GetIt.instance;

setupLocator(){
  getIt.registerLazySingleton(() => ChatService());
  getIt.registerLazySingleton(() => ProductShareService());

  getIt.registerFactory(() => ChatsModel());
}