import 'package:flutter/material.dart';

void appSnackBar(context,String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

