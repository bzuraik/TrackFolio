import 'package:flutter/material.dart';


class AddClients extends StatelessWidget {
  const AddClients({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Clients Profile"),
          // save action
          actions: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () { },
              //onSaved(){},
              child: Text('Save'),
            ),
          ],
            // go back to main page
            leading: GestureDetector(
            onTap: () =>  Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_new_rounded)),
          ),


      body: SafeArea(
        child: Padding(

        padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
           
            Expanded(flex: 2,
              child: Container(
                child: Row(children: [
                  // profile pic
                  Padding(padding: EdgeInsets.all(8.0),
                    child: Expanded(flex: 1,
                      child: Container(
                        child: 
                        CircleAvatar(
                              radius: 60, 
                              backgroundColor: Colors.blue,
                              child: CircleAvatar(
                              radius: 58, 
                              backgroundColor: Colors.white,
                              //backgroundImage: NetworkImage(
                              //'INSERT_YOUR_URL_HERE',
                              // ),
                              //),
                              ),
                            ),
                          ),
                        ),
                      ),
                  
                  
                  // name and company
                  Expanded(flex: 2, 
                    child: Container(
                      child: Column(children: [
                        
                        Padding(padding: EdgeInsets.only(left: 7.0, right: 5.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter name',
                              hintStyle: TextStyle(
                                color: Colors.grey,),
                            ),
                          ),
                        ),


                        Padding(padding: EdgeInsets.only(left: 7.0, right: 5.0),
                          child: TextFormField(
                            style: TextStyle(fontSize: 15),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter company',
                              hintStyle: TextStyle(
                                color: Colors.grey,),
                            ),
                          ),
                        ),

                      ],),
                    ),
                  ),
                ],)
              ),
            ),
          


          // ADDRESS
          Expanded(
            child: Container(margin: EdgeInsets.all(5.0),
              child: Column(children: [
              Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('ADDRESS', textAlign: TextAlign.start,),
            ),


              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'enter here',
                    hintStyle: TextStyle(
                    color: Colors.grey
                         ),
                    ),
                  ),
              ),
              ]),
            

          ),),
         
          // PHONE
          Expanded(
            child: Container(margin: EdgeInsets.all(5.0),
              child: Column(children: [
              Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('PHONE', textAlign: TextAlign.start,),
            ),


              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'enter here',
                    hintStyle: TextStyle(
                    color: Colors.grey
                         ),
                    ),
                  ),
                
                ),
             ]),
            ),
           ),


          // NOTES
          Expanded(flex: 2,
            child: Container(margin: EdgeInsets.all(5.0),
              child: Column(children: [
              Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('NOTES', textAlign: TextAlign.start,),
              ),


              Flexible(
                child: TextFormField(
                      minLines: 4,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'enter here',
                      hintStyle: TextStyle(
                          color: Colors.grey
                        ),
                    border: OutlineInputBorder(
                      gapPadding: 10.0 ,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),

            ]),
            ),
          ),

          
          // PROJECTS
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('  PROJECTS', textAlign: TextAlign.start,),
            ),
        
            Expanded(flex: 2,
            child: Row(children: [

                Expanded(
                  child: Container(margin: EdgeInsets.all(3),
                     decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(13.0)),),),
                
                Expanded(
                  child: Container(margin: EdgeInsets.all(3),
                     decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(13.0)),),),
                             
                Expanded(
                  child: Container(margin: EdgeInsets.all(3),
                     decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(13.0)),),),

           
               ]),
              ),
          

            // SEE ALL BUTTON
            Padding(padding: EdgeInsets.all(3.0) ,
              child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),),
              onPressed: () { }, //go to all projects
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Text(
                  'See all',
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ),
            ),
          ),
              
 
            ],),
          ),
        ),      
      ),
    );
  }
}

