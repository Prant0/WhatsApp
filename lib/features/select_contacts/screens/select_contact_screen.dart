import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/common/widgets/loader.dart';
import 'package:whatsapp_ui/features/select_contacts/controller/select_contact_controller.dart';

class SelectContactScreen extends ConsumerWidget {
  const SelectContactScreen({Key? key}) : super(key: key);
  static const String routeName = "selectContact";

  void selectContact(WidgetRef ref,BuildContext context,Contact selectContact){
    ref.read(selectContactControllerProvider).selectContact(selectContact, context);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select contact'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: ref.watch(getContactProvider).when(
          data: (contactList) {
            return ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {

              final contact=contactList[index];
              return InkWell(
               onTap:() =>selectContact(ref,context,contact),

                child: Padding(
                  padding:EdgeInsets.only(bottom: 8,left: 20),
                  child: ListTile(

                    leading:contact.photo!=null? CircleAvatar(
                      radius: 20,
                      backgroundImage: MemoryImage(contact.photo!),
                    ):null,
                    title:Text( "${contact.displayName}"   ) ,
                  ),
                ),
              )  ;
            });
          },
          error: (err,trace)=>ErrorScreen(error: err.toString()),
          loading: ()=>Loader()),
    );
  }


}
