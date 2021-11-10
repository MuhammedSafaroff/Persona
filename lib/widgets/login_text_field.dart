import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController? valueController;
  final String? name;
  final IconData? icons;
  final TextInputType? keyType;
  final String? Function(String?)? validator;

  const LoginTextField({
    Key? key,
    this.valueController,
    this.name,
    this.icons,
    this.keyType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: valueController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icons,
        ),
        labelText: name,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      validator: validator,
      keyboardType: keyType,
    );
  }
}

class LoginTextFieldPass extends StatelessWidget {
  final TextEditingController? valueController;
  final String? name;
  final IconData? icons;
  final TextInputType? keyType;
  final Function? fun;
  final bool? isPass;
  const LoginTextFieldPass({
    Key? key,
    this.valueController,
    this.name,
    this.icons,
    this.keyType,
    this.fun,
    this.isPass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      obscureText: isPass!,
      controller: valueController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icons,
        ),
        suffixIcon: IconButton(
          icon: Icon(isPass!
              ? Icons.visibility_off_rounded
              : Icons.visibility_rounded),
          onPressed: () => fun!(),
        ),
        labelText: name,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty || value.trim() == "") {
          return 'Please enter some text';
        } else if (value.trim().length < 6) {
          return 'Password should be at least 6 characters';
        }
        return null;
      },
      keyboardType: keyType,
    );
  }
}
