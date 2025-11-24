import 'package:flutter/material.dart';
import 'package:lodgitech/core/utilities/app_styles.dart';
import 'package:lodgitech/features/task_management/data/models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onToggleComplete;

  const TaskCard({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onToggleComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Completion Checkbox
            IconButton(
              onPressed: onToggleComplete,
              icon: Icon(
                task.isCompleted
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: task.isCompleted ? Colors.green : Colors.grey,
                size: 24,
              ),
            ),

            // Task Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Employee: ${task.employeeId}",
                        style: AppStyles.semiBold14Black(context),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getTaskTypeColor(task.type),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          task.type,
                          style: AppStyles.semiBold14Black(context).copyWith(fontSize: 12,color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Room: ${task.roomNumber}",
                    style: AppStyles.extraLight14Grey(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task.description,
                    style: AppStyles.light12Black(
                      context,
                    ).copyWith(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Created: ${_formatDate(task.createdAt)}",
                    style: AppStyles.light12Black(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Delete Button
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTaskTypeColor(String type) {
    switch (type) {
      case 'Cleaning':
        return Colors.blue;
      case 'Maintenance':
        return Colors.orange;
      case 'Room Service':
        return Colors.green;
      case 'Laundry':
        return Colors.purple;
      case 'Security':
        return Colors.red;
      case 'Guest Assistance':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }
}
