// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';
import 'package:chatgpt_prompts/features/main/main_presenter.dart';

class MainPage extends StatefulWidget with HasPresenter<MainPresenter> {

  const MainPage({
    required this.presenter,
    super.key,
  });

  @override
  final MainPresenter presenter;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with PresenterStateMixin<MainViewModel, MainPresenter, MainPage> {

  @override
  Widget build(BuildContext context) => const Scaffold(
      body: Center(
        child: Text('MainPage\n(NOT IMPLEMENTED YET)'),
      ),
    );

}
