// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_boilerplate/features/auth/domain/repositories/auth_repository.dart'
    as _i117;
import 'package:flutter_boilerplate/features/auth/domain/repositories/auth_repository_impl.dart'
    as _i903;
import 'package:flutter_boilerplate/features/auth/presentation/cubits/auth_cubit.dart'
    as _i369;
import 'package:flutter_boilerplate/shared/di/injection.dart' as _i345;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.singleton<_i117.AuthRepository>(
        () => _i903.AuthRepositoryImpl(gh<_i454.SupabaseClient>()));
    gh.factory<_i369.AuthCubit>(
        () => _i369.AuthCubit(authRepository: gh<_i117.AuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i345.RegisterModule {}
