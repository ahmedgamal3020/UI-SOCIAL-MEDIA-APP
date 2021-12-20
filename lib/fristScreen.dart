
import 'package:demo/logInOrSignUPAccount/logInScreen.dart';
import 'package:demo/logInOrSignUPAccount/signUPScreen.dart';
import 'package:demo/widgets/Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class fristScreen extends StatefulWidget {
  const fristScreen({Key? key}) : super(key: key);

  @override
  _fristScreenState createState() => _fristScreenState();
}

// ignore: camel_case_types
class _fristScreenState extends State<fristScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('demo',style: TextStyle(color: Colors.black,fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text(
            'see what’s\nhappening in the\nworld right now',style:TextStyle(
                fontSize: 30,
                color:Colors.black,
                fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(
              height: 25,
            ),
            defaultButton(
              text: 'create account',
              width: double.infinity,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder:(context)=>singUpScreen())
                );
              }
            ),
              Row(
              children:
              [
                const Text('Have An Account Already ?'),
                TextButton(
                    onPressed:()
                    {
                      Navigator.push(context, MaterialPageRoute(
                          builder:(context)=>logInScreen()
                      )
                      );
                    },
                    child:Text('Login')
                )

              ],
            ),
          ],
        ),
      ) ,

    );
  }
}
