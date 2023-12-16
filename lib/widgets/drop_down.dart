import 'package:chat_bot/models/models_model.dart';
import 'package:chat_bot/services/api_service.dart';
import 'package:chat_bot/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/models_provider.dart';
//import '../models/models_model.dart';

class ModelsDrowDownWidget extends StatefulWidget {
  const ModelsDrowDownWidget({super.key});

  @override
  State<ModelsDrowDownWidget> createState() => _ModelsDrowDownWidget();
  }

  class _ModelsDrowDownWidget extends State<ModelsDrowDownWidget>{
  String? currentModel;
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context,listen: false);
    currentModel = modelsProvider.getCurrentModel;
    //final chatProvider = Provider.of<ChatProvider>(context);

    return FutureBuilder<List<ModelsModel>>(
        future: modelsProvider.getAllModels(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: TextWidget(label: snapshot.error.toString()),);
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink() :
              FittedBox(
              child :DropdownButton(
            dropdownColor: scaffoldBackgroundColor,
            iconEnabledColor: Colors.white,
            items: List<DropdownMenuItem<String>>.generate(
                snapshot.data!.length,
                (index) => DropdownMenuItem(
                 value: snapshot.data![index].id,
                 child: TextWidget(
                    label: snapshot.data![index].id,
                    fontSize: 15,
                    ))),
            value: currentModel,
            onChanged: (value) {
              setState(() {
                currentModel = value.toString();
              });
              modelsProvider.setCurrentModel(value.toString());
            },
          ));
        });
  }

}

/**DropdownButton(
dropdownColor: scaffoldBackgroundColor,
iconEnabledColor: Colors.white,
items: getModelsItem,
value: currentModel,
onChanged: (value){
setState(() {
currentModel = value.toString();
});
}
);**/