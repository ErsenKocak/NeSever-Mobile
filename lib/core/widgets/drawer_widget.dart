import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DrawerHeader(
            // accountName: Text('Ersen Koçak',style: TextStyle(fontSize: 18.0),),
            // currentAccountPicture: Image.network(
            //     'https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-2-512.png'),
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: kPrimaryColor,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/user.png',
                    width: getProportionateScreenWidth(100),
                  ),
                  Text(
                    'Ersen Koçak',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // ListTile(
                //   leading: Icon(Icons.vibration),
                //   title: Text('Terminal'),
                //   onTap: () => navigate(context, '/terminal'),
                // ),
                ListTile(
                  leading: Icon(Icons.card_giftcard),
                  title: Text('Hediye Sepeti'),
                  onTap: () => navigate(context, '/gift-cart'),
                ),
                ListTile(
                  leading: Icon(Icons.supervised_user_circle),
                  title: Text('Arkadaşlar'),
                  onTap: () => navigate(context, '/friends'),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Fotoğraflar'),
                  onTap: () => navigate(context, '/photos'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Ayarlar'),
                  onTap: () => navigate(context, '/settings'),
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Çıkış Yap'),
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed('/signIn'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void navigate(BuildContext context, String url) {
  Navigator.pop(context);
  if (url != null) {
    Navigator.pushNamed(context, url);
  }
}
