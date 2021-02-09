import 'package:minibieb/core/utils/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import '../theming/custom_colors.dart';
import '../theming/paddings.dart';

enum DialogType { basic, extended, form }

void setupDialog() {
  final dialogService = locator<DialogService>();
  final builders = {
    DialogType.basic: (context, sheetRequest, completer) =>
        _BasicDialog(request: sheetRequest, completer: completer),
  };
  dialogService.registerCustomDialogBuilders(builders);
}

class _BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialog({Key key, this.request, this.completer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: CustomColors.blue,
      child: Container(
        padding: const EdgeInsets.all(Paddings.screenPadding),
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              request.title,
              style: TextStyle(color: CustomColors.amber, fontSize: 24),
            ),
            Divider(),
            Text(
              request.description,
              style: TextStyle(
                color: CustomColors.amber,
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              child: Text(
                request.mainButtonTitle ?? 'OK',
              ),
              onPressed: Navigator.of(context).pop,
            )
          ],
        ),
      ),
    );
  }
}
