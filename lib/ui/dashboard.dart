import 'package:basreng/model/location_marker.dart';
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
  final LatLng _center = const LatLng(0.7893, 113.9213);

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final results = await LocationMarker.findAll();
      final markers = results.map(
        (e) => Marker(
          markerId: MarkerId(e.name),
          position: LatLng(
            double.parse(e.lat),
            double.parse(e.long),
          ),
        ),
      ).toSet();

      setState(() {
        _markers = markers;
      });
    });
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
            Center(
              child: Text("User ID: ${user!.uid}"),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 4,
                  ),
                  markers: _markers,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
