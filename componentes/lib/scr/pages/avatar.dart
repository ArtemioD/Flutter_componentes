import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/photos/portrait-of-mature-hispanic-man-picture-id805012064?b=1&k=6&m=805012064&s=612x612&w=0&h=3fUGncaOWP7n-1ZrpmKtorvfjvkU9LehKCFtYGmdkwA='),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('CL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://media.istockphoto.com/photos/portrait-of-mature-hispanic-man-picture-id805012064?b=1&k=6&m=805012064&s=612x612&w=0&h=3fUGncaOWP7n-1ZrpmKtorvfjvkU9LehKCFtYGmdkwA='),
          placeholder: AssetImage(
              'assets/jar-loading.gif'), // imagen por defecto mientras carge el otro
          fadeInDuration:
              Duration(milliseconds: 200), // velosidad de cargar la imagen
        ),
      ),
    );
  }
}
