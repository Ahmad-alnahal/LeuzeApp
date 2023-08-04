import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
//imageSlider
  int _sliderIndex = 0;

  setSliderIndex(int NewIndex) {
    _sliderIndex = NewIndex;
    notifyListeners();
  }

  int getSliderIndex() {
    return _sliderIndex;
  }
//end
}
