import 'package:flutter/material.dart';
import 'package:mvvm_sample/catsordogs/screens/catsordogs.dart';
import 'package:mvvm_sample/shared/model/animal/selected_animal_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MVVMSample());
}

class MVVMSample extends StatelessWidget {
  const MVVMSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectedAnimalModel>(
            create: (_) => SelectedAnimalModel()),
        // Outros providers podem ser incluídos aqui
      ],
      child: MaterialApp(
        title: 'MVVM Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home()
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Responder questionário'),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CatsOrDogsScreen();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
