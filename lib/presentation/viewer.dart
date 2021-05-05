import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xiag_app/domain/model/picture.dart';
import 'package:xiag_app/domain/state/viewer_state.dart';
import 'package:xiag_app/internal/dependencies/viewer_module.dart';

class Viewer extends StatefulWidget {
  final Picture picture;

  Viewer({Key key, @required this.picture}) : super(key: key);

  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  ViewerState _viewerState;

  @override
  void initState() {
    super.initState();
    _viewerState = ViewerModule.viewerState();
    _viewerState.picture = widget.picture;
    _viewerState.getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Observer(
      builder: (BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("${widget.picture.name}"),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: _viewerState.sendMail,
                  child: Icon(Icons.email),
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Text(_viewerState.batteryLevel),
              Center(
                child: Image.network(
                  widget.picture.url,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                        child: Image.asset(
                      "assets/gif/loading-opaque.gif",
                      width: width * 0.3,
                    ));
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      Text('Some errors occurred!'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
