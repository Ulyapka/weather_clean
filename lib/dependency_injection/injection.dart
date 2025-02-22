import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

GetIt getIt = GetIt.asNewInstance();

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)

Future<void> configureDependencies() async => getIt.init();