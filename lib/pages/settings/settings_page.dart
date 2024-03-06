import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulerning_app/constants/constant.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_bloc.dart';
import 'package:ulerning_app/pages/application/application_bloc/application_events.dart';
import 'package:ulerning_app/pages/settings/settings_bloc/setting_states.dart';
import 'package:ulerning_app/pages/settings/settings_bloc/settings_bloc.dart';
import 'package:ulerning_app/routes/names.dart';

import '../../shared_preferences/global.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body:
          BlocBuilder<SettingsBloc, SettingsStates>(builder: (context, states) {
        return Center(
          child: ElevatedButton(
            child: Text("Log Out"),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Logout"),
                      content: Text("Confirm Logout"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              context.read<AppBloc>().add(TriggerEvent(0));
                              Global.storageServices.remove(
                                  AppConstants.STORAGE_USER_PROFILE_KEY);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  RouteNames.WELCOME_PAGE, (route) => false);
                            },
                            child: const Text("Confirm")),
                      ],
                    );
                  });
            },
          ),
        );
      }),
    );
  }
}
