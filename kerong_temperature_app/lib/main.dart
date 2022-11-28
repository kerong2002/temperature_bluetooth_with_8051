import 'package:flutter/material.dart';
import 'my_home_page.dart';

void main(){
  runApp(const MyApp());                //重複執行
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override                             //父類接口
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature App',       //溫度偵測
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,   //按鈕顏色
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Temperature - (kerong)'),
    );
  }
}
