import 'package:basreng/model/location_marker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SchoolMarkerBloc extends Bloc<SchoolMarkerEvent, SchoolMarkerState> {
  SchoolMarkerBloc() : super(SchoolMarkerState(markers: {})) {
    on<FetchAllSchoolMarkerEvent>((event, emit) async {
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

      emit(SchoolMarkerState(markers: markers));
    });
  }
}

class SchoolMarkerEvent {}
class FetchAllSchoolMarkerEvent extends SchoolMarkerEvent {}

class SchoolMarkerState {
  final Set<Marker> markers;

  SchoolMarkerState({required this.markers});
}
