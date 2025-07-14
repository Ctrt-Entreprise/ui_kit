import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class CtrtToast {
  static void show({required String message, ToastificationType type = ToastificationType.success}) {
    try {
      toastification.show(
        title: Text(message),
        autoCloseDuration: const Duration(seconds: 10),
        type: type,
      );
      // ignore: empty_catches
    } catch (e) {}
  }

  static void showMeaasgeDecoder({required String message, ToastificationType type = ToastificationType.success}) {
    try {
      toastification.show(
        title: Text(decodeErrorMessage(message), style: TextStyle(fontSize: 10.spMin),),
        autoCloseDuration: const Duration(seconds: 10),
        type: type,
        style: ToastificationStyle.fillColored
      );
      // ignore: empty_catches
    } catch (e) {}
  }


  static String decodeErrorMessage(String messageCode){
  String msg = '';
  switch (messageCode) {
    case 'INCOMPLETE_INFORMATIONS':
      msg = "Remplissez tous les champs aubligatoire du formulaire.";
      break;
    case 'INACTIVE_ACCOUNT':
      msg = "Votre compte est inactif merci de l'activer";
      break;
    case 'ACCOUNT_ALREADY_EXIST':
      msg = "Ce compte existe dejas";
      break;
    case 'ACCOUNT_NOT_EXIST':
      msg = "Ce compte n'existe pas merci de vous inscrire";
      break;
    case 'SUCCESSFULY_CONNECTED':
      msg = "Connecter avec success";
      break;
    case 'TOKEN_IS_EXPIRED':
      msg = "Session expirée ! Reconnectez-vous.";
      break;
    case 'UNKNOW_ERROR_CODE':
      msg = "Une erreur c'est produit";
      break;
    default:
      msg = messageCode;
  }
  return msg;
}
}
