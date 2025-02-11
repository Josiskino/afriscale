import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  
  //----------------------------------------------------------------------------
  // Light Theme Colors
  //----------------------------------------------------------------------------

  static const Color primaryColorLight = Color(0xFF0077C2);    
  static const Color secondaryColorLight = Color(0xFF59a5f5);  
  static const Color tertiaryColorLight = Color(0xFF00BFFF);   

  static const Color backgroundColorLight = Color(0xFFFFFFFF); 
  static const Color appBarColorLight = Color(0xFFf5f5f5);     
  static const Color containerColorLight = Color(0xFFcccccc);  

  // Changed from f5f5f5 to e8e8e8 pour différencier de appBarColorLight
  static const Color surfaceColorLight = Color(0xFFe8e8e8);   
  static const Color onSurfaceColorLight = Color(0xFF333333); 

  static const Color textColorLight = Color(0xFF333333);      
  // Changed from 5c5c5c to 666666 pour une meilleure hiérarchie
  static const Color subTextColorLight = Color(0xFF666666);   

  //----------------------------------------------------------------------------
  // Dark Theme Colors
  //----------------------------------------------------------------------------
  
  static const Color primaryColorDark = Color(0xFF59a5f5);    
  static const Color secondaryColorDark = Color(0xFF00BFFF);   
  static const Color tertiaryColorDark = Color(0xFF00619a);    

  static const Color backgroundColorDark = Color(0xFF1A1A1A);  
  // Changed from 2D2D2D to 242424 pour plus de subtilité
  static const Color appBarColorDark = Color(0xFF242424);     
  static const Color containerColorDark = Color(0xFF333333);   

  // Changed from 252525 to 2A2A2A pour une meilleure distinction
  static const Color surfaceColorDark = Color(0xFF2A2A2A);    
  static const Color onSurfaceColorDark = Color(0xFFE0E0E0);  

  static const Color textColorDark = Color(0xFFEEEEEE);       
  // Changed from AAAAAA to 9E9E9E pour un meilleur contraste
  static const Color subTextColorDark = Color(0xFF9E9E9E);    
}