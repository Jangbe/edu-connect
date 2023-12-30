import 'package:basreng/ui/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final User? user = FirebaseAuth.instance.currentUser;

  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _logOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Dashboard"),
          actions: [
            GestureDetector(
              onTap: _logOut,
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.logout),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Center(child: Text("User ID: ${user!.uid}")),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition:
                        CameraPosition(target: _center, zoom: 11)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
