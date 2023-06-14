import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Acceuil.dart';
import 'Bottom_bar.dart';


class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      body: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/DayWatch Main Logo 2400x1800.png'),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/3,
            child: CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('img/DayWatch Inverted Color 2400x1800.jpg'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(204, 36, 44, 1),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('img/Facebook Post.jpeg'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(204, 36, 44, 1),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('img/Watermark6.png'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ],
                options: CarouselOptions(
                    height: 400,
                    viewportFraction: 0.8,
                    aspectRatio: 16/9,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(
                        seconds: 5
                    ),
                    autoPlayAnimationDuration: Duration(
                        milliseconds: 800
                    ),
                    autoPlayCurve: Curves.decelerate
                )),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Text('data')
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.3,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 20,top: 4),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(CupertinoIcons.mail_solid,color: Colors.white,),
                  labelStyle: TextStyle(
                      color: Colors.white
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),

                  focusColor: Colors.white,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,

                ),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.3,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 20,top: 4),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(CupertinoIcons.lock_fill,color: Colors.white,),
                  labelStyle: TextStyle(
                      color: Colors.white
                  ),
                  hintText: "Mot de passe",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),

                  focusColor: Colors.white,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,

                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width:  MediaQuery.of(context).size.width/1.4,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(204, 36, 44, 1),
            ),
            child: Center(child: Text('Connexion',
              style: TextStyle(color: Colors.white),
            )
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Managing()));
              },
              child: const Text('Est tu nouveau sur Daywatch?',style:
                TextStyle(
                  color: Color.fromRGBO(204, 36, 44, 1),
                ),)
          )
        ],
      ),
    );
  }
}
class Managing extends StatefulWidget {
  const Managing({Key? key}) : super(key: key);

  @override
  State<Managing> createState() => _ManagingState();
}

class _ManagingState extends State<Managing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Qui va suivre ?",style: TextStyle(
            color: Colors.white,
            fontSize: 30
          ),),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(204, 36, 44, 1),
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(204, 36, 44, 1),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(204, 36, 44, 1),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(204, 36, 44, 1),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
