import 'package:productivity_app/utils/headers.dart';

class EditTaskPage extends StatelessWidget {
  final Task task;

  EditTaskPage({super.key, required this.task});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = task.title;
    descriptionController.text = task.description;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Task'),
            backgroundColor: Colors.blueAccent,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  themeProvider.isCupertino
                      ? Colors.blue.shade100
                      : Colors.grey.shade900,
                  themeProvider.isCupertino
                      ? Colors.blue.shade200
                      : Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Task Title',
                    labelStyle: TextStyle(
                      color: themeProvider.isCupertino
                          ? Colors.black
                          : Colors.white70,
                    ),
                    filled: true,
                    fillColor: themeProvider.isCupertino
                        ? Colors.white
                        : Colors.grey.shade800,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Task Description',
                    labelStyle: TextStyle(
                      color: themeProvider.isCupertino
                          ? Colors.black
                          : Colors.white70,
                    ),
                    filled: true,
                    fillColor: themeProvider.isCupertino
                        ? Colors.white
                        : Colors.grey.shade800,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (titleController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty) {
                      Provider.of<TaskProvider>(context, listen: false)
                          .updateTask(
                        task.copyWith(
                          title: titleController.text,
                          description: descriptionController.text,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade300,
                          Colors.blue.shade600,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                    child: const Center(
                      child: Text(
                        'Update Task',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
