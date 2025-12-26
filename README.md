# 🍽️ Party Menu Selection App (Flutter)

A modern Flutter application that allows users to select dishes for a party from a categorized menu.  
The app focuses on clean UI, smooth animations, and logical filtering to provide a real-world food ordering experience.

---

## ✨ Features

- 📂 **Category-based Menu**
    - Starter, Main Course, Dessert, Sides
    - Dynamic item count per category

- 🔍 **Global Search**
    - Search dishes across all categories
    - Case-insensitive search

- 🥗 **Veg / Non-Veg Filters**
    - Custom animated switches using food-style veg/non-veg icons
    - Independent toggles
    - When no filter is selected, all dishes are shown

- ➕ **Add / Remove Dishes**
    - Add & remove dishes with animated buttons
    - Selected items reflected in category count and total count

- 🧾 **Ingredient Details**
    - Ingredient list opens in a bottom sheet
    - Displays dish image, description, and ingredient quantities

- 🎨 **Modern UI**
    - Custom search bar
    - Rectangular category tabs
    - Elevated bottom summary bar
    - Smooth animations and responsive layout

---

## 🛠️ Tech Stack

- **Flutter**
- **Dart**
- **Material UI**
- State management using `setState`
- Custom animations using `AnimatedContainer` & `AnimatedAlign`

---

## 📱 Screens Implemented

- Home Screen (Menu List)
- Category Tabs with Counters
- Search & Filter UI
- Ingredient Bottom Sheet
- Ingredient Detail Screen

---
## 📸 Screenshots

### 🏠 Home Screen
![Home Screen](screenshots/home.png)

### 🔍 Search & Filters
![Search](screenshots/search.png)

### 🥗 Veg / Non-Veg Filter
![Filter](screenshots/filters.png)

### 🍲 Dish Selection
![Dish List](screenshots/dish_list.png)

### 🧾 Ingredient Bottom Sheet
![Ingredient Sheet](screenshots/ingredient_sheet.png)

### 📄 Ingredient Detail Screen
![Ingredient Page](screenshots/ingredient_page.png)

---

## 📂 Project Structure

```text
lib/
│
├── data/
│   └── menu_data.dart
│
├── models/
│   └── dish.dart
│
├── screens/
│   ├── home_screen.dart
│   └── ingredient_screen.dart
│
├── widgets/
│   └── reusable_ui_components.dart
│
└── main.dart
