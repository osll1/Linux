#!/bin/bash

# Function to check if a string is a palindrome
is_palindrome() {
    local input="$1"
    local reversed_input=$(echo "$input" | rev)
    if [[ "$input" == "$reversed_input" ]]; then
        echo "true"
    else
        echo "false"
    fi
}

# Input string (you can modify this part to accept input from Jenkins parameters)
input_string="$1"

# Check if the string is a palindrome
result=$(is_palindrome "$input_string")

# Generate the appropriate message
if [[ "$result" == "true" ]]; then
    message="The string '$input_string' is a palindrome."
else
    message="The string '$input_string' is not a palindrome."
fi

# Output the result to the Jenkins console
echo "$message"

# Generate HTML content
html_content="
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Palindrome Check Result</title>
</head>
<body>
    <h1>Palindrome Check Result</h1>
    <p>$message</p>
</body>
</html>
"

# Output the HTML content to a file
output_file="palindrome_result.html"
echo "$html_content" > "$output_file"





# #!/bin/bash

# # Function to check if a string is a palindrome
# is_palindrome() {
#     local input="$1"
#     local reversed_input=$(echo "$input" | rev)
#     if [[ "$input" == "$reversed_input" ]]; then
#         echo "true"
#     else
#         echo "false"
#     fi
# }

# # Input string (you can modify this part to accept input from Jenkins parameters)
# input_string="madam"

# # Check if the string is a palindrome
# result=$(is_palindrome "$input_string")

# # Generate HTML content
# html_content="
# <!DOCTYPE html>
# <html lang='en'>
# <head>
#     <meta charset='UTF-8'>
#     <meta name='viewport' content='width=device-width, initial-scale=1.0'>
#     <title>Palindrome Check Result</title>
# </head>
# <body>
#     <h1>Palindrome Check Result</h1>
#     <p>Input String: <strong>$input_string</strong></p>
#     <p>Is Palindrome: <strong>$result</strong></p>
# </body>
# </html>
# "

# # Output the HTML content to a file
# output_file="palindrome_result.html"
# echo "$html_content" > "$output_file"

# # Print the location of the generated HTML file
# echo "HTML file generated: $output_file"
