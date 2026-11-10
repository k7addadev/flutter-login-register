import 'package:flutter/material.dart';
import 'package:login_register_page/core/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k7addadev_ui/k7addadev_ui.dart';
import 'package:login_register_page/core/provider/local_provider.dart';
import 'package:login_register_page/core/widgets/app_text.dart';
import 'package:login_register_page/generated/l10n.dart';
import 'package:login_register_page/core/widgets/app_button.dart';
import 'package:login_register_page/core/widgets/language_sheet.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool vPassword = true;
  Widget viewPassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          vPassword = !vPassword;
        });
      },
      icon: vPassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
    );
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = ref.watch(isArabicProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Align(
                  alignment: AlignmentGeometry.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      LanguageSheet.show(context);
                    },
                    icon: Icon(Icons.language, size: 30),
                  ),
                ),
                Image.asset(
                  "images/login.png",
                  width: size.width * 0.5,
                  alignment: AlignmentGeometry.center,
                ),
                const SizedBox(height: 24),
                AppText(
                  alignment: isArabic
                      ? AlignmentGeometry.bottomRight
                      : AlignmentGeometry.bottomLeft,
                  title: S.of(context).welcomeBack,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
                const SizedBox(height: 5),
                AppText(
                  alignment: isArabic
                      ? AlignmentGeometry.bottomRight
                      : AlignmentGeometry.bottomLeft,
                  title: S.of(context).yourDetailsLogin,
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
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        hintText: S.of(context).userName,
                        cursorColor: Colors.black,
                        prefixIcon: Icon(Icons.person),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).usernameRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      K7TextField(
                        controller: passwordController,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        hintText: S.of(context).password,
                        cursorColor: Colors.black,
                        prefixIcon: Icon(Icons.lock),
                        obscureText: vPassword,
                        suffixIcon: viewPassword(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).passwordRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        child: AppText(
                          alignment: isArabic
                              ? AlignmentGeometry.bottomRight
                              : AlignmentGeometry.bottomLeft,
                          title: S.of(context).forgotPassword,
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 30),
                      AppButton(
                        title: S.of(context).login,
                        colorContainer: Colors.black,
                        onTap: () {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                      const SizedBox(height: 10),
                      AppButton(
                        title: S.of(context).createAccount,
                        colorContainer: Colors.grey,
                        onTap: () =>
                            Navigator.of(context).pushNamed(AppRoutes.register),
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
