import 'package:flutter/material.dart';
import 'package:minibieb/core/utils/my_logger.dart';
import 'package:minibieb/ui/screens/library_screen.dart';
import 'package:minibieb/ui/widgets/dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/utils/service_locator.dart';
import '../../core/viewmodels/auth_screen_model.dart';
import '../theming/custom_colors.dart';
import '../theming/paddings.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';
  final DialogService _service = locator<DialogService>();
  // ignore: unused_field
  final _log = getLogger('AuthScreen');

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthScreenModel>.reactive(
      viewModelBuilder: () => AuthScreenModel(),
      builder: (context, model, child) {
        if (model.authResult != null) if (model.authResult) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await _service.showCustomDialog(
                variant: DialogType.basic,
                title: 'Gelukt',
                description: 'Je bent nu ingelogd.');
            Navigator.of(context).pushReplacementNamed(LibraryScreen.routeName);
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await _service.showCustomDialog(
                variant: DialogType.basic,
                title: 'Helaas',
                description:
                    'Er is iets mis gegaan bij het inloggen. Probeer het alstublieft opnieuw.');
            // Navigator.of(context).pushReplacementNamed(LibraryScreen.routeName);
          });
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(model.isRegistering ? 'Registratie' : 'Login'),
          ),
          body: model.working
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(Paddings.screenPadding),
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: Padding(
                            padding:
                                const EdgeInsets.all(Paddings.containerPadding),
                            child: Form(
                              key: model.formKey,
                              child: Column(
                                children: [
                                  if (model.errorString.isNotEmpty)
                                    Text(
                                      model.errorString,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                            color: CustomColors.red,
                                          ),
                                    ),
                                  TextFormField(
                                    validator: (value) {
                                      return model.validator.checkStringLength(
                                          value: value, min: 5, max: 25);
                                    },
                                    onSaved: (newValue) {
                                      model.formValues['username'] = newValue;
                                    },
                                    decoration: InputDecoration(
                                        labelText: model.isRegistering
                                            ? 'Kies een gebruikersnaam'
                                            : 'Gebruikersnaam'),
                                  ),
                                  SizedBox(
                                    height: Paddings.dividerHeight,
                                  ),
                                  if (model.isRegistering)
                                    TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Email adres'),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        return model.validator
                                            .isValidEmail(value);
                                      },
                                      onSaved: (newValue) {
                                        model.formValues['email'] = newValue;
                                      },
                                    ),
                                  if (model.isRegistering)
                                    SizedBox(
                                      height: Paddings.dividerHeight,
                                    ),
                                  TextFormField(
                                    controller: model.pwController,
                                    decoration: InputDecoration(
                                      labelText: 'Wachtwoord',
                                      suffixIcon: IconButton(
                                          icon: Icon(Icons.visibility),
                                          onPressed: () {
                                            model.hidePassword =
                                                !model.hidePassword;
                                          }),
                                    ),
                                    obscureText: model.hidePassword,
                                    validator: (value) =>
                                        model.validator.isValidPassword(value),
                                    onSaved: (newValue) {
                                      model.formValues['password'] = newValue;
                                    },
                                  ),
                                  model.isRegistering
                                      ? SizedBox(
                                          height: Paddings.dividerHeight,
                                        )
                                      : SizedBox.shrink(),
                                  model.isRegistering
                                      ? TextFormField(
                                          obscureText: model.hidePassword,
                                          decoration: InputDecoration(
                                              labelText:
                                                  'Herhaal je wachtwoord',
                                              suffixIcon: IconButton(
                                                  icon: Icon(Icons.visibility),
                                                  onPressed: () {
                                                    model.hidePassword =
                                                        !model.hidePassword;
                                                  })),
                                          validator: (value) {
                                            if (value !=
                                                model.pwController.text) {
                                              return 'De wachtwoorden zijn niet hetzelfde.';
                                            }
                                            return null;
                                          },
                                        )
                                      : SizedBox.shrink(),
                                  SizedBox(
                                    height: Paddings.dividerHeight,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      TextButton(
                                        onPressed: () => model.isRegistering =
                                            !model.isRegistering,
                                        child: Text(model.isRegistering
                                            ? 'Ik kan inloggen'
                                            : 'Ik moet me registreren'),
                                      ),
                                      ElevatedButton(
                                        onPressed: model.startAuth,
                                        child: Text(model.isRegistering
                                            ? 'Registeren'
                                            : 'Inloggen'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
