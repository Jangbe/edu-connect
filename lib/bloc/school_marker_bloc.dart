import 'package:basreng/model/location_marker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

class SchoolMarkerBloc extends Bloc<SchoolMarkerEvent, SchoolMarkerState> {
  SchoolMarkerBloc() : super(SchoolMarkerState(markers: [])) {
    on<FetchAllSchoolMarkerEvent>((event, emit) async {
      final results = await LocationMarker.findAll();

      emit(SchoolMarkerState(markers: results));
    });

    on<GetPlacemarkSchoolEvent>((event, emit) async {
      final placemarks = await placemarkFromCoordinates(event.lat, event.long);
      final state = SchoolMarkerState(markers: []);
      if (placemarks.isNotEmpty) {
        state.placemark = placemarks[0];
      }

      emit(state);
    });
  }
}

class SchoolMarkerEvent {}

class FetchAllSchoolMarkerEvent extends SchoolMarkerEvent {}

class GetPlacemarkSchoolEvent extends SchoolMarkerEvent {
  final double lat;
  final double long;

  GetPlacemarkSchoolEvent({
    required this.lat,
    required this.long,
  });
}

class SchoolMarkerState {
  final List<LocationMarker> markers;
  Placemark? placemark;

  SchoolMarkerState({required this.markers});
}
