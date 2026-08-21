// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EmpresaNotifier)
const empresaProvider = EmpresaNotifierProvider._();

final class EmpresaNotifierProvider
    extends $AsyncNotifierProvider<EmpresaNotifier, void> {
  const EmpresaNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'empresaProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$empresaNotifierHash();

  @$internal
  @override
  EmpresaNotifier create() => EmpresaNotifier();
}

String _$empresaNotifierHash() => r'e9624f005008e50e32191e3798671c7d62b065b7';

abstract class _$EmpresaNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<void>, void>,
        AsyncValue<void>,
        Object?,
        Object?>;
    element.handleValue(ref, null);
  }
}
