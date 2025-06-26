import 'dart:math';

import 'package:flutter/material.dart';

class HealthDataNotifier extends ChangeNotifier {
  bool? hasDiabetes;
  bool? hasHypertension;
  bool? hasCholesterol;

  // final TextEditingController bloodPressureController = TextEditingController();
  // final TextEditingController glucoseLevelController = TextEditingController();
  // final TextEditingController cholesterolController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  // final TextEditingController birthdayController = TextEditingController();
  final TextEditingController heartRateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController astLevelController = TextEditingController();
  final TextEditingController altLevelController = TextEditingController();
  final TextEditingController plateletCountController = TextEditingController();
  String? uploadedExamFilePath;

  void setHasDiabetes(bool value) {
    hasDiabetes = value;
    calculateMashScore();
  }

  void setHasHypertension(bool value) {
    hasHypertension = value;
    calculateMashScore();
  }

  void setHasCholesterol(bool value) {
    hasCholesterol = value;
    calculateMashScore();
  }


  void setUploadedExamFile(String path) {
    uploadedExamFilePath = path;
    notifyListeners();
  }

  // Estados de gamificação e UI
  double _mashScore = 0;
  double _completionPercentage = 0;
  int _level = 1;
  bool _showGuidance = false;
  bool _showLowScoreMessage = false;
  String _lowScoreBenefit = '';

  // Estados dos "Tourinhos"
  Map<String, bool> _individualFieldTourinhos = {
    'bloodPressure': false,
    'glucose': false,
    'cholesterol': false,
    'height': false,
    'weight': false,
    'heartRate': false,
    'age': false,
    'ast': false,
    'alt': false,
    'platelets': false,
  };
  List<String> _bonusTourinhos = [];

  // Getters para acessar os valores de forma segura
  double get mashScore => _mashScore;

  double get completionPercentage => _completionPercentage;

  int get level => _level;

  bool get showGuidance => _showGuidance;

  bool get showLowScoreMessage => _showLowScoreMessage;

  String get lowScoreBenefit => _lowScoreBenefit;

  Map<String, bool> get individualFieldTourinhos => _individualFieldTourinhos;

  List<String> get bonusTourinhos => _bonusTourinhos;

  HealthDataNotifier() {
    // Adiciona listeners a todos os controllers para recalcular quando os valores mudam
    final controllers = [
      // bloodPressureController, glucoseLevelController, cholesterolController,
      heightController,
      weightController,
      heartRateController,
      ageController,
      // birthdayController,
      astLevelController,
      altLevelController,
      plateletCountController,
    ];
    for (var controller in controllers) {
      controller.addListener(calculateMashScore);
    }
  }

  @override
  void dispose() {
    // Remove os listeners e libera os controllers para evitar memory leaks
    final controllers = [
      // bloodPressureController,
      // glucoseLevelController,
      // cholesterolController,
      heightController,
      weightController,
      // birthdayController,
      heartRateController,
      ageController,
      astLevelController,
      altLevelController,
      plateletCountController,
    ];
    for (var controller in controllers) {
      controller.removeListener(calculateMashScore);
      controller.dispose();
    }
    super.dispose();
  }

  void toggleGuidance() {
    _showGuidance = !_showGuidance;
    notifyListeners();
  }

  // Lógica de cálculo principal, traduzida do JavaScript para o Dart
  void calculateMashScore() {
    double currentScore = 0;
    int currentFilledFields = 0;
    const int totalInputFields = 13;

    final newIndividualFieldTourinhos = Map<String, bool>.from(
      _individualFieldTourinhos,
    );

    if (hasDiabetes != null) {
      currentFilledFields++;
      if (!hasDiabetes!)
        currentScore += 10;
      else
        currentScore += 2;
    }
    if (hasHypertension != null) {
      currentFilledFields++;
      if (!hasHypertension!)
        currentScore += 10;
      else
        currentScore += 2;
    }

    if (hasCholesterol != null) {
      currentFilledFields++;
      if (!hasCholesterol!)
        currentScore += 10;
      else
        currentScore += 2;
    }
    // double? bp = double.tryParse(bloodPressureController.text);
    // if (bp != null) {
    //   currentFilledFields++;
    //   newIndividualFieldTourinhos['bloodPressure'] = true;
    //   if (bp >= 90 && bp <= 120) currentScore += 10;
    //   else if (bp > 120 && bp <= 140) currentScore += 5;
    //   else if (bp < 90 || bp > 140) currentScore += 2;
    // } else {
    //   newIndividualFieldTourinhos['bloodPressure'] = false;
    // }
    //
    // double? gl = double.tryParse(glucoseLevelController.text);
    // if (gl != null) {
    //   currentFilledFields++;
    //   newIndividualFieldTourinhos['glucose'] = true;
    //   if (gl >= 70 && gl <= 99) currentScore += 10;
    //   else if (gl > 99 && gl <= 125) currentScore += 5;
    //   else if (gl < 70 || gl > 125) currentScore += 2;
    // } else {
    //   newIndividualFieldTourinhos['glucose'] = false;
    // }
    //
    // double? ch = double.tryParse(cholesterolController.text);
    // if (ch != null) {
    //   currentFilledFields++;
    //   newIndividualFieldTourinhos['cholesterol'] = true;
    //   if (ch >= 125 && ch <= 200) currentScore += 10;
    //   else if (ch > 200 && ch <= 240) currentScore += 5;
    //   else if (ch < 125 || ch > 240) currentScore += 2;
    // } else {
    //   newIndividualFieldTourinhos['cholesterol'] = false;
    // }

    double? height = double.tryParse(heightController.text);
    if (height != null) {
      currentFilledFields++;
      newIndividualFieldTourinhos['height'] = true;
    } else {
      newIndividualFieldTourinhos['height'] = false;
    }

    double? weight = double.tryParse(weightController.text);
    if (weight != null) {
      currentFilledFields++;
      newIndividualFieldTourinhos['weight'] = true;
    } else {
      newIndividualFieldTourinhos['weight'] = false;
    }

    // String? birthday = birthdayController.text;
    // if (birthday.isNotEmpty) {
    //   currentFilledFields++;
    //   newIndividualFieldTourinhos['birthday'] = true;
    // } else {
    //   newIndividualFieldTourinhos['birthday'] = false;
    // }

    if (height != null && weight != null && height > 0) {
      final double bmi = weight / (height * height);
      if (bmi >= 18.5 && bmi <= 24.9)
        currentScore += 10;
      else if ((bmi >= 25 && bmi <= 29.9) || (bmi >= 17 && bmi < 18.5))
        currentScore += 5;
      else if (bmi < 17 || bmi >= 30)
        currentScore += 2;
    }

    double? hr = double.tryParse(heartRateController.text);
    if (hr != null) {
      currentFilledFields++;
      newIndividualFieldTourinhos['heartRate'] = true;
      if (hr >= 60 && hr <= 100)
        currentScore += 10;
      else if ((hr > 100 && hr <= 120) || (hr >= 40 && hr < 60))
        currentScore += 5;
      else if (hr < 40 || hr > 120)
        currentScore += 2;
    } else {
      newIndividualFieldTourinhos['heartRate'] = false;
    }

    double? age = double.tryParse(ageController.text);
    if (age != null) {
      currentFilledFields++;
      newIndividualFieldTourinhos['age'] = true;
    } else {
      newIndividualFieldTourinhos['age'] = false;
    }

    double? ast = double.tryParse(astLevelController.text);
    if (ast != null) {
      currentFilledFields++;
      newIndividualFieldTourinhos['ast'] = true;
    } else {
      newIndividualFieldTourinhos['ast'] = false;
    }

    double? alt = double.tryParse(altLevelController.text);
    if (alt != null) {
      currentFilledFields++;
      newIndividualFieldTourinhos['alt'] = true;
    } else {
      newIndividualFieldTourinhos['alt'] = false;
    }

    double? platelets = double.tryParse(plateletCountController.text);
    if (platelets != null) {
      currentFilledFields++;
      newIndividualFieldTourinhos['platelets'] = true;
    } else {
      newIndividualFieldTourinhos['platelets'] = false;
    }

    if (age != null &&
        ast != null &&
        alt != null &&
        platelets != null &&
        platelets > 0 &&
        alt > 0) {
      final double fib4 = (age * ast) / (platelets * sqrt(alt));
      if (fib4 < 1.45)
        currentScore += 50;
      else if (fib4 >= 1.45 && fib4 <= 3.25)
        currentScore += 25;
      else if (fib4 > 3.25)
        currentScore += 10;
    }

    _individualFieldTourinhos = newIndividualFieldTourinhos;

    final percentage = (currentFilledFields / totalInputFields) * 100;

    if (percentage == 100) {
      currentScore += 10; // Bônus por completar tudo
    }

    _mashScore = currentScore;
    _completionPercentage = percentage;

    if (percentage == 100)
      _level = 5;
    else if (percentage >= 75)
      _level = 4;
    else if (percentage >= 50)
      _level = 3;
    else if (percentage >= 25)
      _level = 2;
    else
      _level = 1;

    final newBonusTourinhos = <String>[];
    for (var threshold in [25, 50, 75, 100]) {
      if (percentage >= threshold) {
        newBonusTourinhos.add('bonus-tourinho-$threshold');
      }
    }
    _bonusTourinhos = newBonusTourinhos;

    if (currentScore <= 80 && currentFilledFields == totalInputFields) {
      _showLowScoreMessage = true;
      _lowScoreBenefit = Random().nextBool() ? 'medico' : 'acompanhamento';
    } else {
      _showLowScoreMessage = false;
      _lowScoreBenefit = '';
    }

    notifyListeners(); // Notifica os widgets que os dados mudaram
  }
}
