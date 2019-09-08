import 'package:flutter/material.dart';
import '../models/item_model.dart';

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final Result result = ModalRoute.of(context).settings.arguments;

    return new WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              title: Text(result.title),
            ),
            body: new ListView(
              children: <Widget>[
                new Image.network(
                    "https://image.tmdb.org/t/p/w500/" + result.backdrop_path),
                new Container(
                  padding:
                      const EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: new Text(
                              "Original Name: " + result.original_title,
                              style: new TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          new Text(
                            "Release Date: " + result.release_date,
                            style: new TextStyle(color: Colors.green[500]),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: new Row(
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Icon(
                            Icons.star,
                            color: Colors.red[500],
                          ),
                        ],
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            '${result.vote_average}',
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                new Container(
                  padding:
                      const EdgeInsets.only(left: 32.0, right: 32.0, top: 8.0),
                  child: new Text(
                    result.overview,
                    softWrap: true,
                  ),
                )
              ],
            )),
        onWillPop: () {
          return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: new Text('Yes'),
                ),
              ],
            ),
          );
        });
  }
}
