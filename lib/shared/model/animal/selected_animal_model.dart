import 'package:flutter/cupertino.dart';
import 'package:mvvm_sample/shared/model/animal/animal.dart';

class SelectedAnimalModel extends ChangeNotifier {
  Animal? _animal;

  Animal? get animal {
    return _animal;
  }

  set animal(Animal? animal) {
    _animal = animal;
    notifyListeners();
  }
}
