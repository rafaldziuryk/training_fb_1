import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageZero extends StatelessWidget {
  const PageZero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Future'),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('reports').get(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return SizedBox.shrink();
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return SizedBox.shrink();
            case ConnectionState.done:
              if (snapshot.hasData) {
                final QuerySnapshot data = snapshot.data as QuerySnapshot;
                return ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    final element = data.docs[index].data()! as Map;
                    return ListTile(
                      title: Text(element['title']),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error');
              } else {
                return SizedBox.shrink();
              }
          }
        },
      ),
    );
  }
}
