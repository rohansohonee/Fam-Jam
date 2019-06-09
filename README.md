# Fam Jam

Share your opinions with family members. 

Fam Jam creates family groups where you can put across your
- Opinions
- Ask questions
- Share photos/videos
- Message your grandparents
- Assign chores

All in one place, thus avoiding hassles of having a family group on WhatsApp where you might accidentally send a message to the wrong group!

## Screenshots
<p align=center>
<img src="/screenshots/1.png" width="250"> <img src="/screenshots/2.png" width="250" >  <img src="/screenshots/4.png" width="250"> <img src="/screenshots/3.png" width="250"> </p>

## Getting Started
```
NOTE:- This project has been tested and run on an Android device. The total size of main.dart is 5,078 bytes.
```
To install and run this project on your Android device:
1. Extract the ZIP file.
2. Open the extracted folder in Visual Studio Code.
3. Now run the following command into the terminal:
```
flutter run --release
```

For customising the AppBar, you can make changes to the following code:
```dart
Example:

_myAppBar(String text, bool centerTitle, TextTheme myCustomTextTheme) {
  return AppBar(
    centerTitle: centerTitle,     //toggle centerTitle
    title: Text(
      text,
      style: TextStyle(
        fontFamily: 'Lovelo',
        fontSize: 30.0,
      ),
    ),
    textTheme: myCustomTextTheme  //add a specific textTheme
  );
}
```

## Features
- Long Press on a FilterChip (opinion) deletes the chip.
- 'Add your opinion' text field adds a new FilterChip (opinion).

Created a custom Card Widget which contains image and a text.
```dart
_card(int index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              _images[index],
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 350,
            color: Colors.grey.shade700,
            child: Text(_groups[index]),
          ),
        ),
      ),
    );
  }
```

## Tips

To achieve smaller file size for dart code do the following:

- Seperate large and commonly used functions into their own individual method.
- Use ' => ' only when there is one line of code.
```dart
Example:

onPressed: () => _handleSubmitted(_textController.text)

//Using this ' => ' here will increase the size of your code
onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Opinions(),
                ),
              );
            }
```
- Reduce if else blocks by using ' ? : '.
```dart 
Example:

//Eliminates braces and is easy to follow
value ? _filters.add(opinion.name)
      : _filters.remove(opinion.name);
```
- Removing specific comma's from dart code can help reduce the size significantly.
```dart
Example:

//Smaller Main and still readable
void main() {
  runApp(MaterialApp(
    title: 'Fam Jam',
    theme: ThemeData(fontFamily: 'SpaceGrotesk', brightness: Brightness.dark),
    home: MyApp(),
  ));
}

//Added commas for even more readability, but increases the file size of dart code
void main() {
  runApp(
    MaterialApp(
      title: 'Fam Jam',
      theme: ThemeData(
        fontFamily: 'SpaceGrotesk',
        brightness: Brightness.dark,  //Added here
      ),
      home: MyApp(),
    ),                                //And here
  );
}
```

## Resources

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
