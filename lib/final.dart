import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinalPage extends StatelessWidget {
  final Map profile;

  FinalPage(this.profile);

  Widget _buildRelationTile() {
    if (profile['married'] == true) {
      return ListTile(
        leading: Icon(Icons.done_all),
        title: Text('Status'),
        trailing: Text('Married'),
      );
    } else {
      return ListTile(
        leading: Icon(Icons.done),
        title: Text('Status'),
        trailing: Text('Not married'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              actions: <Widget>[
                IconButton(icon: Icon(Icons.edit), onPressed: null),
                IconButton(icon: Icon(Icons.more_vert), onPressed: null)
              ],
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text(
                      profile['name'].toString() +
                          "  " +
                          profile['surname'].toString(),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 21.0,
                      )),
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage("assets/image.jpeg"),
                            fit: BoxFit.cover)),
                  )),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.call),
              title: Text(profile['phone'].toString()),
              subtitle: Text("Mobile"),
              trailing: Icon(Icons.chat),
            ),
            ListTile(
              leading: Text(""),
              title: Text("(323)555-6789"),
              subtitle: Text("Work"),
              trailing: Icon(Icons.chat),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(profile['email']),
              subtitle: Text("Personal"),
            ),
            ListTile(
              leading: Text(""),
              title: Text(profile['email']),
              subtitle: Text("Work"),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                  DateFormat('yyyy.MM.dd').format(profile['birth']).toString()),
              subtitle: Text("B-date"),
            ),
            _buildRelationTile(),
          ],
        ),
      ),
    );
  }
}
