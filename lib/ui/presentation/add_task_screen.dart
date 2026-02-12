import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/ui/providers/task_provider.dart';
import 'package:task_tracker/ui/widgets/appBar/app_bar_task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTask(title: 'Add a task'),
      body: _TaskForm(),
    );
  }
}

class _TaskForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = context.read<TaskProvider>();
    final textControllerTitle = TextEditingController();
    final textControllerDesc = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _CustomFormFieldAdd(
                        text: 'Título de la tarea',
                        controller: textControllerTitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa un título';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      _CustomFormFieldAdd(
                        text: 'Descripción de la tarea',
                        controller: textControllerDesc,
                      ),
                      SizedBox(height: 20.0),
                      Center(
                        child: _AddTextButton(
                          textControllerTitle: textControllerTitle,
                          textControllerDesc: textControllerDesc,
                          taskProvider: taskProvider,
                          formKey: formKey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomFormFieldAdd extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const _CustomFormFieldAdd({
    required this.text,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        decoration: InputDecoration(hintText: text, labelText: text),
        controller: controller,
        validator: validator,
      ),
    );
  }
}

class _AddTextButton extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final TaskProvider _taskProvider;
  final TextEditingController _textControllerTitle;
  final TextEditingController _textControllerDesc;

  const _AddTextButton({
    required TextEditingController textControllerTitle,
    required TextEditingController textControllerDesc,
    required TaskProvider taskProvider,
    required GlobalKey<FormState> formKey,
  }) : _textControllerDesc = textControllerDesc,
       _textControllerTitle = textControllerTitle,
       _taskProvider = taskProvider,
       _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final title = _textControllerTitle.value.text;
          final desc = _textControllerDesc.value.text;
          _taskProvider.addTask(title, desc);
          Navigator.of(context).pop();
        }
      },
      child: const Text('Agregar tarea'),
    );
  }
}
