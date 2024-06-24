import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSettings(),
            SizedBox(height: 20),
            BookUploadForm(),
          ],
        ),
      ),
    );
  }
}

class ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Edit Profile'),
              onTap: () {
                // Implement edit profile functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                // Implement change password functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BookUploadForm extends StatefulWidget {
  @override
  _BookUploadFormState createState() => _BookUploadFormState();
}

class _BookUploadFormState extends State<BookUploadForm> {
  File? _image;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _synopsisController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage != null ? File(pickedImage.path) : null;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _synopsisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload Book',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _image != null
                ? Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: FileImage(_image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: _getImage,
                    child: Text('Import Book Cover'),
                  ),
            SizedBox(height: 10),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Book Title',
                hintText: 'Enter book title',
              ),
              // Implement logic to handle book title input
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(
                labelText: 'Author',
                hintText: 'Enter author name',
              ),
              // Implement logic to handle author input
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _synopsisController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Synopsis',
                hintText: 'Enter book synopsis',
              ),
              // Implement logic to handle synopsis input
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to handle book upload
                String title = _titleController.text.trim();
                String author = _authorController.text.trim();
                String synopsis = _synopsisController.text.trim();
                // Perform upload logic using title, author, synopsis, and _image
                // Example: uploadBook(title, author, synopsis, _image);
                print('Uploaded: $title, $author, $synopsis');
              },
              child: Text('Upload Book'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Profile Page Demo',
    home: ProfilePage(),
  ));
}
