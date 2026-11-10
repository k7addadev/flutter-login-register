import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register_page/core/provider/local_provider.dart';
import 'package:login_register_page/core/widgets/app_text.dart';
import 'package:login_register_page/generated/l10n.dart';

/// Bottom sheet that lets the user switch the app language.
///
/// Open it with [LanguageSheet.show].
class LanguageSheet extends ConsumerWidget {
  const LanguageSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      showDragHandle: true,
      builder: (_) => const LanguageSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = S.of(context);

    void selectLanguage(String languageCode) {
      ref.read(localProvider.notifier).changeLanguage(languageCode);
      Navigator.pop(context);
    }

    final isArabic = ref.watch(isArabicProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            alignment: isArabic
                ? AlignmentGeometry.bottomRight
                : AlignmentGeometry.bottomLeft,
            title: strings.chooseLanguage,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(height: 10),
          _LanguageTile(
            title: strings.englishLanguage,
            onTap: () => selectLanguage('en'),
          ),
          _LanguageTile(
            title: strings.arabicLanguage,
            onTap: () => selectLanguage('ar'),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AppText(title: title, fontSize: 18, fontWeight: FontWeight.w700),
      onTap: onTap,
    );
  }
}
