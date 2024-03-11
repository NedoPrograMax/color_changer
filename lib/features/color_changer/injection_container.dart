import 'package:color_changer/features/color_changer/data/datasources/color_changer_datasource.dart';
import 'package:color_changer/features/color_changer/data/repositories/color_changer_repository_impl.dart';
import 'package:color_changer/features/color_changer/domain/repositories/color_changer_repository.dart';
import 'package:color_changer/features/color_changer/presentation/cubits/color_changer_cubit/color_changer_cubit.dart';
import 'package:color_changer/injection_container.dart';

///Dependency injection for this feature
mixin ColorChangerInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    //Cubits
    sl.registerLazySingleton(
      () => ColorChangerCubit(repository: sl()),
    );

    //Repositoies
    sl.registerLazySingleton<ColorChangerRepository>(
      () => ColorChangerRepositoryImpl(
        datasource: sl(),
      ),
    );

    //Datasources

    sl.registerLazySingleton<ColorChangerDatasource>(
      ColorChangerDatasourceImpl.new,
    );
  }
}
