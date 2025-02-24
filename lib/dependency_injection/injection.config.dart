// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/data_sources/location_data_source.dart' as _i105;
import '../data/data_sources/weather_data_source.dart' as _i244;
import '../data/repositories/weather_repository.dart' as _i592;
import '../domain/use_cases/get_weather_use_case.dart' as _i683;
import '../presentation/main_screen/bloc/weather_bloc.dart' as _i515;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i244.WeatherDataSource>(() => _i244.WeatherDataSource());
    gh.singleton<_i105.LocationDataSource>(() => _i105.LocationDataSource());
    gh.singleton<_i592.WeatherRepository>(() => _i592.WeatherRepository(
          gh<_i244.WeatherDataSource>(),
          gh<_i105.LocationDataSource>(),
        ));
    gh.singleton<_i683.GetWeatherUseCase>(
        () => _i683.GetWeatherUseCase(gh<_i592.WeatherRepository>()));
    gh.factory<_i515.WeatherBloc>(() =>
        _i515.WeatherBloc(getWeatherUseCase: gh<_i683.GetWeatherUseCase>()));
    return this;
  }
}
