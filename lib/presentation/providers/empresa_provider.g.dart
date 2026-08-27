// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(httpClient)
const httpClientProvider = HttpClientProvider._();

final class HttpClientProvider
    extends $FunctionalProvider<http.Client, http.Client, http.Client>
    with $Provider<http.Client> {
  const HttpClientProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'httpClientProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$httpClientHash();

  @$internal
  @override
  $ProviderElement<http.Client> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  http.Client create(Ref ref) {
    return httpClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(http.Client value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<http.Client>(value),
    );
  }
}

String _$httpClientHash() => r'd264add0180735bd60a171263e3981deb730538d';

@ProviderFor(empresaRemoteDatasource)
const empresaRemoteDatasourceProvider = EmpresaRemoteDatasourceProvider._();

final class EmpresaRemoteDatasourceProvider extends $FunctionalProvider<
    EmpresaRemoteDatasource,
    EmpresaRemoteDatasource,
    EmpresaRemoteDatasource> with $Provider<EmpresaRemoteDatasource> {
  const EmpresaRemoteDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'empresaRemoteDatasourceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$empresaRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<EmpresaRemoteDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EmpresaRemoteDatasource create(Ref ref) {
    return empresaRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmpresaRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmpresaRemoteDatasource>(value),
    );
  }
}

String _$empresaRemoteDatasourceHash() =>
    r'9bf2947adb6a0325e002ccaeba43f3269b522629';

@ProviderFor(empresaRepository)
const empresaRepositoryProvider = EmpresaRepositoryProvider._();

final class EmpresaRepositoryProvider extends $FunctionalProvider<
    EmpresaRepository,
    EmpresaRepository,
    EmpresaRepository> with $Provider<EmpresaRepository> {
  const EmpresaRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'empresaRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$empresaRepositoryHash();

  @$internal
  @override
  $ProviderElement<EmpresaRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EmpresaRepository create(Ref ref) {
    return empresaRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmpresaRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmpresaRepository>(value),
    );
  }
}

String _$empresaRepositoryHash() => r'f53008625fd6fcbb59e9ea7a256cf234371e08a1';

@ProviderFor(sharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider extends $FunctionalProvider<
    SharedPreferences,
    SharedPreferences,
    SharedPreferences> with $Provider<SharedPreferences> {
  const SharedPreferencesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sharedPreferencesProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'1a6250efdc19e86c923ceb598a77ff74d64378e6';
