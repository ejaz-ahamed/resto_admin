import 'package:flutter/material.dart';
import 'package:resto_admin/core/constants/login_page_constants.dart';
import 'package:resto_admin/core/constants/textfield_widget_constants.dart';
import 'package:resto_admin/core/widgets/textfield_widget.dart';
import 'package:resto_admin/features/authentication/presentation/widgets/forget_pasword_btn_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 132, top: 200),
            child: Text(
              LoginPageConstants.heading,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: TextfieldWidget(
                hintText: TextfieldConstants.userName,
                suffixIcon: Icon(Icons.person, color: Colors.grey)),
          ),
          TextfieldWidget(
              hintText: TextfieldConstants.password,
              suffixIcon: Icon(
                Icons.fingerprint,
                color: Colors.grey,
              )),
          ForgetPasswordButtonWidget(),
        ],
      ),
    );
  }
}
