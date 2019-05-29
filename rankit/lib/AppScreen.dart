
import 'package:flutter/material.dart';


class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
 List<Widget> list = new List<Widget>();
onReorder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    Future.delayed(Duration(milliseconds: 20), () {   // Comment to reproduce issue
      setState(() {
        final Widget item = list.removeAt(oldIndex);
        list.insert(newIndex, item);
      });
    });                                               // Comment to reproduce issue
}

buildList() {
    for (var i = 1; i <= 2; i++) {
      list.add(Dismissible(
          key: (Key("Photo$i")),
          onDismissed: (direction) {
            setState(() {
              list.removeWhere((item) => item.key == Key("Photo$i"));
            });
          },
          background: Container(color: Color(0x444f63a2)),
          child: new SizedBox(
            width: double.infinity,
            height: 120,
            child: Center(
                child: 
                ListTile( 
                  leading: Card(      
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        'assets/images/Photo$i.jpg',
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 1,
                      margin: EdgeInsets.all(1),
                    ),
                  title: Text("Photo $i"),
                  subtitle: Text("Photo $i Details"),
                   trailing: Icon(Icons.keyboard_arrow_right),
                   onLongPress: () {
                    print('pressedd');
                  },
                  enabled: true,
                ),
            ),
          )));
    }
}

  @override
  Widget build(BuildContext context) {
    if (list.length < 1) {
      buildList();
}
    return  Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text("RankIT"),
        elevation: 0.0,
        backgroundColor: Colors.deepPurple[200],
        
      ),
      body: 
      Center(
        child:ReorderableListView(
          children: list,
          onReorder: (oldIndex, newIndex) {
            onReorder(oldIndex, newIndex);
          },
),),
    );
  }


}