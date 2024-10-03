import 'package:flutter/material.dart';


class calculatorPage extends StatefulWidget {
  const calculatorPage({super.key});

  @override
  State<calculatorPage> createState() => _calculatorPageState();
}

class _calculatorPageState extends State<calculatorPage> {
  //list of values on the keypad
  final List keypads = ['..','1','2','3','4','5','6','7','8','9','0','AC','%','/','x','-','+','='];
                   //    0   1   2   3   4   5   6   7   8   9   10  11  12  13   14  15  16
  //double result =0;
  //setting up a textField controller
  String buttonValueForTextfield = '';
  String lastOperator = '';
  double result = 0;
  List operations = [];
  void getValueEnteredFromKeyPad(String buttonValue){
    //String buttonValue = keypads[index];
    setState(() {
         if(buttonValue !='x' && buttonValue !='+' && buttonValue !='=' && buttonValue !='-' && buttonValue !='/' && buttonValue !='AC'  ) {
            buttonValueForTextfield += buttonValue ;
         }else if(buttonValue == 'AC'){
           clearEntireTextField();
         }else if(buttonValue !='='){
                lastOperator = buttonValue;
                performCalculation(buttonValueForTextfield, buttonValue);
                buttonValueForTextfield = '';
         }else{
               performCalculation(buttonValueForTextfield, lastOperator);
               double finalResult = displayResult();
               buttonValueForTextfield = finalResult.toString();
               setResultZero();
         }
    });
  }

  void performCalculation(String buttonValueForTextfield, String buttonValue) {
       double convertTextFieldValue = double.parse(buttonValueForTextfield);
       if(buttonValue == '+') {
         result += convertTextFieldValue;
       }else if(buttonValue == '-'){
         result = setResultToTextFieldValue(result, buttonValue, convertTextFieldValue);
       }else if(buttonValue == '/'){
         result = setResultToTextFieldValue(result, buttonValue, convertTextFieldValue);
       }else if(buttonValue == 'x'){
         result = setResultToTextFieldValue(result, buttonValue, convertTextFieldValue);
       }
  }

  double setResultToTextFieldValue(double value, String buttonValue, double convertTextFieldValue){
    late double finalValue;
    if(value == 0){
        finalValue =  convertTextFieldValue;
      }else{
       switch(buttonValue){
         case '-':
           finalValue = value - convertTextFieldValue;
         case 'x':
           finalValue = value * convertTextFieldValue;
         case '/':
           finalValue = value / convertTextFieldValue;
       }
      }
       return finalValue;
  }

  double displayResult(){
    return result;
  }

  void setResultZero(){
    result = 0;
  }

  //clear the last value in the textField
  void clearLastValueOfTextField(){
      setState(() {
        if(buttonValueForTextfield.isNotEmpty) {
          int textFieldLength = buttonValueForTextfield.length;
          buttonValueForTextfield =
              buttonValueForTextfield.substring(0, textFieldLength - 1);
        }
      });
  }

  void clearEntireTextField(){
    buttonValueForTextfield = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        foregroundColor: Colors.blue,
        title: const Text(
          'Yuraina',
          style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              letterSpacing: 8.0,
              shadows: [
                Shadow( // bottomLeft
                    offset: Offset(-1.5, -1.5),
                    color: Colors.white
                ),
                Shadow( // bottomRight
                    offset: Offset(1.5, -1.5),
                    color: Colors.white
                ),
                Shadow( // topRight
                    offset: Offset(1.5, 1.5),
                    color: Colors.white
                ),
                Shadow( // topLeft
                    offset: Offset(-1.5, 1.5),
                    color: Colors.white
                ),
              ]
          ),
        ),
        centerTitle: true,
        ),

      body: Container(
          color: Colors.grey[900],
        child: Padding(
          padding:  EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                    controller: TextEditingController(text: '${buttonValueForTextfield}'),
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[500],
                    ),
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[900],
                      filled: true,
                    ),

                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey[500]
                    ),
                    onPressed: (){
                      clearLastValueOfTextField();
                    },
                    icon: Icon(Icons.backspace),
                    //iconAlignment: IconAlignment.end,
                    label: Text(''),
                  ),
                ]
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.grey[500],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('AC');
                        },
                      child: Text(
                        'AC',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.grey[500],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('+/-');
                      },
                      child: Text(
                        '+/-',
                        style: TextStyle(
                          fontSize: 20,
                            fontWeight: FontWeight.bold,

                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.grey[500],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('%');
                      },
                      child: Text(
                        '%',
                        style: TextStyle(
                          fontSize: 20,
                            fontWeight: FontWeight.bold,

                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.blue[800],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('/');
                      },
                      child: Text(
                        '/',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,

                        ),
                      )
                  ),


                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(75, 75),
                              backgroundColor: Colors.black54,
                              foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(12.0)
                          )
                            ),
                          onPressed: () {
                            getValueEnteredFromKeyPad('7');
                          },
                          child: Text(
                              '7',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),
                          )
                      ),

                  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(75, 75),
                              backgroundColor: Colors.black54,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)
                              )
                          ),
                          onPressed: (){
                            getValueEnteredFromKeyPad('8');
                          },
                          child: Text(
                              '8',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                          )
                      ),

                   ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(75, 75),
                              backgroundColor: Colors.black54,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)
                              )
                          ),
                          onPressed: (){
                            getValueEnteredFromKeyPad('9');
                          },
                       child: Text(
                         '9',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 20
                         ),
                       )
                      ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.blue[800],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('x');
                      },
                      child: Text(
                        'x',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      )
                  ),
                ],
              ),
               SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('4');
                      },
                      child: Text(
                        '4',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,

                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('5');
                      },
                      child: Text(
                        '5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('6');
                      },
                      child: Text(
                        '6',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      )
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.blue[800],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('-');
                      },
                      child: Text(
                        '-',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      )
                  ),

                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('1');
                      },
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,

                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('2');
                      },
                      child: Text(
                        '2',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('3');
                      },
                      child: Text(
                        '3',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      )
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(75, 75),
                          backgroundColor: Colors.blue[800],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad('+');
                      },
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      )
                  ),

                ],
              ),

              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(160, 75),
                            backgroundColor: Colors.black54,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)
                            )
                        ),
                        onPressed: (){
                          getValueEnteredFromKeyPad('0');
                        },
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,

                          ),
                        )
                    ),

                       ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(75, 75),
                            backgroundColor: Colors.black54,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)
                            )
                        ),
                        onPressed: (){
                          getValueEnteredFromKeyPad('.');
                        },
                        child: const Text(
                          '.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        )
                    ),


                   ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            foregroundColor: Colors.white,
                            fixedSize: Size(75, 75),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)
                            )
                        ),
                        onPressed: (){
                          getValueEnteredFromKeyPad('=');
                        },
                        child: const Text(
                          '=',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        )
                    ),
                ],
              )
            ],
          ),
        ),
      )
      );
  }

}
