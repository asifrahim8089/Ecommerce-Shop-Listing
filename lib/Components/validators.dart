import 'package:form_field_validator/form_field_validator.dart';

final nameValidator = RequiredValidator(errorText: '*required');

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: '*required'),
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
  ],
);

final incorrectValidator = RequiredValidator(errorText: '*Incorrect entry');
