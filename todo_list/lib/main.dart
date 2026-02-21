import  'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:AppBar(
        
        title:Text('Todo List'),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.search)),
          IconButton(onPressed: (){}, icon:Icon(Icons.nightlight_round)),
        ],
      ),

      body:Column(
        children:[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Today', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ),
              Expanded(child:Container(height: 10,)),
              IconButton(onPressed: (){}, icon:Icon(Icons.calendar_today)),
              IconButton(onPressed: (){}, icon:Icon(Icons.more_horiz)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                        ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(Icons.add),
                      hintText: 'Add a new task',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  LIstDesign('Buy groceries'),
                  SizedBox(height: 10,),
                  LIstDesign('Walk the dog'),
                  SizedBox(height: 10,),
                  LIstDesign('Finish Flutter project'),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container LIstDesign(String text) {
    return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(Icons.check_box_outline_blank),
                    title: Text(text),
                    trailing: Icon(Icons.star_border),
                  ),
                );
  }
}