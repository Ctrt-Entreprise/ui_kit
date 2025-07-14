import 'package:flutter/material.dart';

class CtrtColors {
  // --------------------
  // MARQUES
  // --------------------

  // FOR CARANGE
  static const Color primaryCarange = Color(0xFFF42E21);

  // FOR PRO STOCK
  static const Color primaryProStock = Color(0xFF2752E7);
  static const Color primaryProStockTransparent = Color(0x402752E7);
  static const Color secondaryProStock = Color(0xFFFF6600);
  static const Color lightGreyProStock = Color(0xffF5F6FA);
  static const Color textSecondaryProStock = Color(0xff718096);
  static const Color borderProStock = Color(0xffE2E8F0);

  // --------------------
  // COULEURS COMMUNES
  // --------------------
  static const Color primary = Color(0xFF00377D);
  static const Color primaryLightColor = Color(0xFF5F99D2);
  static const Color primaryTransparentColor = Color(0xFFE9FAFF);

  static const Color secondary = Color(0xFFFFD100);
  static const Color secondaryLightColorTagDark = Color(0xFFFFFF41);
  static const Color secondaryTransparentColor = Color(0xFFFFFFE7);

  static const Color tertiaryColor = Color(0xFFF2F2F2);
  static const Color background = Color(0xFFF2F2F2);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color textPrimary = Color(0xFF343A40);
  static const Color textSecondary = Color(0xFF757575);

  // --------------------
  // BOUTONS
  // --------------------
  static const Color btnOky = Color(0xFF2F45FF);
  static const Color btnSuccess = Color(0xFF07E500);
  static const Color btnWorning = Color(0xFFE67E22);
  static const Color btnError = Color(0xFFFF2323);

  // --------------------
  // VARIANTS ROUGES
  // --------------------
  static const Color darkRed = Color(0xFFE53935);
  static const Color lightRed = Color(0xFFFFCDD2);
  static var transparentRed = darkRed.withOpacity(0.05);

  static const Color darkRed2 = Color(0xFF800000);
  static const Color lightRed2 = Color(0xFFFFCDD2);
  static var transparentRed2 = darkRed2.withOpacity(0.05);

  // --------------------
  // VARIANTS BLEUS
  // --------------------
  static const Color darkBleu = Color(0xFF1E88E5);
  static const Color lightBleu = Color(0xFFBBDEFB);
  static const Color transparentBleu = Color(0xFFD5E4FF);

  // --------------------
  // VARIANTS VERTS
  // --------------------
  static const Color darkGreen = Color(0xFF43A047);
  static const Color lightGreen = Color(0xFFC8E6C9);
  static var transparentGreen = darkGreen.withOpacity(0.1);

  static const Color darkGreen2 = Color(0xFF148F77);
  static const Color lightGreen2 = Color(0xFFC5E1D9);
  static var transparentGreen2 = darkGreen2.withOpacity(0.1);

  // --------------------
  // VARIANTS JAUNES
  // --------------------
  static const Color darkYellow = Color(0xFFFDD835);
  static const Color lightYellow = Color(0xFFFFF9C4);
  static const Color transparentYellow = Color(0xFFF4FFC1);

  // --------------------
  // VARIANTS ORANGE
  // --------------------
  static const Color darkOrange = Color(0xFFFB8C00);
  static const Color lightOrange = Color(0xFFFFE0B2);
  static const Color transparentOrange = Color(0xFFFAEACB);

  // --------------------
  // VARIANTS GREY
  // --------------------
  static const Color darkGrey = Color(0xFF616161);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color transparentGrey = Color(0xFFF0F0F0);

  // --------------------
  // NOUVELLES PALETTES TENDANCES
  // --------------------
  static const Color softViolet = Color(0xFF8E7BEF);
  static const Color transparentViolet = Color(0x408E7BEF);

  static const Color coolCyan = Color(0xFF00BCD4);
  static const Color transparentCyan = Color(0x4000BCD4);

  static const Color pinkCoral = Color(0xFFF67280);
  static const Color transparentCoral = Color(0x40F67280);

  static const Color deepIndigo = Color(0xFF3F51B5);
  static const Color softIndigo = Color(0xFFC5CAE9);

  static const Color darkTeal = Color(0xFF004D40);
  static const Color lightTeal = Color(0xFFB2DFDB);

  // --------------------
  // POUR LES GRAPHIQUES
  // --------------------
  static const Color roseBubblegum = Color(0xFFFF74C5);
  static const Color orangeFlamme = Color(0xFFFB541F);
  static const Color turquoiseTropicale = Color(0xFF12C7C1);
  static const Color bleuOceanTransparent = Color(0x402752E7);
  static const Color orangeAbricot = Color(0xFFFF8743);
  static const Color orangeAbricotTransparent = Color(0x40FF8743);
  static const Color vertMentheFraiche = Color(0xFF00B69B);
  static const Color vertMentheTransparent = Color(0x4000B69B);
  static const Color rougeCorail = Color(0xFFEF3826);
  static const Color rougeCorailTransparent = Color(0x40EF3826);

  // --------------------
  // BADGE STATUS COLORS
  // --------------------
  static Map<String, dynamic> badgeBGColor = {
    "ACTIF": transparentGreen2,
    "INACTIF": transparentRed,
    "BLOQUÉ": transparentOrange,
    "ARCHIVÉ": transparentRed,
    "EN ATTENTE": transparentGrey,
    "PRÉT POUR DEMARRAGE": transparentGreen,
    "ATTENTE DE CHAUFFEUR": transparentOrange,
    "EN COURS": transparentBleu,
    "TERMINÉ": transparentGreen,
    "ANNULÉ": transparentRed,
    "UNASSIGNED": transparentGrey,
    "PENDING": transparentGrey,
    "ACCEPTÉ": transparentGreen2,
    "REJETÉ": transparentRed,
    "PAYÉ": transparentGreen,
    "NON PAYÉ": transparentRed,
    "ACCEPTÉ PAR LE CHAUFFEUR": transparentGreen,
    "REJETÉ PAR LE CHAUFFEUR": transparentRed,
    "EN ATTENTE DE VALIDATION DU CHAUFFEUR": transparentGrey,
    "NON ASSIGNÉ À UN CHAUFFEUR": transparentGrey,
    "EN ROUTE VERS LE GARAGE": transparentBleu,
    "ARRIVÉ AU GARAGE": transparentGreen,
    "PRÊT À LIVRER": transparentGreen,
    "LIVRAISON EN COURS": transparentBleu,
  };

  static var badgeTxtColor = {
    "ACTIF": darkGreen2,
    "INACTIF": darkRed,
    "BLOQUÉ": darkOrange,
    "ARCHIVÉ": darkRed,
    "EN ATTENTE": darkGrey,
    "PRÉT POUR DEMARRAGE": darkGreen,
    "ATTENTE DE CHAUFFEUR": darkOrange,
    "EN COURS": darkBleu,
    "TERMINÉ": darkGreen,
    "ANNULÉ": darkRed,
    "N0_SPECIFIED": darkGrey,
    "GREEN": darkGreen,
    "ORANGE": darkOrange,
    "RED": darkRed,
    "NON ASSIGNÉ": darkGrey,
    "ACCEPTÉ": darkGreen2,
    "REJETÉ": darkRed,
    "PAYÉ": darkGreen,
    "NON PAYÉ": darkRed,
    "ACCEPTÉ PAR LE CHAUFFEUR": darkGreen,
    "REJETÉ PAR LE CHAUFFEUR": darkRed,
    "EN ATTENTE DE VALIDATION DU CHAUFFEUR": darkGrey,
    "NON ASSIGNÉ À UN CHAUFFEUR": darkGrey,
    "EN ROUTE VERS LE GARAGE": darkBleu,
    "ARRIVÉ AU GARAGE": darkGreen,
    "PRÊT À LIVRER": darkGreen,
    "LIVRAISON EN COURS": darkBleu,
  };

}
