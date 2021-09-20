import 'package:mvvm_sample/shared/model/animal/animal.dart';
import 'package:mvvm_sample/shared/model/animal/selected_animal_model.dart';

class ResultViewModel {
  final SelectedAnimalModel _selectedAnimalModel;

  ResultViewModel(
      {required SelectedAnimalModel selectedAnimalModel})
      : _selectedAnimalModel = selectedAnimalModel;

  Animal? get selectedAnimal {
    return _selectedAnimalModel.animal;
  }
}
