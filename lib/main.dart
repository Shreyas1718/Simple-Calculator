import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String outPut='0';
  String _outPut='0';
double num1=0.0;
double num2=0.0;

String operand="";


  buttonClick(String buttonText){
    if(buttonText=="CLEAR"){
      _outPut='0';
      num1=0.0;
      num2=0.0;
      operand="";
    } else if(buttonText=='+' || buttonText=='-' || buttonText=='*' || buttonText=='/'){
      num1=double.parse(outPut);
      operand=buttonText;
      _outPut='0';
    }else if(buttonText=='.'){
      if(_outPut.contains('.')){
        print('already contains decimals');
        return;
      }else {
        _outPut =_outPut+ buttonText;
      }
    }else if(buttonText=='='){
      num2=double.parse(outPut);
      if(operand=="+"){
        _outPut=(num1+num2).toString();
      }
      if(operand=="-"){
        _outPut=(num1-num2).toString();
      }
      if(operand=="*"){
        _outPut=(num1*num2).toString();
      }
      if(operand=="/"){
        _outPut=(num1/num2).toString();
      }
      num1=0.0;
      num2=0.0;
      operand="";
    }else{
      _outPut=_outPut+buttonText;
    }
    setState(() {
      outPut=double.parse(_outPut).toStringAsFixed(2);
    });
  }
  Widget calculatorButton(String buttonText){
   return Expanded(
      child: OutlineButton(
        color: Colors.teal,
        textColor: Colors.black,
        child: Text(buttonText,style: TextStyle(
          fontSize: 20.0,
        ),),
        padding: EdgeInsets.all(24),
        onPressed: (){
          buttonClick(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Text(outPut,style: TextStyle(
                  fontSize: 40
                ),),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.white,
              ),
            ),
            Row(
              children: <Widget>[
                calculatorButton('1'),
                calculatorButton('2'),
                calculatorButton('3'),
                calculatorButton('+'),
              ],

            ),
            Row(
              children: <Widget>[
                calculatorButton('4'),
                calculatorButton('5'),
                calculatorButton('6'),
                calculatorButton('-'),
              ],

            ),
            Row(
              children: <Widget>[
                calculatorButton('7'),
                calculatorButton('8'),
                calculatorButton('9'),
                calculatorButton('*'),
              ],

            ),
            Row(
              children: <Widget>[
                calculatorButton('.'),
                calculatorButton('0'),
                calculatorButton('00'),
                calculatorButton('/'),
              ],

            ),
            Row(
              children: <Widget>[
                calculatorButton('CLEAR'),
                calculatorButton('='),

              ],

            ),

          ],
        ),
      )
    );
  }
}
