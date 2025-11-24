// features/tasks/presentation/screens/tasks_desktop_layout.dart
import 'package:flutter/material.dart';
import 'package:lodgitech/core/herlper/spacing.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/core/widgets/custom_container.dart';
import 'package:lodgitech/core/widgets/header_of_screen.dart';
import 'package:lodgitech/features/task_management/data/models/task.dart';
import 'package:lodgitech/features/task_management/presentation/widgets/task_card.dart';
import 'package:lodgitech/features/task_management/presentation/widgets/task_form.dart';
class TasksDesktopLayout extends StatefulWidget {
  const TasksDesktopLayout({super.key});

  @override
  State<TasksDesktopLayout> createState() => _TasksDesktopLayoutState();
}

class _TasksDesktopLayoutState extends State<TasksDesktopLayout> {
  final List<Task> _tasks = [
    Task(
      id: "1",
      employeeId: "EMP001",
      type: "Cleaning",
      roomNumber: "101",
      description: "Clean room and change bed sheets",
      createdAt: DateTime(2024, 1, 15, 10, 30),
      isCompleted: true,
    ),
    Task(
      id: "2",
      employeeId: "EMP002",
      type: "Maintenance",
      roomNumber: "205",
      description: "Fix leaking faucet in bathroom",
      createdAt: DateTime(2024, 1, 15, 14, 20),
      isCompleted: false,
    ),
    Task(
      id: "3",
      employeeId: "EMP003",
      type: "Room Service",
      roomNumber: "310",
      description: "Deliver extra pillows and towels",
      createdAt: DateTime(2024, 1, 15, 16, 45),
      isCompleted: false,
    ),
  ];

  void _addTask(Task task) {
    setState(() {
      _tasks.insert(0, task); // Add to beginning of list
    });
  }

  void _deleteTask(String taskId) {
    setState(() {
      _tasks.removeWhere((task) => task.id == taskId);
    });
  }

  void _toggleTaskCompletion(String taskId) {
    setState(() {
      final index = _tasks.indexWhere((task) => task.id == taskId);
      if (index != -1) {
        final task = _tasks[index];
        _tasks[index] = task.copyWith(isCompleted: !task.isCompleted);
      }
    });
  }

  int get _completedTasksCount {
    return _tasks.where((task) => task.isCompleted).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HeaderOfScreen(titleOfScreen: "Task Management"),
          ),
          SliverToBoxAdapter(child: verticalSpace(16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomContainer(
                child: TaskForm(
                  onSubmit: _addTask,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Assigned Tasks (${_tasks.length})",
                          style: AppStyles.semiBold14Black(context),
                        ),
                        const SizedBox(width: 8),
                        if (_tasks.isNotEmpty)
                          Text(
                            "($_completedTasksCount completed)",
                            style: AppStyles.light12Black(context).copyWith(
                              color: Colors.green,
                            ),
                          ),
                      ],
                    ),
                    Text(
                      "Manage employee tasks and assignments",
                      style: AppStyles.light12Black(context).copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    verticalSpace(16),
                    if (_tasks.isEmpty)
                      const Center(
                        child: Column(
                          children: [
                            Icon(Icons.assignment_outlined, 
                                size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text(
                              "No tasks assigned yet",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    else
                      Column(
                        children: _tasks.map((task) => TaskCard(
                          task: task,
                          onDelete: () => _deleteTask(task.id),
                          onToggleComplete: () => _toggleTaskCompletion(task.id),
                        )).toList(),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}