// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/settings/settings_presentation_model.dart';
import 'package:chatgpt_prompts/features/settings/settings_presenter.dart';

class SettingsPage extends StatefulWidget with HasPresenter<SettingsPresenter> {
  const SettingsPage({
    required this.presenter,
    super.key,
  });

  @override
  final SettingsPresenter presenter;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with PresenterStateMixin<SettingsViewModel, SettingsPresenter, SettingsPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('SettingsPage\n(NOT IMPLEMENTED YET)'),
        ),
      );
}
