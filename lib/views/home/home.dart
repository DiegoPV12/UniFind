import 'package:flutter/material.dart';
import 'package:unifind/views/lost_item/lost_item_form_controller.dart';
import 'package:unifind/views/lost_item/lost_item_page.dart';
import 'package:unifind/screens/user_profile_screen.dart'; // Importa la pantalla de perfil de usuario

import '../../models/lost_item_model.dart';
import '../../widgets/lost_item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LostItem> items = [];
  final LostItemFormController _repository = LostItemFormController();

  @override
  void initState() {
    super.initState();
    _loadLostItems();
  }

  Stream<List<LostItem>> _loadLostItems() {
    return _repository.fetchLostItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LostItemForm()));
        },
        backgroundColor: const Color.fromRGBO(129, 40, 75, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text('Objetos Reportados'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserProfileScreen()));
            },
          ),
        ],
      ),
      body: StreamBuilder<List<LostItem>>(
        stream: _loadLostItems(),
        builder: (BuildContext context, AsyncSnapshot<List<LostItem>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = snapshot.data![index];
                  return LostItemCard(
                    item: item,
                    onTap: () {},
                  );
                },
              );
          }
        },
      ),
    );
  }
}
