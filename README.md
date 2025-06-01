# ITI_rubr_course
# Day 1 Ruby Inventory Lab

## Overview

This project is a simple **Book Inventory Management System** built with Ruby as part of the ITI Ruby Course (Day 1 Task).  
It allows users to manage a collection of books, with all data persisted in a text file.

---

## Features

- **Add a new book** (with title, author, and ISBN)
- **Remove a book** by ISBN
- **List all books**
- **Search** for a book by title, author, or ISBN
- **Sort books** by ISBN
- **Persistent storage**: All books are saved to and loaded from a file (`Books.txt`)
- **Input validation** and user-friendly messages

---

## How It Works

- The program loads all books from `Books.txt` at startup.
- Users interact with a simple menu in the terminal to add, remove, search, or list books.
- When a book is added, the program checks for duplicate ISBNs.
- All changes are automatically saved to the file.
- The code is organized into two main classes:
  - `Book`: Represents a single book.
  - `Inventory`: Manages the collection of books and handles file operations.

---

## File Structure

- `books.rb` &nbsp;&nbsp;&nbsp;&nbsp;→ Main Ruby script (contains all logic and menu)
- `Books.txt` &nbsp;&nbsp;&nbsp;&nbsp;→ Data file for storing books (acts as a simple database)

---

## How to Run

1. Make sure you have Ruby installed.
2. Place `books.rb` and `Books.txt` in the same directory.
3. Run the program:
   ```sh
   ruby books.rb
   ```

---

## Author

- kerolos ibrahem
- ITI Ruby Course – Day 1
