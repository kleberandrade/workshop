import 'package:flutter/material.dart';

class FormList extends StatelessWidget {
  final List<Widget> children;
  final GlobalKey<FormState> formKey;

  const FormList({
    super.key,
    required this.formKey,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(children: children),
      ),
    );
  }
}
