# ITI_rubr_course
# Ruby Bank Transaction Logger

## Overview

This project demonstrates a simple **banking system** in Ruby that processes user transactions and logs all important events to a file.  
It showcases the use of Ruby modules, dynamic method definition, OOP concepts, and file-based logging.

---

## Features

- **User and Transaction Management:**  
  - Each user has a name and balance.
  - Transactions can be positive (deposit) or negative (withdrawal).

- **Bank Processing:**  
  - The bank processes a list of transactions for its users.
  - Handles cases where the user does not exist or has insufficient balance.

- **Logging System:**  
  - Custom `Logger` module dynamically creates logging methods (`log_info`, `log_warning`, `log_error`).
  - All logs are written to `app.log` with timestamps and log levels.

- **Callbacks:**  
  - Supports passing a block to handle transaction results (e.g., simulating API calls).

---

## How It Works

- The `Logger` module uses metaprogramming to define log methods for different log levels.
- The `CBABank` class includes the logger and manages users and their transactions.
- When processing transactions:
  - If the user is not found, an error is logged.
  - If the transaction would result in a negative balance, an error is logged.
  - If the balance becomes zero, a warning is logged.
  - Otherwise, the transaction is processed and the balance is updated.
- All important events are logged to `app.log`.

---

## File Structure

- `log_message.rb` &nbsp;&nbsp;&nbsp;&nbsp;→ Main Ruby script (contains all classes and logic)
- `app.log` &nbsp;&nbsp;&nbsp;&nbsp;→ Log file generated during execution

---

## How to Run

1. Make sure you have Ruby installed.
2. Run the script:
   ```sh
   ruby log_message.rb
   ```
3. Check the `app.log` file for logged events.

---

## Author

- kerolos ibrahem
- ITI Ruby Course – Day 2
