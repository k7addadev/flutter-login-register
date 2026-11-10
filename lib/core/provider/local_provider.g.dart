// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocalNotifier)
final localProvider = LocalNotifierProvider._();

final class LocalNotifierProvider
    extends $NotifierProvider<LocalNotifier, Locale> {
  LocalNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localNotifierHash();

  @$internal
  @override
  LocalNotifier create() => LocalNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$localNotifierHash() => r'4d4431183639a9328f4a83a6ba78bafa4e5c9568';

abstract class _$LocalNotifier extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(isArabic)
final isArabicProvider = IsArabicProvider._();

final class IsArabicProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsArabicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isArabicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isArabicHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isArabic(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isArabicHash() => r'957679069fdd4f4c4baf0ebe327e1e6f08c25999';
