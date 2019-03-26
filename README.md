# Fam Jam

Share your opinions with family members.


## Getting Started

This project has been tested and run on an Android device.

#### The total size of main.dart is < 5 KB.

- To install and run this project on your Android device, enter the following command into the terminal:
```
flutter run --release
```

- For customising the AppBar, you can make changes to the following code:
```dart
_myAppBar(String text) {
  return AppBar(
    centerTitle: true,
    title: Text(
      text,
      style: TextStyle(
        fontFamily: 'Lovelo',
        fontSize: 30.0,
      ),
    ),
  );
}
```

- Example
```dart
_myAppBar(String text, bool centerTitle, TextTheme myCustomTextTheme) {
  return AppBar(
    centerTitle: centerTitle,     //change the position of AppBar Title 
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
- Created a custom Card Widget which contains image and a text.
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
    theme: ThemeData(fontFamily: 'SpaceGrotesk', brightness: Brightness.dark),
    home: MyApp(),
  ));
}

//Added commas for even more readability, but increases the file size of dart code
void main() {
  runApp(
    MaterialApp(
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
