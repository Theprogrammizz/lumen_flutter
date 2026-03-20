import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumen_flutter/providers/database_provider.dart';
import 'package:lumen_flutter/screens/home_screen.dart';

class NameScreen extends ConsumerWidget {
 NameScreen({super.key});


  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Your Name"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Identity Check!"),
          Text("The world is a big place. Who are you in it?"),

          SizedBox(height: 20,),

          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hint: Text("Your awesome name goes here")
            ),
          ),
          SizedBox(height: 20,),

          ElevatedButton(onPressed: () async{
            final name = _nameController.text.trim();
            if (name.isEmpty) return;
            ref.read(dbProvider).createUser(name);
            ref.read(dbProvider);
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
          }, child: Text("Thats me!"))
        ],
      ),
    );
  }
}