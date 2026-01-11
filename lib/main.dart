import 'package:flutter/material.dart';

void main() {
  runApp(EvernoteClone());
}

class EvernoteClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evernote Clone',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatelessWidget {
  final List<Map<String, String>> notes = [
    {"title": "Eslatma 1", "content": "Bu birinchi eslatmadir."},
    {"title": "Eslatma 2", "content": "Bu ikkinchi eslatmadir."},
    {"title": "Eslatma 3", "content": "Bu uchinchi eslatmadir."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evernote'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Qidiruv funksiyasi
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(
            title: notes[index]['title']!,
            content: notes[index]['content']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteDetailScreen(
                    title: notes[index]['title']!,
                    content: notes[index]['content']!,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateNoteScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onTap;

  NoteCard({required this.title, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
        onTap: onTap,
      ),
    );
  }
}

class NoteDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  NoteDetailScreen({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(content),
      ),
    );
  }
}

class CreateNoteScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yangi Eslatma'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Eslatma Sarlavhasi'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: 'Eslatma Mazzmuni'),
              maxLines: 5,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Eslatma qo'shish logikasi (saqlash va qaytish)
                Navigator.pop(context);
              },
              child: Text('Saqlash'),
            ),
          ],
        ),
      ),
    );
  }
}
