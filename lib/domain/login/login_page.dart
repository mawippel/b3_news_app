import 'package:b3_news_app/components/custom_text_field.dart';
import 'package:b3_news_app/shared/stores/main_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

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
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/fulllogo.png'),
                const SizedBox(
                  height: 45,
                ),
                Observer(
                  builder: (_) {
                    return Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: CustomTextField(
                            title: "Login",
                            textInputAction: TextInputAction.next,
                            focusNode: usernameFocus,
                            keyboardType: TextInputType.text,
                            controller: userController,
                            value: mainStore.loginStore.username,
                            onEditingComplete: passwordFocus.requestFocus,
                            errorText: mainStore.loginStore.validateUsername,
                          ),
                        ),
                        Container(
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
                            value: mainStore.loginStore.password,
                            obscureText: mainStore.loginStore.obscurePassword,
                            changeObscureText:
                                mainStore.loginStore.changeObscurePassword,
                            onEditingComplete: passwordFocus.unfocus,
                            errorText: mainStore.loginStore.validatePassword,
                          ),
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Observer(
                  builder: (_) {
                    return InkWell(
                      onTap: mainStore.loginStore.isValid
                          ? () => mainStore.authStore.isAuthenticated = true
                          : null,
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: mainStore.loginStore.isValid
                              ? Theme.of(context).accentColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: FlatButton(
          onPressed: null,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                  text: 'Não possui login? ',
                  style: TextStyle(fontSize: 18),
                ),
                TextSpan(
                  text: ' Crie sua conta!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
