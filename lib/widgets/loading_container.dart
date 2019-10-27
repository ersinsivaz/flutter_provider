import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final bool  isVisible;
  LoadingContainer({this.isVisible});

  @override
  Widget build(BuildContext context) {
    if(isVisible){
      return CircularProgressIndicator();
    }
    
    return Text(" ");
  }
  
  Widget buildContainer(){
    return Container(
      color: Colors.grey[200],
      height: 24.0,
      width: 150.0,
      margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
    );
  }
}//cs