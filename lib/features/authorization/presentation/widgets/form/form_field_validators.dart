import 'package:intl/intl.dart';

class Validator {
  static String? validateName(String value) {
    String pattern = r'^[a-zA-Zа-яА-ЯіїєґІЇЄҐ]+$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Будь ласка, введіть своє Ім\'я';
    } else if (!regExp.hasMatch(value)) {
      return 'Будь ласка, введіть коректне Ім\'я';
    }
    return null;
  }

  static String? validateSurname(String value) {
    String pattern = r'^[a-zA-Zа-яА-ЯіїєґІЇЄҐ]+$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Будь ласка, введіть своє Прізвище';
    } else if (!regExp.hasMatch(value)) {
      return 'Будь ласка, введіть коректне Прізвище';
    }
    return null;
  }

  static String? validatePatronimyc(String value) {
    String pattern = r'^[a-zA-Zа-яА-ЯіїєґІЇЄҐ]+$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Будь ласка, введіть своє По батькові';
    } else if (!regExp.hasMatch(value)) {
      return 'Будь ласка, введіть коректне По батькові';
    }
    return null;
  }

  static String? validatePhone(String value) {
    String pattern = r'^\+380\d{9}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Будь ласка, введіть номер телефону';
    } else if (!regExp.hasMatch(value)) {
      return 'Будь ласка, введіть коректний номер телефону (у форматі +380XXXXXXXXX)';
    }
    return null;
  }

  static String? validateEmail(String value) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Будь ласка, введіть свій email';
    } else if (!regExp.hasMatch(value)) {
      return 'Будь ласка, введіть коректний email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Будь ласка, введіть пароль';
    } else if (value.length < 6) {
      return 'Пароль повинен містити щонайменше 6 символів';
    }
    return null;
  }

  static String? validateCity(String value) {
    String pattern = r'^[a-zA-Zа-яА-ЯіїєґІЇЄҐ]+$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Будь ласка, введіть свій Населений пункт';
    } else if (!regExp.hasMatch(value)) {
      return 'Будь ласка, введіть коректний Населений пункт';
    }
    return null;
  }

  static String? validateDateOfBirth(String value) {
    final datePattern = r'^\d{2}\.\d{2}\.\d{4}$';
    if (!RegExp(datePattern).hasMatch(value)) {
      return 'Будь ласка, введіть дату у форматі ДД.ММ.РРРР';
    }

    final inputDate = DateFormat('dd.MM.yyyy').parseStrict(value);
    final currentDate = DateTime.now();
    final ageLimit = 100;
    final minimumAge = 16;
    final difference = currentDate.difference(inputDate).inDays;
    final daysInYear = 365.25;

    final age = (difference / daysInYear).floor();

    if (age > ageLimit || age < minimumAge) {
      return 'Вік має бути між $minimumAge та $ageLimit роками';
    }

    return null;
  }
}
