import 'package:basreng/model/location_marker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolMarkerBloc extends Bloc<SchoolMarkerEvent, SchoolMarkerState> {
  SchoolMarkerBloc() : super(SchoolMarkerState(markers: [])) {
    on<FetchAllSchoolMarkerEvent>((event, emit) async {
      final results = await LocationMarker.findAll();

      emit(SchoolMarkerState(markers: results));
    });
  }
}

class SchoolMarkerEvent {}
class FetchAllSchoolMarkerEvent extends SchoolMarkerEvent {}

class SchoolMarkerState {
  final List<LocationMarker> markers;

  SchoolMarkerState({required this.markers});
}
