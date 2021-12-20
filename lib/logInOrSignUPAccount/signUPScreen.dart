
import 'package:demo/logInOrSignUPAccount/addPhoto.dart';
import 'package:demo/widgets/Button.dart';
import 'package:demo/widgets/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class singUpScreen extends StatefulWidget {
  const singUpScreen({Key? key}) : super(key: key);

  @override
  _singUpScreenState createState() => _singUpScreenState();
}

// ignore: camel_case_types
class _singUpScreenState extends State<singUpScreen> {
  TextEditingController controllerName=TextEditingController();
  TextEditingController controllerPhone=TextEditingController();
  TextEditingController controllerBirth=TextEditingController();
  var formKey = GlobalKey<FormState>();
  var popname;
  var popphone;
  var popdate;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('demo',style: TextStyle(color: Colors.black,fontSize: 25),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create Your\nAccount',style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultTextField (
                      keyBoardType:TextInputType.name,
                        label: 'Name',
                         controller:controllerName,
                        validator: (value) {
                          if(value.isEmpty)
                          {
                            popname=controllerName.text;
                            return 'name Most not be empty';
                          }
                          popname=controllerName.text;
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultTextField (
                        keyBoardType:TextInputType.phone,
                        label: 'phone or emailAddress',
                        controller:controllerPhone,
                        validator: (value) {
                          if(value.isEmpty)
                          {
                            popphone=controllerPhone;

                            return 'phone Most not be empty';
                          }
                          popphone=controllerPhone;

                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultTextField(
                        label: 'Date of birth',
                        controller:controllerBirth,
                        OnTap: ()
                        {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.parse('2017-01-01'),
                            firstDate: DateTime.parse('1970-01-01'),
                            lastDate:DateTime.parse('2017-01-31'),
                          ).then((value)
                          {
                            controllerBirth.text=DateFormat.yMMMd().format(value!);

                          });
                        },
                        validator: (value) {
                          if(value.isEmpty)
                          {
                            popdate=controllerBirth.text;
                            return 'Date Most not be empty';
                          }
                          popdate=controllerBirth.text;
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defaultButton(
                          width: 100,
                          text: 'Next',
                          onPressed: (){
                            setState(() {
                              if(popname==null||popphone==null||popdate==null)
                              {
                                formKey.currentState!.validate();
                              }
                              else
                                Navigator.push(context, MaterialPageRoute(
                                    builder:(context)=>addPhoto()
                                ));
                            });




                          }
                        ),
                      ],
                    )

                  ],
                ),
          ),


          ),
      ),

    );
  }
}
