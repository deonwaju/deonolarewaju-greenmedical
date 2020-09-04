


import 'package:deon_greenmed/pages/auth/login/login.dart';
import 'package:deon_greenmed/pages/auth/signup/signup.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('title', () {
    //setup

    //run

    //verify
  });

  test('Whenever phone no. field is empty', () {
    var result = PhoneFieldValidator.validate('');
    expect(result, 'Please enter your phone number');

  });

  test('Whenever phone no. field is not empty', () {
    var result = PhoneFieldValidator.validate('phoneNo');
    expect(result, null);

  });

  test('Whenever password field is empty', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Please enter your password');

  });

  test('Whenever password field is not empty', () {
    var result = PasswordFieldValidator.validate('password');
    expect(result, null);

  });

  test('Whenever name field is empty', () {
    var result = NameFieldValidator.validate('');
    expect(result, 'Please enter your full name');

  });

  test('Whenever name field is not empty', () {
    var result = NameFieldValidator.validate('password');
    expect(result, null);

  });

  test('Whenever phone field is empty', () {
    var result = SPhoneFieldValidator.validate('');
    expect(result, 'Please enter your phone number');

  });

  test('Whenever phone field is not empty', () {
    var result = SPhoneFieldValidator.validate('phone no.');
    expect(result, null);

  });

  test('When password field is empty', () {
    var result = SPasswordFieldValidator.validate('');
    expect(result, 'Please enter your password');

  });

  test('When password field is not empty', () {
    var result = SPasswordFieldValidator.validate('password');
    expect(result, null);

  });



}