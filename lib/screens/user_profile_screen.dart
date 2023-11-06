import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user?.photoURL ?? 'https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20),
            Text('Nombre: ${user?.displayName ?? 'alexander'}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Apellido: Navarro', style: TextStyle(fontSize: 18)), 
            SizedBox(height: 10),
            Text('Edad: 19', style: TextStyle(fontSize: 18)), 
            SizedBox(height: 10),
            Text('Carrera: Ingeniero de Sistemas', style: TextStyle(fontSize: 18)), 
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Cerrar sesión'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
