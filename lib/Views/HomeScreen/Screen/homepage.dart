import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../Model/contactmodel.dart' as model;
import '../../../Helper/database.dart';
import 'addcontact.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<model.Contact> contacts = [];
  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    final loadedContacts = await dbHelper.getContacts();
    setState(() {
      contacts.addAll(loadedContacts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Contact"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => const addContact(),
          );
          if (result != null) {
            setState(() {
              contacts.add(result);
              dbHelper.insertContact(result);
            });
          }
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            elevation: 3,
            child: ListTile(
              title: Text("${contact.firstName} ${contact.lastName}"),
              subtitle: Text(contact.phoneNumber),
              leading: const Icon(
                Icons.person,
                size: 45,
              ),
              trailing: const Icon(
                Icons.backup,
                size: 35,
              ),
            ),
          );
        },
      ),
    );
  }
}
