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
    extends $AsyncNotifierProvider<EmpresaNotifier, Empresa?> {
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

String _$empresaNotifierHash() => r'e7d1f0cb29a48365369d2862b3aa37c05811367c';

abstract class _$EmpresaNotifier extends $AsyncNotifier<Empresa?> {
  FutureOr<Empresa?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Empresa?>, Empresa?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<Empresa?>, Empresa?>,
        AsyncValue<Empresa?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
