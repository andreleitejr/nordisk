import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nordisk/widgets/title_widget.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  final Completer<GoogleMapController> _mapController = Completer();
  late Set<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _markers = _createMarkers();
  }

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: const MarkerId('pharmacy1'),
        position: const LatLng(-23.561356, -46.656820),
        infoWindow: const InfoWindow(
          title: 'Farmácia Novo Bem Estar (Parceiro Novo Nordisk)',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
      Marker(
        markerId: const MarkerId('pharmacy2'),
        position: const LatLng(-23.5489, -46.6388),
        infoWindow: const InfoWindow(
          title: 'Drogaria Mais Saúde (Parceiro Novo Nordisk)',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
      Marker(
        markerId: const MarkerId('checkup1'),
        position: const LatLng(-23.5450, -46.6450),
        infoWindow: const InfoWindow(
          title: 'Centro de Saúde Municipal (Check-up Gratuito)',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
      Marker(
        markerId: const MarkerId('checkup2'),
        position: const LatLng(-23.5650, -46.6300),
        infoWindow: const InfoWindow(
          title: 'Unidade Básica de Saúde (Check-up Gratuito)',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: const SizedBox.shrink(),
        title: TitleWidget(title: 'Check-ups Próximos'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              if (!_mapController.isCompleted) {
                _mapController.complete(controller);
              }
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(-23.550520, -46.633308),
              zoom: 12,
            ),
            markers: _markers,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
          ),
          Positioned(
            top: 24,
            left: 24,
            right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Farmácias e Locais de Check-up Próximos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Atenção: Este mapa e os locais são apenas para fins ilustrativos.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
