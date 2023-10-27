import 'package:flutter/material.dart';
import '../models/lost_item_model.dart';

class LostItemDetailsPage extends StatelessWidget {
  final LostItem item;

  const LostItemDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Objeto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.imageUrl != null) 
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    item.imageUrl!,
                    fit: BoxFit.cover,
                    height: 400.0, 
                    width: double.infinity,
                  ),
                ),
              ),

            const SizedBox(height: 16.0),

            // Para el nombre del objeto
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8.0),

            // Para la descripción del objeto
            Text(
              item.description,
              style: const TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 8.0),

            // Para la ubicación del objeto
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red),  // Icono de ubicación
                const SizedBox(width: 4.0),
                Expanded(
                  child: Text(
                    item.location,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8.0),

            // Para la fecha y hora en que se encontró
            if (item.timestamp != null) 
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey[500]), // Icono de tiempo
                  const SizedBox(width: 4.0),
                  Text(
                    "${item.timestamp!.day}/${item.timestamp!.month}/${item.timestamp!.year} ${item.timestamp!.hour}:${item.timestamp!.minute}",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 16.0),

            // Para el email del usuario que encontró el objeto
            Text(
              "Encontrado por: ${item.userEmail}",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
