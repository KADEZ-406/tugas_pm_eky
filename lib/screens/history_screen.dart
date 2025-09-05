import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_item.dart';
import '../models/todo.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Todo'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          final completedTodos = todoProvider.completedTodos;
          
          if (completedTodos.isEmpty) {
            return const _HistoryEmptyState();
          }

          return ListView.builder(
            itemCount: completedTodos.length,
            itemBuilder: (context, index) {
              final todo = completedTodos[index];
              return TodoItem(
                todo: todo,
                onToggle: () => todoProvider.toggleTodo(todo.id),
                onDelete: () => _showDeleteDialog(context, todo),
                onEdit: () => _showEditDialog(context, todo),
              );
            },
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, Todo todo) {
    final controller = TextEditingController(text: todo.title);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Todo'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Masukkan judul todo',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                context.read<TodoProvider>().updateTodo(todo.id, controller.text);
                Navigator.pop(context);
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Todo todo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Todo'),
        content: Text('Apakah Anda yakin ingin menghapus "${todo.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              context.read<TodoProvider>().deleteTodo(todo.id);
              Navigator.pop(context);
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _HistoryEmptyState extends StatelessWidget {
  const _HistoryEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.history_toggle_off_rounded, size: 88, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Belum ada todo yang selesai',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
            ),
            SizedBox(height: 6),
            Text(
              'Tandai tugas Anda selesai untuk melihat riwayat di sini.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
