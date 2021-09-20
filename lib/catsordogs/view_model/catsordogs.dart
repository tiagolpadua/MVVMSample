import 'package:mvvm_sample/shared/model/animal/animal.dart';
import 'package:mvvm_sample/shared/model/animal/selected_animal_model.dart';

class CatsOrDogsViewModel {
  final SelectedAnimalModel _selectedAnimalModel;

  CatsOrDogsViewModel(
      {required SelectedAnimalModel selectedAnimalModel})
      : _selectedAnimalModel = selectedAnimalModel;

  Animal? get selectedAnimal {
    return _selectedAnimalModel.animal;
  }

  set selectedAnimal(Animal? animal) {
    _selectedAnimalModel.animal = animal;
  }

}
