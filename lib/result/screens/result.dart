import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_sample/main.dart';
import 'package:mvvm_sample/result/view_model/result.dart';
import 'package:mvvm_sample/shared/model/animal/selected_animal_model.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ProxyProvider<SelectedAnimalModel, ResultViewModel>(
        create: (context) => ResultViewModel(
            selectedAnimalModel: context.read<SelectedAnimalModel>()),
        update: (context, selectedAnimalModel, notifier) =>
            ResultViewModel(selectedAnimalModel: selectedAnimalModel),
      ),
    ], child: ResultWidget());
  }
}


class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final resultViewModel = context.select(
          (ResultViewModel model) => model,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("O animal selecionado foi: ${resultViewModel.selectedAnimal?.name}"),
      ),
    );
  }
}
