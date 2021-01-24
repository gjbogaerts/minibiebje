import 'package:flutter/material.dart';
import '../theming/paddings.dart';

class MyDialog extends StatelessWidget {
  final String title;
  final String body;
  final String cancel;
  final String ok;

  MyDialog({this.title, this.body, this.cancel, this.ok});

  _buildDialog(BuildContext ctx) async {
    showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          cancel != null
              ? TextButton(
                  onPressed: () => _pop(context),
                  child: Text(cancel),
                )
              : null,
          TextButton(
            onPressed: () => _pop(context),
            child: Text(ok),
          ),
        ],
      ),
    );
  }

  void _pop(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Paddings.containerPadding),
      child: _buildDialog(context),
    );
  }
}
