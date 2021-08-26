

import 'package:flutter/material.dart';
import 'package:to_do_list/app/core/ui/my_flutter_app_icons.dart';

class TodoListField extends StatelessWidget {
  final bool obscureText;
  final String label;
  final IconButton? suffixIconButton;
  final ValueNotifier<bool> obscureTextVN;

  TodoListField(
      {Key? key,
      required this.label,
      this.obscureText = false,
      this.suffixIconButton})
      : assert(obscureText == true ? suffixIconButton == null : true,
            'Obscure Text Não pode ser enviado em conjunto com suffixIconButton'),
            obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureTextVN,
        builder: (_, obscureTextValue, child) {
            return TextFormField(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(fontSize: 15, color: Colors.black), 
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red),
            ),
            isDense: true,
            
            suffixIcon: this.suffixIconButton ??
                (obscureText == true
                    ? IconButton(
                        onPressed: () {
                          obscureTextVN.value= !obscureTextVN.value;
                        },
                        icon: Icon(
                          !obscureTextValue ? MyFlutterApp.eye_slash : MyFlutterApp.eye,
                          size: 15,
                        ),
                      )
                    : null),
          ),
          obscureText: obscureTextValue,
           
        );
        },
    );
  }
}
