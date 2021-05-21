import 'package:flutter/material.dart';

class MessageOptions extends StatelessWidget {
  final List<String> options;

  MessageOptions(this.options);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Theme.of(context).cardColor,
      children: options.map((e) => buildTextButton(context, e)).toList(),
    );
  }

  Widget buildTextButton(context, String action) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(action);
      },
      child: Text(
        action,
        style: TextStyle(
          color: Theme.of(context).primaryColor.withAlpha(200),
        ),
      ),
    );
  }
}
