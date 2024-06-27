
import 'package:enuaniculturalforummobile/view_model/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enuaniculturalforummobile/config/app_strings.dart';
import 'package:enuaniculturalforummobile/src/models.dart';
import 'package:enuaniculturalforummobile/src/repository.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';

final registrationViewModel = ChangeNotifierProvider((ref) => RegistrationViewModel());

class RegistrationViewModel extends ChangeNotifier {


  final authService = AuthBackend();
  final registrationFormKey = GlobalKey<FormState>();


  final TextEditingController _registerEmailController = TextEditingController();
  final TextEditingController _registerPwdController = TextEditingController();
  final TextEditingController _registerConfirmPwdController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _refCodeController = TextEditingController();
  CustomButtonState _buttonRegisterState = CustomButtonState(
    buttonState: ButtonState.idle, text: createAccount,);

  bool _obscurePasswordText = true;
  bool _obscureConfirmPwdText = true;
  bool _isChecked = false;


  bool get isChecked => _isChecked;

  TextEditingController get registerEmailController => _registerEmailController;
  TextEditingController get registerPwdController => _registerPwdController;
  TextEditingController get registerConfirmPwdController => _registerConfirmPwdController;
  TextEditingController get  firstNameController => _firstNameController;
  TextEditingController get  fullNameController => _fullNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get refCodeController => _refCodeController;
  CustomButtonState? get buttonRegisterState => _buttonRegisterState;
  bool get obscurePasswordText => _obscurePasswordText;

  bool get obscureConfirmPwdText => _obscureConfirmPwdText;




  void  togglePwdVisibility() {
    _obscurePasswordText = !_obscurePasswordText;
    notifyListeners();
  }

  void  toggleConfirmPwdVisibility() {
    _obscureConfirmPwdText = !_obscureConfirmPwdText;
    notifyListeners();
  }
  // void  toggleCheckerVisibility() {
  //     _isChecked = !_isChecked;
  //     updateRegisterButtonState();
  //     notifyListeners();
  //   }

//   void updateRegisterButtonState() {
//
//
//   if (_isChecked != true ) {
//     _buttonRegisterState = CustomButtonState(
//       buttonState: ButtonState.disabled,
//       text: login,
//     );
//   } else {
//     _buttonRegisterState = CustomButtonState(
//       buttonState: ButtonState.idle,
//       text: login,
//     );
//   }
//   notifyListeners();
// }




Future<void> userRegistration(BuildContext context) async {



  if (registrationFormKey.currentState!.validate()) {
    registrationFormKey.currentState!.save();

    try {
      _buttonRegisterState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: createAccount,
      );
      notifyListeners();
      await authService
          .signUp(
          email: _registerEmailController.text,
          password: _registerPwdController.text,
          fullName: _fullNameController.text,
      )
          .then((value) async {
        if (value != null) {
          // print(value['status'].toString());
          //   final decodeResponse = jsonDecode(value.toString());
          final decodeResponse = value;
          logger.w(decodeResponse);
          if (value['status'].toString() == 'true') {


            await AuthViewModel().userAutoLogin(context, email: registerEmailController.text.toString(), password: registerPwdController.text.toString());
            _buttonRegisterState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: createAccount,
            );
            showToast(
              msg: value['message'].toString(),
              isError: false,
            );

            DummyData.emailAddress = _registerEmailController.text.toString();

            // navigatePush(context,  EmailVerificationScreen(
            //   title: emailCheck,
            //   subTitle: sentOTPUserEmail,
            //   email: _registerEmailController.text.toString(),));

          } else if (value['status'].toString() == 'status') {
            notifyListeners();
          } else {

            showToast(
              msg: value['data'].toString(),
              isError: true,
            );

          }
        }
      }).whenComplete(() {
        _buttonRegisterState = CustomButtonState(
          buttonState: ButtonState.idle,
          text: createAccount,
        );
        notifyListeners();
      });
    } catch (e, s) {
      // showToast(
      //   // msg: somethingWentWrong,
      //   isError: true,
      // );
      logger
        ..i('')
        ..e(s);
    }
  }

}

}