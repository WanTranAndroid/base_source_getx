import 'package:base_source_getx/app/config/theme.dart';
import 'package:base_source_getx/presentation/controllers/auth/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      builder: (_) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('profile'.tr),
          ),
          child: controller.isLoggedIn.value
              ? SignInView()
              : SignUpView(
                  onRegister: (username) {
                    controller.signUpWith(username);
                  },
                ),
        );
      },
    );
  }
}

class SignInView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            _buildItem(
              "Username:",
              Text(
                controller.user?.username ?? "",
                style: AppTextStyles.title,
              ),
            ),
            TextButton(onPressed: controller.logout, child: const Text("Logout")),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String title, Widget child) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.title,
        ),
        const SizedBox(
          width: 10,
        ),
        child
      ],
    );
  }
}

class SignUpView extends StatelessWidget {
  final _userNameController = TextEditingController();
  final Function(String) onRegister;

  SignUpView({required this.onRegister});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: 50,
              child: Text(
                "Register your username",
                style: AppTextStyles.title,
              ),
            ),
            const SizedBox(height: 50),
            _buildLoginForm(context),
            const SizedBox(height: 50),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return SizedBox(
      height: 50,
      child: CupertinoTextField(
        keyboardType: TextInputType.emailAddress,
        placeholder: "Enter username",
        controller: _userNameController,
      ),
    );
  }

  Widget _buildLoginButton() {
    return MaterialButton(
      onPressed: () {
        onRegister(_userNameController.text);
      },
      color: AppColors.primary,
      elevation: 0,
      minWidth: 350,
      height: 55,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Text(
        "Register",
        style: AppTextStyles.body,
      ),
    );
  }
}
