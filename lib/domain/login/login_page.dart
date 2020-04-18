import 'package:b3_news_app/components/custom_text_field.dart';
import 'package:b3_news_app/shared/stores/main_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatelessWidget {
  LoginPage() {
    userController.addListener(() {
      mainStore.loginStore.setUsername(userController.text);
    });

    passwordController.addListener(() {
      mainStore.loginStore.setPassword(passwordController.text);
    });
  }

  static const String name = '/login';
  final mainStore = GetIt.I.get<MainStore>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.png'),
              const SizedBox(
                height: 45,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: CustomTextField(
                  title: "Login",
                  textInputAction: TextInputAction.next,
                  focusNode: usernameFocus,
                  keyboardType: TextInputType.text,
                  controller: userController,
                  onEditingComplete: passwordFocus.requestFocus,
                  errorText: mainStore.loginStore.validateUsername,
                ),
              ),
              Observer(
                builder: (_) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    child: CustomTextField(
                      title: "Senha",
                      textInputAction: TextInputAction.done,
                      focusNode: passwordFocus,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: mainStore.loginStore.obscurePassword,
                      changeObscureText:
                          mainStore.loginStore.changeObscurePassword,
                      onEditingComplete: passwordFocus.unfocus,
                      errorText: mainStore.loginStore.validatePassword,
                    ),
                  );
                },
              ),
              // CustomTextField(
              //   labelText: 'Name',
              //   onChange: mainStore.loginStore.setUsername,
              //   errorText: mainStore.loginStore.validateUsername,
              // ),
              // const SizedBox(height: 20),
              // CustomTextField(
              //   labelText: 'Password',
              //   onChange: mainStore.loginStore.setPassword,
              //   errorText: mainStore.loginStore.validatePassword,
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return InkWell(
            onTap: mainStore.loginStore.isValid
                ? () => mainStore.authStore.isAuthenticated = true
                : null,
            child: Container(
              margin: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: mainStore.loginStore.isValid ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
