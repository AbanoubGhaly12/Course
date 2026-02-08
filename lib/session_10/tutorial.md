# Session 10: Scrollable Lists & Grids 📜

Welcome to Session 10! Today we're moving beyond static screens (screens that don't move) to **Scrollable Lists**.

Think about your favorite apps:
*   **Instagram/TikTok**: An infinite list of posts.
*   **Spotify**: A list of songs in a playlist.
*   **Netflix**: A grid of movie posters.

They ALL use Lists or Grids. In Flutter, we use `ListView` and `GridView`.

---

## 1. The Scroll Problem 🛑

By default, Flutter screens **do not scroll**. If you put 100 widgets in a `Column`, the app will crash with a "Yellow & Black Striped Warning" (RenderFlex overflow) because they don't fit on the screen.

To fix this, we need a **Scrollable Widget**.

---

## 2. ListView: The Basics 📝

The simplest way to make a column scroll is to change `Column` to `ListView`.

```dart
ListView(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    // ... you can have many items here
    Text('Item 100'),
  ],
)
```

**Pros:** Easy to use.\
**Cons:** It tries to build ALL items at once. If you have 10,000 items, your app will freeze!

---

## 3. ListView.builder: The Pro Way 🚀

For long lists (like a social feed), we use `ListView.builder`. It is "lazy" - it only draws the items currently visible on the screen. As you scroll down, it builds the new ones and trashes the old ones.

It needs two main things:
1.  `itemCount`: How many items do we have?
2.  `itemBuilder`: A function that builds a single row (given an index).

```dart
ListView.builder(
  itemCount: games.length, // 1. How many?
  itemBuilder: (context, index) { // 2. Build one item at index
    return ListTile(
      title: Text(games[index].name),
      subtitle: Text(games[index].genre),
    );
  },
)
```

---

## 4. GridView.builder: The Gallery View 🖼️

Just like `ListView.builder`, but for 2D grids (rows AND columns).

You need one extra thing: `gridDelegate`. This controls the layout (how many columns?).

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // 2 Columns
    childAspectRatio: 0.75, // Height vs Width ratio (0.75 means taller than wide)
  ),
  itemCount: games.length,
  itemBuilder: (context, index) {
    return Card(child: Text(games[index].name));
  },
)
```

---

## Summary

| Widget | Use Case |
| :--- | :--- |
| `SingleChildScrollView` | You have a normal screen (Column) but just want it to scroll if the phone is small. |
| `ListView` | You have a small, fixed list of items. |
| `ListView.builder` | [BEST PRACTICE] You have a list of data (Arrays/Lists). |
| `GridView.builder` | You want items side-by-side (like a photo gallery). |
