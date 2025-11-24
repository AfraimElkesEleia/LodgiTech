import 'package:flutter/material.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_drop_down_menu.dart';
import 'package:lodgitech/core/widgets/custom_text_field.dart';
import 'package:lodgitech/features/task_management/data/models/task.dart';
import 'package:lodgitech/features/task_management/presentation/widgets/add_task_button.dart';

class TaskForm extends StatefulWidget {
  final Function(Task) onSubmit;

  const TaskForm({super.key, required this.onSubmit});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _employeeIdController = TextEditingController();
  final _roomNumberController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedType = 'Cleaning';

  final List<String> _taskTypes = [
    'Cleaning',
    'Maintenance',
    'Room Service',
    'Laundry',
    'Security',
    'Guest Assistance',
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final task = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        employeeId: _employeeIdController.text.trim(),
        type: _selectedType,
        roomNumber: _roomNumberController.text.trim(),
        description: _descriptionController.text.trim(),
        createdAt: DateTime.now(),
      );

      widget.onSubmit(task);

      _employeeIdController.clear();
      _roomNumberController.clear();
      _descriptionController.clear();
      setState(() {
        _selectedType = 'Cleaning';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add New Task", style: AppStyles.semiBold14Black(context)),
          const SizedBox(height: 16),
          if (MediaQuery.sizeOf(context).width > 1300)
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: employeeIdField()),
                const SizedBox(width: 16),
                Expanded(child: typeOfTask()),
                const SizedBox(width: 16),
                Expanded(child: roomNo()),
              ],
            )
          else
            Column(
              children: [
                employeeIdField(),
                const SizedBox(height: 16),
                typeOfTask(),
                const SizedBox(height: 16),
                roomNo(),
              ],
            ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _descriptionController,
            label: "Task Description",
            hintText: "Task Description",
            maxLines: 2,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter task description';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: AddTaskButton(
              text: "Add Task",
              onPressed: _submitForm,
              width: 120,
            ),
          ),
        ],
      ),
    );
  }

  Widget roomNo() {
    return CustomTextField(
      controller: _roomNumberController,
      label: "Room Number",
      hintText: "Room Number",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter room number';
        }
        return null;
      },
    );
  }

  Widget typeOfTask() {
    return StringDropDownMenu(
      width: double.infinity,
      items: _taskTypes,
      onSelected: (value) {
        setState(() {
          _selectedType = value!;
        });
      },
    );
  }

  Widget employeeIdField() {
    return CustomTextField(
      controller: _employeeIdController,
      label: "Employee ID",
      hintText: "ID",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter employee ID';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _employeeIdController.dispose();
    _roomNumberController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
