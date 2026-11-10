import 'package:flutter/material.dart';
import 'package:login_register_page/core/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color colorContainer;
  final VoidCallback? onTap;

  const AppButton({
    super.key,
    required this.title,
    required this.colorContainer,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        splashColor: Colors.white.withValues(alpha: 0.3),
        highlightColor: Colors.white.withValues(alpha: 0.1),
        child: Ink(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorContainer,
            borderRadius: BorderRadius.circular(24),
          ),
          child: AppText(
            alignment: Alignment.center,
            title: title,
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
