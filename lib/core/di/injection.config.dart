// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:elinext_grid/data/datasources/picsum_image_data_source.dart'
    as _i979;
import 'package:elinext_grid/data/repositories/image_repository_impl.dart'
    as _i250;
import 'package:elinext_grid/domain/repositories/image_repository.dart'
    as _i866;
import 'package:elinext_grid/domain/usecases/add_image.dart' as _i699;
import 'package:elinext_grid/domain/usecases/load_image_batch.dart' as _i175;
import 'package:elinext_grid/presentation/modules/grid/bloc/grid_bloc.dart'
    as _i630;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i979.PicsumImageDataSource>(
      () => _i979.PicsumImageDataSource(),
    );
    gh.lazySingleton<_i866.ImageRepository>(
      () => _i250.ImageRepositoryImpl(gh<_i979.PicsumImageDataSource>()),
    );
    gh.factory<_i699.AddImage>(
      () => _i699.AddImage(gh<_i866.ImageRepository>()),
    );
    gh.factory<_i175.LoadImageBatch>(
      () => _i175.LoadImageBatch(gh<_i866.ImageRepository>()),
    );
    gh.factory<_i630.GridBloc>(
      () => _i630.GridBloc(gh<_i175.LoadImageBatch>(), gh<_i699.AddImage>()),
    );
    return this;
  }
}
