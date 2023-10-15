import 'dart:math';
import 'package:flutter/cupertino.dart';

class Calculatethebmi {
  Calculatethebmi({
    required this.inputheight,
    required this.inputweight,
    required this.inputgender,
    required this.inputage,
  });
  final int inputheight;
  final double inputweight;
  final int inputgender;
  final int inputage;
  double convertheight=0.0, result=0.0;
  int gen=0, inage=0;
  
  String calculate_result() {
    if (inputgender == 0) {
      result = 0;
      return result.toStringAsFixed(2);
    } else {
      inage = inputage;
      gen = inputgender;
      print("inputheight: $inputheight");
      print("inputweight: $inputweight");

      convertheight = inputheight / 100;
     
      result = inputweight / pow(convertheight, 2);
       print("result m: $result");
      return result.toStringAsFixed(2);
    }
  }

  String checkmass() {
    if (inage >= 10 && inage <= 29) {
      if (gen == 0) {
        return 'Please Select Gender';
      } else if (result <= 15.9 && gen != 11) {
        return 'Under WEIGHT';
      } else if (result > 16 && result <= 25 && gen != 11) {
        return 'Normal';
      } else if (result >= 25.1 && gen != 11) {
        return 'Over Weight';
      } else if (result < 14 && gen != 01) {
        return 'Under WEIGHT';
      } else if (result >= 14 && result <= 22.7 && gen != 01) {
        return 'Normal';
      } else if (result >= 22.8 && gen != 01) {
        return 'Over Weight';
      } else {
        return 'Wrong Input';
      }
    }
    if (inage >= 30 && inage <= 39) {
      if (gen == 0) {
        return 'Please Select Gender';
      } else if (result <= 17.9 && gen != 11) {
        return 'Under WEIGHT';
      } else if (result >= 18 && result <= 26 && gen != 11) {
        return 'Normal';
      } else if (result >= 26.1 && gen != 11) {
        return 'Over Weight';
      } else if (result < 15.9 && gen != 01) {
        return 'Under WEIGHT';
      } else if (result >= 16 && result <= 24 && gen != 01) {
        return 'Normal';
      } else if (result >= 24.1 && gen != 01) {
        return 'Over Weight';
      } else {
        return 'Wrong Input';
      }
    }
    if (inage >= 40 && inage <= 49) {
      if (gen == 0) {
        return 'Please Select Gender';
      } else if (result <= 18.9 && gen != 11) {
        return 'Under WEIGHT';
      } else if (result >= 19 && result <= 27 && gen != 11) {
        return 'Normal';
      } else if (result >= 27.1 && gen != 11) {
        return 'Over Weight';
      } else if (result < 17 && gen != 01) {
        return 'Under WEIGHT';
      } else if (result >= 17 && result <= 25 && gen != 01) {
        return 'Normal';
      } else if (result >= 25.1 && gen != 01) {
        return 'Over Weight';
      } else {
        return 'Wrong Input';
      }
    }
    if (inage >= 50 && inage <= 59) {
      if (gen == 0) {
        return 'Please Select Gender';
      } else if (result <= 19.9 && gen != 11) {
        return 'Under WEIGHT';
      } else if (result >= 20 && result <= 28 && gen != 11) {
        return 'Normal';
      } else if (result >= 28.1 && gen != 11) {
        return 'Over Weight';
      } else if (result < 18 && gen != 01) {
        return 'Under WEIGHT';
      } else if (result >= 18 && result <= 26 && gen != 01) {
        return 'Normal';
      } else if (result >= 26.1 && gen != 01) {
        return 'Over Weight';
      } else {
        return 'Wrong Input';
      }
    }
    if (inage >= 60) {
      if (gen == 0) {
        return 'Please Select Gender';
      } else if (result < 18 && gen != 11) {
        return 'Under WEIGHT';
      } else if (result > 18 && result <= 30 && gen != 11) {
        return 'Normal';
      } else if (result >= 30.1 && gen != 11) {
        return 'Over Weight';
      } else if (result < 17 && gen != 01) {
        return 'Under WEIGHT';
      } else if (result >= 17 && result <= 29 && gen != 01) {
        return 'Normal';
      } else if (result >= 29.1 && gen != 01) {
        return 'Over Weight';
      } else {
        return 'Wrong Input';
      }
    }
    else{
      return "";
    }
  }

  String suggestions() {
    if (inage >= 10 && inage <= 29) {
      if (gen == 0) {
        return 'No Suggestion!';
      } else if (result <= 15.9 && gen != 11) {
        return 'You needed to Focus on your health! \nNormal: 16% - 25%';
      } else if (result >= 16 && result <= 25 && gen != 11) {
        return 'You are healthy! \nNormal: 16% - 25%';
      } else if (result >= 25.1 && gen != 11) {
        return 'You needed to lose some fats! \nNormal: 16% - 25%';
      } else if (result < 14 && gen != 01) {
        return 'You needed to Focus on your health! \nNormal: 14% - 22.7%';
      } else if (result >= 14 && result <= 22.7 && gen != 01) {
        return 'You are healthy! \nNormal: 14% - 22.7%';
      } else if (result >= 22.8 && gen != 01) {
        return 'You needed to lose some fats! \nNormal: 14% - 22.7%';
      } else {
        return 'Wrong Input';
      }
    }
    if (inage >= 30 && inage <= 39) {
      if (gen == 0) {
        return 'No Suggestion!';
      } else if (result <= 17.9 && gen != 11) {
        return 'You needed to Focus on your health! \nNormal: 18% - 26%';
      } else if (result >= 18 && result <= 26 && gen != 11) {
        return 'You are healthy! \nNormal: 18% - 26%';
      } else if (result >= 26.1 && gen != 11) {
        return 'You needed to lose some fats! \nNormal: 18% - 26%';
      } else if (result < 16 && gen != 01) {
        return 'You needed to Focus on your health! \nNormal: 16% - 24%';
      } else if (result >= 16 && result <= 24 && gen != 01) {
        return 'You are healthy! \nNormal: 16% - 24%';
      } else if (result >= 24.1 && gen != 01) {
        return 'You needed to lose some fats! \nNormal: 16% - 24%';
      } else {
        return 'Wrong Input';
      }
    }
    if (inage >= 40 && inage <= 49) {
      if (gen == 0) {
        return 'No Suggestion!';
      } else if (result <= 18.9 && gen != 11) {
        return 'You needed to Focus on your health! \nNormal: 19% - 27%';
      } else if (result >= 19 && result <= 27 && gen != 11) {
        return 'You are healthy! \nNormal: 19% - 27%';
      } else if (result >= 27.1 && gen != 11) {
        return 'You needed to lose some fats! \nNormal: 19% - 27%';
      } else if (result < 17 && gen != 01) {
        return 'You needed to Focus on your health! \nNormal: 14% - 25%';
      } else if (result >= 17 && result <= 25 && gen != 01) {
        return 'You are healthy! \nNormal: 14% - 25%';
      } else if (result >= 25.1 && gen != 01) {
        return 'You needed to lose some fats! \nNormal: 14% - 25%';
      } else {
        return 'Wrong Input';
      }
    }
    if (inage >= 50 && inage <= 59) {
      if (gen == 0) {
        return 'No Suggestion!';
      } else if (result <= 19.9 && gen != 11) {
        return 'You needed to Focus on your health! \nNormal: 20% - 28%';
      } else if (result >= 20 && result <= 28 && gen != 11) {
        return 'You are healthy! \nNormal: 20% - 28%';
      } else if (result >= 28.1 && gen != 11) {
        return 'You needed to lose some fats! \nNormal: 20% - 28%';
      } else if (result < 18 && gen != 01) {
        return 'You needed to Focus on your health! \nNormal: 18% - 26%';
      } else if (result >= 18 && result <= 26 && gen != 01) {
        return 'You are healthy! \nNormal: 18% - 26%';
      } else if (result >= 26.1 && gen != 01) {
        return 'You needed to lose some fats! \nNormal: 18% - 26%';
      } else {
        return 'Wrong Input';
      }
    }
    if (inage >= 60) {
      if (gen == 0) {
        return 'No Suggestion!';
      } else if (result <= 17.9 && gen != 11) {
        return 'You needed to Focus on your health! \nNormal: 8% - 25.2%';
      } else if (result >= 18 && result <= 30 && gen != 11) {
        return 'You are healthy! \nNormal: 8% - 25.2%';
      } else if (result >= 30.1 && gen != 11) {
        return 'You needed to lose some fats! \nNormal: 8% - 25.2%';
      } else if (result < 16.9 && gen != 01) {
        return 'You needed to Focus on your health! \nNormal: 14% - 31.3%';
      } else if (result >= 17 && result <= 29 && gen != 01) {
        return 'You are healthy! \nNormal: 14% - 31.3%';
      } else if (result >= 29.1 && gen != 01) {
        return 'You needed to lose some fats! \nNormal: 14% - 31.3%';
      } else {
        return 'Wrong Input';
      }
    }
    return "";
  }
}
