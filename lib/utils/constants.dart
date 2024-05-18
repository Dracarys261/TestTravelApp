import 'package:flutter/material.dart';






///smal Gap
const smallGap = SizedBox(
  height: 15,
);

///large Gap
const largeGap = SizedBox(
  height: 30,
);

///Custom SnackBar
extension ShowSnackBar on BuildContext{
  void showErrorMessage(String message){
    ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
            content:Text(
                message,
              style: const TextStyle(color: Colors.redAccent),
            ),
          backgroundColor: Colors.grey,
        )
    );
  }
}