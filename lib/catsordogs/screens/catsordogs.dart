import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_sample/catsordogs/view_model/catsordogs.dart';
import 'package:mvvm_sample/result/screens/result.dart';
import 'package:mvvm_sample/shared/model/animal/animal.dart';
import 'package:mvvm_sample/shared/model/animal/selected_animal_model.dart';
import 'package:provider/provider.dart';

class CatsOrDogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ProxyProvider<SelectedAnimalModel, CatsOrDogsViewModel>(
        create: (context) => CatsOrDogsViewModel(
            selectedAnimalModel: context.read<SelectedAnimalModel>()),
        update: (context, selectedAnimalModel, notifier) =>
            CatsOrDogsViewModel(selectedAnimalModel: selectedAnimalModel),
      ),
    ], child: CatsOrDogsWidget());
  }
}

class CatsOrDogsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catsOrDogsViewModel = context.select(
      (CatsOrDogsViewModel model) => model,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Primeira Pergunta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Gatos'),
              leading: Radio<Animal>(
                value: Animal("Gato"),
                groupValue: catsOrDogsViewModel.selectedAnimal,
                onChanged: (Animal? value) {
                  catsOrDogsViewModel.selectedAnimal = value;
                },
              ),
            ),
            ListTile(
              title: const Text('Cachorros'),
              leading: Radio<Animal>(
                value: Animal("Cachorro"),
                groupValue: catsOrDogsViewModel.selectedAnimal,
                onChanged: (Animal? value) {
                  catsOrDogsViewModel.selectedAnimal = value;
                },
              ),
            ),
            OutlinedButton(
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Resultado'),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
