import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PendingOrderLocation extends StatefulWidget {
  PendingOrderLocation(
      {super.key, this.latitude, this.longitude, this.location});

  double? latitude;
  double? longitude;
  String? location;

  @override
  State<PendingOrderLocation> createState() => _PendingOrderLocationState();
}

class _PendingOrderLocationState extends State<PendingOrderLocation> {
  Set<Marker> markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(widget.latitude ?? 0, widget.longitude ?? 0),
        flat: false,
        consumeTapEvents: true,
        draggable: true,
        visible: true,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height,
                width: width,
                child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                        bearing: 192.8334901395799,
                        target:
                            LatLng(widget.latitude ?? 0, widget.longitude ?? 0),
                        tilt: 59.440717697143555,
                        zoom: 12),
                    zoomControlsEnabled: true,
                    indoorViewEnabled: true,
                    buildingsEnabled: false,
                    myLocationEnabled: true,
                    compassEnabled: true,
                    myLocationButtonEnabled: true,
                    rotateGesturesEnabled: true,
                    markers: markers),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
