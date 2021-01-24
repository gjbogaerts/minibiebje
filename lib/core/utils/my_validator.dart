class MyValidator {
  String checkStringLength({
    String value,
    int min,
    int max,
  }) {
    var isError = false;
    if (min != null && value.length < min) {
      isError = true;
    }
    if (max != null && value.length > max) {
      isError = true;
    }
    if (isError) {
      return 'Dit veld moet ten minste $min en ten hoogste $max tekens bevatten.';
    }
    return null;
  }

  String checkOptionalStringLength({String value, int min}) {
    if (value.isNotEmpty && value.length < min) {
      return 'Ten minste $min lettertekens.';
    }
    return null;
  }

  String checkSumIsbn(String isbn) {
    if (isbn.isEmpty) return null;
    // bestaat het uit cijfers?
    if (int.tryParse(isbn) == null) {
      return 'Gebruik alleen cijfers, geen andere lettertekens.';
    }
    // de juiste lengte?
    if (isbn.length != 10 && isbn.length != 13) {
      return 'ISBN nummers hebben 10 of 13 cijfers';
    }
    // Klopt de checksum bij lengte 10?
    if (isbn.length == 10) {
      int sum = 0;
      sum += int.parse(isbn[0]) * 1;
      sum += int.parse(isbn[1]) * 2;
      sum += int.parse(isbn[2]) * 3;
      sum += int.parse(isbn[3]) * 4;
      sum += int.parse(isbn[4]) * 5;
      sum += int.parse(isbn[5]) * 6;
      sum += int.parse(isbn[6]) * 7;
      sum += int.parse(isbn[7]) * 8;
      sum += int.parse(isbn[8]) * 9;
      sum += int.parse(isbn[9]) * 10;
      if (sum.remainder(11) != 0) {
        return 'Je hebt geen geldig ISBN nummer ingevoerd.';
      }
    }
    // Klopt de checksum bij lengte 13?
    if (isbn.length == 13) {
      int sum = 0;
      sum += int.parse(isbn[0]);
      sum += int.parse(isbn[1]) * 3;
      sum += int.parse(isbn[2]);
      sum += int.parse(isbn[3]) * 3;
      sum += int.parse(isbn[4]);
      sum += int.parse(isbn[5]) * 3;
      sum += int.parse(isbn[6]);
      sum += int.parse(isbn[7]) * 3;
      sum += int.parse(isbn[8]);
      sum += int.parse(isbn[9]) * 3;
      sum += int.parse(isbn[10]);
      sum += int.parse(isbn[11]) * 3;
      int checkDigit = int.parse(isbn[12]);
      int remainder = sum.remainder(10);
      if (10 - remainder != checkDigit) {
        return 'Je hebt geen geldig ISBN nummer ingevoerd';
      }
    }

    return null;
  }

  String isValidEmail(String email) {
    bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!isValid) {
      return 'Je moet een geldig email-adres invoeren.';
    }
    return null;
  }

  String isValidPassword(String value) {
    if (value.length < 8) {
      return 'Wachtwoord moet ten minste 8 tekens bevatten.';
    }
    if (value.indexOf(RegExp(r'[A-Z]')) < 0) {
      return 'Wachtwoord moet ten minste een hoofdletter bevatten.';
    }
    if (value.indexOf(RegExp(r'[a-z]')) < 0) {
      return 'Wachtwoord moet ten minste een kleine letter bevatten.';
    }
    if (value.indexOf(RegExp(r'[0-9]')) < 0) {
      return 'Wachtwoord moet ten minste een cijfer bevatten.';
    }
    return null;
  }
}
