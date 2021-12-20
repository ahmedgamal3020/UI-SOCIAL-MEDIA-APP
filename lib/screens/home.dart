import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo/screens/chats.dart';
import 'package:demo/ssd.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  _homeState createState() => _homeState();
}
class _homeState extends State<home> {
  int index=2;
  @override
  Widget build(BuildContext context) {
    final items =<Widget>[
      const Icon(MdiIcons.bell,size: 20,),
      const Icon(Icons.add,size: 30,),
      const Icon(MdiIcons.homeAccount,size: 20,),
    ];
    return ClipRect(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          brightness: Brightness.dark,
          leading: const SizedBox(),
          leadingWidth: 0,
          title:const Text('demo',style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,letterSpacing: -1.2
          ),
          ),
          actions:
          [
           IconButton(
                icon:Icon(MdiIcons.accountSearch,),
                onPressed: (){}
            ),
            const SizedBox(width: 2,),
            IconButton(
                icon:Icon(MdiIcons.chat),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>chats()));
                }
            ),


          ],
        ),
        body:showScreens[index] ,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(color: Colors.white),
            ),
            child: CurvedNavigationBar(
              key: navigtionKey,
              animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                buttonBackgroundColor: Colors.blue,
                color: Colors.black,
                items:items,
                height:60,
                index: index,
                onTap: (index)=>
                    setState(() {
                      this.index = index;
                    })



            ),
          )
      ),
    );
  }
}
