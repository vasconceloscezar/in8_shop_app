# IN8 Shop
[🇧🇷 Check this Readme in pt-BR](./README-pt_BR.md);

An E-Commerce Storefront App that consumes the [E-Commerce-API](https://github.com/vasconceloscezar/e-commerce-api) to fetch products and control user login. 
![Landing Page](https://user-images.githubusercontent.com/97035956/217627728-c5aed821-a613-4169-8f95-9b08e1c48281.png)


## Table of Contents

- [Project Setup](#project-setup)
- [Project Decisions](#project-decisions)
- [Project Dependencies](#project-dependencies)

## How to run this project <a name="project-setup">
You first need to be sure to have Flutter and all it's dependencies installed. [Here in Flutter Docs](https://docs.flutter.dev/get-started/install) you can follow the steps. 

After, select a device to run on any emulator or your own, clone this repo, and in the terminal run: 

```shell
flutter run
```



## Project Decisions <a name="project-decisions"></a>
To kickstart the project, I'm using [this repo](https://github.com/abuanwar072/E-commerce-Complete-Flutter-UI) as a boilerplate.

The boilerplate provides a Splash screen a Home Screen and a Cart Screen, but all of them lacks funcionality. 


___
## Some [Providers](./providers/) were created: 
### UserProvider 
Stores user data after login, as well as the access token for requests. 
### CartProvider 
Contains all the logic related to adding/removing products to the cart, as well as purchasing the products. 
### ProductProvider 
Responsible for calling the API that loads the products. 
### PurchasesProvider 
Retrieves the user's purchase data. 


___
After logging in, the user's data is saved locally on the device, avoiding the need for the user to log in again when closing and reopening the app.

## Project Dependencies <a name="project-dependencies"></a>


A few dependencies were used in this project, some are worth mentioning:
- [Flutter SVG](https://pub.dev/packages/flutter_svg) for showing svgs.
- [Provider](https://pub.dev/packages/provider), for our state management.
- [Http](https://pub.dev/packages/http), for fetching data.
- [Shared Preferences](https://pub.dev/packages/shared_preferences), for local storage.
