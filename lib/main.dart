import 'package:earch1/components.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contacts",
      home: MyHomePage(),
      )
      );
 
	
 
class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  
 bool _status = true;
  int _selectedIndex = 0;
 List <Widget> _widgets = <Widget> [


  // Text("Profile",style:TextStyle(fontSize: 20))
  Componets(),
  Text("Settings",style:TextStyle(fontSize: 20)),

 ];
 void _onItemTapped(int index){
   setState(() {
     _selectedIndex = index;
   });
 }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        //primary: false,
        
        title: Text("COW",style: TextStyle(color:Color(0xff043551) ,fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 5),),
        centerTitle: true,
  backgroundColor: Colors.transparent,
  elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.green),

      ),
          bottomNavigationBar: 
    
  BottomNavigationBar(
    
    backgroundColor: Colors.orange,
  selectedItemColor: Colors.black,
  unselectedItemColor: Colors.white,
  
    items:<BottomNavigationBarItem>[
BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Fav0rite',
          ),
        
         
        
        
  ],
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  ),
            drawer: Drawer(
    child:ListView(
children:<Widget>[
  DrawerHeader(
child:Column(children: [
  Expanded(child: 
  //Image.network("https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png",width:200),
 /*
 CircleAvatar(
radius: 85,
backgroundColor: Colors.blueGrey,
//backgroundImage:// NetworkImage("https://www.globalpeacechain.org/wp-content/uploads/2019/06/58375852_2043258939310210_1694514200572854272_n.jpg"),
backgroundImage: AssetImage("images/ear.png"),
 ),
  */
  Container(
  decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black, spreadRadius: 5)],
  ),
  child: CircleAvatar(
    radius: 85.0,
    backgroundImage: AssetImage("images/a.png"),
  ),
),
  ),
  SizedBox(height:10),
  Text("Mohammad Faidi",style:TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold)),
  SizedBox(height:10),
  Container(
    height: 2,
    color: Colors.grey,
   // margin: EdgeInsets.all(12),
  ),
],
),
decoration: BoxDecoration(color: Colors.white),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ListTile(
      
title: Text("DARK MODE"),
//leading: Icon(Icons.account_circle),
//trailing: //Icon(Icons.ac_unit_outlined),
/*
trailing: Switch(onChanged: (bool value){
  setState(() {
    switchVal = value;
  }

  );
}, value:switchVal,),
*/
trailing: Switch(
              activeColor: Colors.black,
              value: _status,
              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  _status = value;
                _status == true?ThemeData.light():ThemeData.dark(); 

                });
              },
            ),
onTap: (){
      Navigator.pop(context);
     
},
    ),
  ),
  
 

],
    ),
  ),
  body: Container(
    child:
  _widgets.elementAt(_selectedIndex),
  ),
    


    );
 }



}