import 'package:vyzen/model/input_type.dart';

class FormInput {
  String name;
  String labelText;
  String description;
  InputType inputType;
  bool mandatory;
  dynamic value;
  List<String>? options;
  FormInput(
      {required this.name,
      required this.labelText,
      required this.description,
      required this.inputType,
      this.mandatory = false,
      this.options});

  @override
  String toString() {
    return 'FormInput{name: $name, labelText: $labelText, description: $description, inputType: $inputType, mandatory: $mandatory, value: $value, options: $options}';
  }
}
