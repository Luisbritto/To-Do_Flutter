import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/app/core/widget/todo_list_field.dart';
import 'package:to_do_list/app/core/widget/todo_list_logo.dart';
import 'package:to_do_list/app/modules/auth/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<LoginController>(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth),
              child: IntrinsicHeight(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TodoListLogo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: Form(
                        child: Column(
                      children: [
                        TodoListField(
                          label: 'E-mail',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TodoListField(
                          label: 'Senha',
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('Esqueceu sua senha?'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Login'),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                            )
                          ],
                        )
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF0F3F7),
                        border: Border(
                            top: BorderSide(
                                width: 2, color: Colors.grey.withAlpha(50))),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          SignInButton(Buttons.Google,
                              text: 'Continue com o Google',
                              padding: EdgeInsets.all(5),
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              onPressed: () {}),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('N??o tem conta?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/register');
                                  }, child: Text('Cadastre-se'))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
