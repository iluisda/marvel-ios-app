# Marvel iOS App
![Marvel logo from vecteezy](https://static.vecteezy.com/system/resources/previews/020/336/410/non_2x/marvel-logo-marvel-icon-free-free-vector.jpg "Marvel logo from vecteezy")

## Description
The Marvel iOS app allows users to explore characters from the Marvel Universe using the official Marvel API. Users can view a list of characters, save their favorites, delete characters from their favorites list, view details of each character, and search for characters by name.

## Features
- List Marvel characters from the Marvel API.
- Save favorite characters.
- Delete characters from favorites.
- View detailed information about each character.
- Search for characters by name.

## Technologies
- Swift: The primary programming language for iOS development.
- SwiftUI: Declarative framework for building user interfaces.
- Marvel API: Official API provided by Marvel for accessing Marvel Universe data.
- Swift Data: A lightweight and simple persistence framework for managing data locally in Swift applications.

## Screens
1. Character List Screen:
   - Displays a list of Marvel characters fetched from the Marvel API.
   - Allows users to tap on a character to view more details.
   - Provides options to save characters to favorites.

2. Character Details Screen:
   - Shows detailed information about a selected character, including name, description, and image.
   - Allows users to add or remove the character from their favorites list.

3. Favorites Screen:
   - Displays a list of characters marked as favorites by the user.
   - Allows users to delete characters from their favorites list.

4. Search Screen:
   - Provides a search bar for users to enter character names.
   - Displays search results matching the entered name.

## Folder Structure
- **Models**: Contains the data models representing Marvel characters and favorites.
- **Views**: SwiftUI view components for various screens.
- **ViewModels**: Holds the logic to fetch and manage data for the views.
- **Networking**: Handles API requests and responses.
- **Persistence**: Manages local data storage and operations for saving favorites using Swift Data.

## Additional Notes
- Authentication: The app will require authentication with the Marvel API using API keys for accessing Marvel character data.
- Error Handling: Implement robust error handling for network requests, parsing responses, and managing data.
- User Experience: Focus on providing an intuitive and seamless user experience with smooth navigation and feedback.

