import 'package:flutter/material.dart';
import 'new_wersion.dart';

class HomePage extends StatefulWidget {
  static String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String localVersion = "";
  String storeVersion = "";

  @override
  void initState() {
    super.initState();
    final newVersion = NewVersion(
      iOSId: 'com.google.Vespa',
      androidId: 'net.giosis.shopping.sg',
    );
    _olish(newVersion);
  }

  Future _olish(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      setState(() {
        localVersion = status.localVersion;
        storeVersion = status.storeVersion;
      });
    }
  }

  bool _func() {
    List local = localVersion.split(".");
    List store = storeVersion.split(".");
    if (local.length == store.length) {
      for (int i = 0; i < local.length - 1; i++) {
        if (local[i] != store[i]) {
          return false;
        }
      }
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Instagram",
          style: TextStyle(fontFamily: 'Billabong', fontSize: 30),),
      ),
      body: ElevatedButton(
        onPressed: () {},
        child: _func() ?
        Text("Open") : Text("Update"),
      ),
    );
  }
}
