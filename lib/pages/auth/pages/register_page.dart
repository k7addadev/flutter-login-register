import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k7addadev_ui/k7addadev_ui.dart';
import 'package:login_register_page/core/provider/local_provider.dart';
import 'package:login_register_page/core/widgets/app_text.dart';
import 'package:login_register_page/generated/l10n.dart';
import 'package:login_register_page/core/widgets/app_button.dart';
import 'package:login_register_page/core/widgets/language_sheet.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final userNameController = TextEditingController();
  final contactController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool vPassword = true;

  @override
  void dispose() {
    userNameController.dispose();
    contactController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget viewPassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          vPassword = !vPassword;
        });
      },
      icon: Icon(vPassword ? Icons.visibility_off : Icons.visibility),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = ref.watch(isArabicProvider);
    final strings = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () => LanguageSheet.show(context),
                    icon: const Icon(Icons.language, size: 30),
                  ),
                ),
                Image.asset(
                  'images/register.png',
                  width: size.width * 0.5,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 24),
                AppText(
                  alignment: isArabic
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  title: strings.createAccount,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
                const SizedBox(height: 5),
                AppText(
                  alignment: isArabic
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  title: strings.registrationDescription,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      K7TextField(
                        controller: userNameController,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        hintText: strings.userName,
                        cursorColor: Colors.black,
                        prefixIcon: const Icon(Icons.person),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return strings.usernameRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      K7TextField(
                        controller: contactController,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        hintText: strings.emailOrPhone,
                        cursorColor: Colors.black,
                        prefixIcon: const Icon(Icons.contact_mail),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return strings.contactRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      K7TextField(
                        controller: passwordController,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        hintText: strings.password,
                        cursorColor: Colors.black,
                        prefixIcon: const Icon(Icons.lock),
                        obscureText: vPassword,
                        suffixIcon: viewPassword(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return strings.passwordRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      AppButton(
                        title: strings.createAccount,
                        colorContainer: Colors.black,
                        onTap: () {
                          formKey.currentState!.validate();
                        },
                      ),
                      const SizedBox(height: 10),
                      AppButton(
                        title: strings.login,
                        colorContainer: Colors.grey,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
