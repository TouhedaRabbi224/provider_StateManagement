import 'package:flutter/material.dart';

class EligibilityScreenProvider extends ChangeNotifier{
   String _message = 'You have not given any Input';
   //for eligibilty change
   bool _isEligibile = false;

   String get message => _message;

   bool get isEligibile => _isEligibile;
//method for eligibility change

   void CheckEligibility(int age){

     if( age >= 18){
       // you are eligible
       eligible();
     }else{
       //you are not eligible
       notEligible();


     }
   }

  void eligible() {
     _isEligibile = true;
     _message = 'You are eligible for driving licensed';
//must be call notifyListeners
     notifyListeners();
  }

  void notEligible() {
    _isEligibile = false;
    _message = 'You are not eligible for driving licensed';
//must be call notifyListeners
    notifyListeners();
  }
}
