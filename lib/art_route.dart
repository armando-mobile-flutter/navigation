import 'package:flutter/material.dart';
import './utils/art_util.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  static int _currentIndex = 0;
  ArtRoute({required this.art});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Choose your art",
                style: TextStyle(color: Colors.white70, fontSize: 24),
              ),
              decoration: BoxDecoration(
                  color: Colors.deepOrange[600],
                  image: DecorationImage(
                      image: NetworkImage("https://bit.ly/fly_shy"),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              title: Text(ArtUtils.CARAVAGGIO),
              trailing: Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtils.CARAVAGGIO),
            ),
            ListTile(
              title: Text(ArtUtils.MONET),
              trailing: Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtils.MONET),
            ),
            ListTile(
              title: Text(ArtUtils.VANGOGH),
              trailing: Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtils.VANGOGH),
            )
          ],
        )),
        appBar: AppBar(
          title: Text("Navigation Art"),
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(Icons.image),
              itemBuilder: (BuildContext context) => ArtUtils.MENU_ITEMS
                  .map((String item) =>
                      PopupMenuItem<String>(child: Text(item), value: item))
                  .toList(),
              onSelected: (value) => changeRoute(context, value),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(this.art), fit: BoxFit.cover)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.lime[900],
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: ArtUtils.CARAVAGGIO, icon: Icon(Icons.art_track)),
            BottomNavigationBarItem(
                label: ArtUtils.MONET, icon: Icon(Icons.art_track)),
            BottomNavigationBarItem(
                label: ArtUtils.VANGOGH, icon: Icon(Icons.art_track))
          ],
          onTap: (value) {
            _currentIndex = value;
            changeRoute(context, ArtUtils.MENU_ITEMS[value]);
          },
        ),
      );

  void changeRoute(BuildContext context, String item) {
    String image;

    switch (item) {
      case ArtUtils.CARAVAGGIO:
        image = ArtUtils.IMG_CARAVAGGIO;
        break;
      case ArtUtils.MONET:
        image = ArtUtils.IMG_MONET;
        break;
      case ArtUtils.VANGOGH:
        image = ArtUtils.IMG_VANGOGH;
        break;
      default:
        image = ArtUtils.IMG_CARAVAGGIO;
        break;
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ArtRoute(art: image)));
  }
}
