# ITI_rubr_course

This repository contains Ruby training tasks assigned during the ITI course.  
Each task is isolated in a separate Git branch for clarity and organization.

---

## 📌 Task Branches

- [day1](https://github.com/keroibrahem/ITI_rubr_course/tree/day1) – Inventory Management System
- [day2](https://github.com/keroibrahem/ITI_rubr_course/tree/day2) – Banking System with Logger & Transactions

---

## 🧠 Day 1 – Inventory System

### 🎯 Objective:
Build a command-line inventory system to manage a collection of books.

### 📚 Functional Requirements:
- Each Book has:
  - title
  - author
  - ISBN
- Inventory should support:
  - Listing all books
  - Adding a new book
  - Removing a book by ISBN
- Persist books in a file (acts as a simple DB)

### 🌟 Bonus Features:
- Sort books by ISBN
- Search by title, author, or ISBN
- If the same ISBN is added again:
  - Increase count
  - Update title/author if changed
- Display proper messages for invalid/empty input

### 📂 File Structure:
- books.txt: Book records (simulating a database)
- main.rb: Application entry point

---

## 🏦 Day 2 – Banking Transactions System

### 🎯 Objective:
Simulate a bank transaction system with logging and error handling.

### 🔧 Requirements:

#### 1. Logger Module
- Methods:
  - log_info(message)
  - log_warning(message)
  - log_error(message)
- Logs are appended to app.logs in the format:

#### 2. Classes
- User: Has name and balance
- Transaction: Has user and value (immutable)
- Bank: Abstract class with method process_transactions(transactions, &block)
- CBABank: Inherits from Bank, includes Logger

#### 3. CBABank#process_transactions Logic:
- Log the start of transaction processing
- For each transaction:
  - If user not found → log error and raise
  - If balance goes negative → log error and raise
  - If balance becomes zero → log warning
  - If successful → log info
- Catch exceptions and log errors
- Invoke callback block with success/failure message

### 🧪 Example Terminal Output:

---

## 🚀 How to Run

bash
# Clone the repo
git clone https://github.com/keroibrahem/ITI_rubr_course.git
cd ITI_rubr_course

# Checkout the branch you want
git checkout day1
# OR
git checkout day2

# Run the ruby file
ruby main.rb