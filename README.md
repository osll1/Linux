# Palindrome Checker Script

This script (`script.sh`) checks whether a given input string is a palindrome. It includes validation to ensure the input is a string and not numeric.

## Table of Contents

- [Usage](#usage)
  - [Requirements](#requirements)
  - [Instructions](#instructions)
- [Examples](#examples)
  - [Valid Input](#valid-input-palindrome)
  - [Invalid Input](#invalid-input-numeric)
- [Script Details](#script-details)

---

## Usage

### Requirements

- Bash (Bourne Again SHell)
- Git (for cloning the repository)

### Instructions

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/osll1/Linux.git
   cd Linux
Run the Script:

bash
Copy code
bash script.sh <input_string>
Replace <input_string> with the string you want to check.

Examples
Valid Input (Palindrome)
bash
Copy code
bash script.sh "madam"
Output:

csharp
Copy code
The string 'madam' is a palindrome.
Invalid Input (Numeric)
bash
Copy code
bash script.sh "12321"
Output:

lua
Copy code
Error: Numeric input detected. Please enter a string.
Script Details
The script.sh script:

Accepts a string input from the command line.
Checks if the input is empty or numeric.
Determines if the input string reads the same forwards and backwards (a palindrome).
Prints the result as text and generates an HTML file (palindrome_result.html) with the result.
