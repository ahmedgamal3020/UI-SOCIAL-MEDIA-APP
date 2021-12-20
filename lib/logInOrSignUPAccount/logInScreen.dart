
import 'package:demo/screens/homeScreen.dart';
import 'package:demo/widgets/Button.dart';
import 'package:demo/widgets/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class logInScreen extends StatefulWidget {
  const logInScreen({Key? key}) : super(key: key);

  @override
  _logInScreenState createState() => _logInScreenState();
}
class _logInScreenState extends State<logInScreen> {

  TextEditingController controllerEmail=TextEditingController();
  TextEditingController controllerPassword=TextEditingController();
  bool chickPassword=true;
  var formKey = GlobalKey<FormState>();
  //this 2 valuables condition
  var popEmail;
  var popPassword;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: const Text('demo',style: TextStyle(color: Colors.black,fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children:
              [
                Text(
                  'Frist Enter\nyour phone Or Email',style:TextStyle(
              fontSize: 30,
              color:Colors.black,
              fontWeight: FontWeight.bold,
            )
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultTextField(
                    label: 'phone or email',
                    controller:controllerEmail ,
                    prefix: Icon(Icons.email),
                  validator: (value)
                  {
                    if(value.isEmpty)
                      {
                        popEmail=controllerEmail.text;
                        return 'must not be empty';
                      }
                    popEmail=controllerEmail.text;
                    return null;
                  },

                ),
                const   SizedBox(
                  height: 20,
                ),
                defaultTextField(
                  label: 'Password',
                  controller:controllerPassword ,
                  keyBoardType: TextInputType.visiblePassword,
                  prefix: Icon(Icons.lock),
                  suffix:chickPassword?Icons.remove_red_eye_outlined:Icons.remove_red_eye,
                  validator: (value)
                  {
                    if(value.isEmpty)
                    {
                      popPassword=controllerPassword.text;
                      return 'password must not be empty';
                    }
                    popPassword=controllerPassword.text;
                    return null;
                  },
                  onPressed: ()
                  {
                    setState(() {
                      chickPassword=!chickPassword;
                      print(chickPassword);
                    });
                  },
                  obscureText: chickPassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultButton(
                  width: double.infinity,
                  text: 'LogIn',
                  onPressed: (){
                    if(popEmail==null||popPassword==null)
                      {
                        formKey.currentState!.validate();
                      }
                    else
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context)=>homeScreen()
                    )
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
