import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff6318AF);
  static const Color secondary = Color(0xffF7E5B7);
  static const Color courgetteTextColor = Color(0xffD5B67D);
  static const Color buttonPrimaryColor = Color(0xff6017AA);
  static const Color buttonSecondaryColor = Color(0xffE0D4EC);
  static const Color skipButtonBgColor = Color(0xffE8E0EA);
  static const Color textFieldBorderColor = Color(0xffAAAAAA);
  static const Color lightTextColor = Color(0xff7B7B7B);
  static const Color textColorFaded = Color(0xff545454);
  static const Color verifiedColor = Color(0xff5DCB54);
  static const Color promoCodeColor = Color(0xffF6D798);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xff7915DE), Color(0xff260C40)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient purpleGradient = LinearGradient(
      colors: [Color(0xffD4C1FC), Color(0xff957EC7)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 1]);

  static const LinearGradient pinkGradient = LinearGradient(
      colors: [Color(0xffFCC1DD), Color(0xffF560A7)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 1]);

  static const LinearGradient yellowGradient = LinearGradient(
      colors: [Color(0xffFCEFC1), Color(0xffF4B53A)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 1]);

  static const LinearGradient labelGradient = LinearGradient(
    colors: [Color(0xff7915DE), Color(0xff260C40)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient labelGradientReverse = LinearGradient(
    colors: [Color(0xff260C40), Color(0xff7915DE)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient multiPurpleGradienr = LinearGradient(
      colors: [
        Color(0xff9765CA),
        Color(0xff7D3EBC),
        Color(0xff7D3EBC),
        Color(0xff6318AF)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.5, 0.7, 0.9]);
}
