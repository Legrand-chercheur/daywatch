import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomTransitions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, SizeTransition5(SecondPage())),
              child: Text('TAP TO VIEW SIZE ANIMATION 5')),
        ],
      ),
    );
  }
}


class SizeTransition5 extends PageRouteBuilder {
  final Widget page;

  SizeTransition5(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.centerRight,
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}
String name="";
class _SecondPageState extends State<SecondPage> {
  String? value;
  Future Recherche()async{
    final uri =
    Uri.parse('https://twend.alwaysdata.net/controller_api.php');
    var reponse = await http.post(uri,body: {
      'clic':'recherche',
    });
    setState(() {
      if(reponse.body!= ""){
        value = reponse.body;
      }
    });
    print(json.decode(reponse.body));
    return json.decode(reponse.body);
  }

  Future Films()async{
    final uri =
    Uri.parse('https://emploie.alwaysdata.net/daywatch/controller_api.php');
    var reponse = await http.post(uri,body: {
      'clic':'film',
    });
    return json.decode(reponse.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Films();
  }
  @override
  Widget build(BuildContext context) {
    List? listes;
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Row(
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(CupertinoIcons.multiply,color: Colors.white,)
              ),
              SizedBox(width: 10,),
              Text('Recherche',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              )
            ],
          ),
          SizedBox(height: 20,),

          Container(
            width: 400,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 20,top: 4),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(CupertinoIcons.search,color: Colors.white,),
                  labelStyle: TextStyle(
                    color: Colors.white
                  ),
                  hintText: "Recherchez une serie, un film, un ge...",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),

                  focusColor: Colors.white,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,

                ),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 30,),
          Expanded(
            child: FutureBuilder(
                future: Films(),
                builder: (context,snapshot){
                  listes = snapshot.data;
                  if(listes != null){
                    return ListView.builder(
                        itemCount: listes!.length,
                        itemBuilder: (context, element){
                          if(listes![element]['nom_film'].toString().toLowerCase().startsWith(name.toLowerCase())){
                            return ListTile(
                              title: GestureDetector(
                                onTap: (){
                                  //Navigator.push(context,MaterialPageRoute(builder: (context) => ));
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: NetworkImage('https://emploie.alwaysdata.net/daywatch/'+listes![element]['image_film']),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      listes![element]['nom_film'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              selected: true,


                            );
                          }
                          return Container();
                        });
                  }else {
                    return Center(child: CircularProgressIndicator(
                      color: Colors.red));
                  }
                }),
          ),
        ],
      ),
    );
  }
}





