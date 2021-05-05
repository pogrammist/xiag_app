import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xiag_app/domain/model/picture.dart';
import 'package:xiag_app/domain/state/home_state.dart';
import 'package:xiag_app/internal/dependencies/home_module.dart';

import 'viewer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeState _homeState;

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
    _homeState.getPictures();
  }

  @override
  void dispose() {
    _homeState.searchController.dispose();
    super.dispose();
  }

  void _showPicture({@required Picture picture}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Viewer(picture: picture),
      ),
    );
  }

  Widget _pictureListItem(BuildContext context, {Picture picture}) {
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => _showPicture(picture: picture),
      child: Row(
        children: [
          Container(
            height: width * 0.1,
            width: width * 0.1,
            child: Image.network(
              picture.urlTn,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: Image.asset(
                    "assets/gif/loading-opaque.gif",
                    width: width * 0.1,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  Text('Some errors occurred!'),
            ),
          ),
          SizedBox(width: 20),
          Expanded(child: Text(picture.name)),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _picturesList(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _homeState.pictures.isEmpty
            ? Text("No data")
            : ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (_, __) => Divider(),
                itemCount: _homeState.pictures.length,
                itemBuilder: (BuildContext context, int index) =>
                    _pictureListItem(
                  context,
                  picture: _homeState.pictures[index],
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Observer(
        builder: (BuildContext context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Xiag'),
          ),
          body: Center(
            child: _homeState.isLoading
                ? Image.asset(
                    "assets/gif/loading-opaque.gif",
                    width: width * 0.3,
                  )
                : _picturesList(context),
          ),
        ),
      ),
    );
  }
}
