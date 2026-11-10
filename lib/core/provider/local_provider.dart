import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_provider.g.dart';

@riverpod
class LocalNotifier extends _$LocalNotifier {
  @override
  Locale build() {
    return const Locale('en');
  }

  Future<void> changeLanguage(String languageCode) async {
    state = Locale(languageCode);
  }
}

@riverpod
bool isArabic(Ref ref) {
  return ref.watch(localProvider).languageCode == 'ar';
}
