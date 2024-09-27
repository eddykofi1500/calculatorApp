import 'package:flutter/material.dart';

class calculatorPage extends StatefulWidget {
  const calculatorPage({super.key});

  @override
  State<calculatorPage> createState() => _calculatorPageState();
}

class _calculatorPageState extends State<calculatorPage> {
  @override
  Widget build(BuildContext context) {
    //list of values on the keypad
    final List keypads = ['1','2','3','4','5','6','7','8','9','0','=','-','+','/','c'];

    void getValueEnteredFromKeyPad(String keyPadValue){
      print(keyPadValue);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
        title: const Text(
          'Calculator',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 8.0
          ),
        ),
        centerTitle: true,
        ),

      body: Container(
          color: Colors.grey[850],
        child: Padding(
          padding:  EdgeInsets.all(12.0),
          child: Column(
            children: [
                Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[500],
                    ),
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.grey[600],
                      filled: true,
                    ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){
                        getValueEnteredFromKeyPad(keypads[12]);
                      },
                      child: Text(
                        keypads[12],
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        '-',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50
                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        '/',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50
                        ),
                      )
                  )

                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(12.0)
                          )
                            ),
                          onPressed: (){},
                          child: Text(
                              '1',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,

                            ),
                          )
                      ),

                  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)
                              )
                          ),
                          onPressed: (){},
                          child: Text(
                              '2',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50
                              ),
                          )
                      ),

                   ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)
                              )
                          ),
                          onPressed: (){},
                       child: Text(
                         '3',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 50
                         ),
                       )
                      )
                ],
              ),
               SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        '4',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,

                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        '5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50
                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        '6',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50
                        ),
                      )
                  )

                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        '7',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,

                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        '8',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50
                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        '9',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50
                        ),
                      )
                  )

                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        'c',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,

                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        '0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50
                        ),
                      )
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: (){},
                      child: Text(
                        '=',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50
                        ),
                      )
                  )

                ],
              )
            ],
          ),
        ),
      )
      );
  }
}
