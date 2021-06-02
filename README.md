# animal_adoption_app

A Flutter project named Cuddler. 
Cuddler allows users to connect with their fur-ever pets by viewing profiles, adding liked pets to a user list, and storing session information when they log in and out. Users can also list a pet for adoption into the database so that animals can be united with their human parents sooner. 
Brandon Mai
Sariah Bunnell
Hillary Miniken

## How To Use

To run the app, you will need either a physical android device or an android virtual device. If you have a physical device, and do not have Android Studio and the Android SDK already installed, it is recommended that you use the physical device. 
Run APK on Android Virtual Device
To run the app on a virtual android device, you will need Android Studio and the Android SDK tools. To set these up, please follow these steps: https://developer.android.com/studio/install

Once the Android Virtual Device is installed and running: 
Go to the following link and download the SDK. 
https://github.com/hminiken/Animal-Adoption-App/
To install an APK file on the emulated device, drag an APK file onto the emulator screen. An APK Installer dialog appears. When the installation completes, you can view the app in your apps list.
For more information on running the app from the SDK, please see https://developer.android.com/studio/run/emulator
Sideload onto Physical Android Device: 
Plug an android device into a computer. 
Move the file “app-release.apk” into the phones internal storage
File can be found at: https://github.com/hminiken/Animal-Adoption-App/blob/hillary-branch/app-release.apk

On the android device, open the Files app. You may have to allow files from the device. Follow the prompts from the phone:

Navigate to the location of the file, for example, the “App” folder and the “APK” tab. 
Choose the file “app-release.apk” from the list. It may ask you to trust this file. Choose yes and/or install anyway.


Once the app is installed, navigate to it in your list of installed apps. 

Examine and Play with the Project: 
After opening app, type in username and password to login
Username: gobb@gmail.com
Password: 123456


Choose from the four possible options
List a pet: enter pet information in a form to upload a new pet to the database.
Adopt a Pet: Set your location and browse pets
Daily Feed: Examine the app news feed
Select the user icon in the upper right corner: Go to the User Profile page. 
If you are an admin, there will be a floating action button giving you extra navigation.
Admin Username:
hunter@gmail.com
Password: hunter






List a Pet:
Enter information for each field as required. All fields are mandatory. 
Upload Photo of a pet. 
Click “Upload your Pet”. You will be navigated back to the landing page. 
In addition to the information manually entered, the app will post to the database the id of the user who submitted the pet, as well as the date posited (in seconds since Epoch). This allows for users to see the pets they’ve listed and for users to browse pets based on date. 


Adopt a Pet: 
Users will be navigated to the select location page. 
Use My Current Location is not yet implemented
Choose a state from the drop down menu
Select “Find My Next Pet”
Users will be navigated to the pet brows page. On the top of the page is the three categories of pets: Dogs, Cats, Other
If the tab is Other, Breeds will be the most common types of other pets.
Selecting a pet will open more information on the pet. 




Daily Feed:


 

User Profile:
From the user profile screen, you have 5 available options:
View My Listed Pets - view a list of all pets, separated by category, that you have posted to the app. 
Edit My Information - Go to a form to update your information, including display name and profile picture
Email Preferences - a beta feature that allows a user to update how often they would like to receive emails. 
About Cuddler - Get some information about the app, leave a review on google play (beta), or send us an email (beta)
Log Out - Sign out of the app



View My Listed Pets: 
Similar to browsing for a pet to adopt, the user will be shown a list of pets with three tabs to separate by category - dogs, cats, and other. These pets are only the ones listed by the user, however. If the user has no pets, the screen will be blank. 

Clicking on a pet brings up the Update Status screen. Here the user can change the status of the pet to one of the available options of “Available”, “Pending”, “Not Available”, or “Adopted”. Updating to “Adopted” will remove the pet from the database, an action which cannot be undone. 

Clicking on the “edit” pencil to the right will allow the user to update information about the pet, including the pets name, description, profile picture, and other fields available during the pet listing page. 

 
Update My Information: 


 

Beta Features - Update Email Preferences, About Cuddler, Favorites List, and Password Recovery: 


Admin Features - Update and Delete All Other Accounts:

App Requirements: 
From the original project page, the requirements, and the way in which they were met, are as follows: 
https://eecs.oregonstate.edu/capstone/submission/pages/viewSingleProject.php?id=g3Y16iyxGGeDewQE
Requirements: 
Accounts and login. Admin and public accounts.
Upon opening the app, the user is prompted to login or create an account. Admin accounts already exist (for the dev team), and admin accounts can make newly created accounts admins, if desired. 
Admin accounts have the ability to:
Edit or delete any other account or pet profile
Post news to every user’s daily feed. 
Shelter needs to be able to create new "dating" profiles, with type of animal, breed, disposition, pic, availability, news item, and description.
Choosing “List a Pet” allows the user to upload a pet with all of the required information. A news item is automatically generated if the user selects the opt-in checkbox at the bottom of the form. 
Users can browse profiles to find a pet, or search by type, breed, disposition, or date created.
By choosing “Adopt a Pet” and entering a location, the user will be presented with a list of all pets in that state, separated by category. At the top of the page are options to filter by breed, disposition, and date created. 
Animal types include dog and cat plus "other".
When uploading a pet, user must select from a dropdown list containing “Cat”, “Dog” or “Other”
When browsing, there are three tabs at the top of the page with these three categories.
Breeds shall be the most common ones plus "other".
When selecting a category, either on the list page or browse page, the user is presented with another dropdown that contains the most popular breeds. 
For dogs, this was obtained from the American Kennel Club. 
For cats, the list was from the website https://www.thesprucepets.com/personalities-of-popular-cat-breeds-554219
For others, the list was obtained from the website https://www.insider.com/most-popular-pets-in-the-us-2018-7
Dispositions are checkboxes that include "Good with other animals", "Good with children", "Animal must be leashed at all times".
When listing a pet, the user has the option to select from these three checkboxes
Availability includes "Not Available", "Available", "Pending", "Adopted"
When an animal is posted, the status is automatically “Available”
The user who posted the animal can go to the user menu, select their listed pet, and update the status to any of these listed options. 
Profiles can be removed when the animal is picked up.
If the user who listed the pet changes the status to “Adopted”, the app will remove that pet from the database. It will no longer appear to the user or on the browse page. This action cannot be undone. 
App/website should have a landing page.
After logging in, the user is redirected to a landing page with the options to list a pet, find a pet, look at their daily feed, or go to their user settings. 

Stretch Requirements: 
Website needs to be responsive (viewable on desktop or mobile).
The app is set up to work in both vertical and horizontal orientations. The layout is optimized for Pixel 2 XL and screens of similar sizes. Older phones with smaller screens may run into layout issues. 
Daily feed on app or website landing page offers the latest status updates on animals. "News Item" is just a news/PR blurb. Update it to send current news and the image of animal to the Daily news feed queue (stretch requirement)
By selecting “Daily Feed” from the landing page, the user is given a list of all news updates since the last time they logged in. The user may swipe to dismiss any news they no longer wish to see. Currently, the news only informs users of updates - it does not display a profile image or redirect to more information about the pet. 
Admin users may also post news updates to all users’ news feeds. 
Set email preferences
In the user profile page, the user can select “Update Email Preferences”. This opens a page with checkboxes to receive emails Daily, Weekly, or Never. This updates the users preferences, but as the feature is in beta, no emails are actually sent. 
 
Sources To Thank:
Pet Shop by supalerk laipawat from the Noun Project

Heart by allex from the Noun Project

profile by Rahmat Hidayat from the Noun Project

Rabbit by Sumana Chamrunworakiat from the Noun Project

https://medium.com/firebase-tips-tricks/how-to-use-firebase-queries-in-flutter-361f21005467

https://petercoding.com/firebase/2020/02/16/using-firebase-queries-in-flutter/

https://github.com/dgewe/Tinder-App-Flutter/tree/main/lib

https://github.com/loydkim/Dating_App_Main

dart format bin lib
