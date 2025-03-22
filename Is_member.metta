; Define the function is-member
define is-member (list x)
  if (is-empty list) 
    false
  else 
    if (= (first list) x) 
      true
    else 
      (is-member (rest list) x)

; Function to convert the user input string to a list of integers (if needed)
define string-to-list (str)
  (map string-to-number (split str " "))

; Get user input for the list
write "Enter the list (space-separated numbers): "
define list-str (read)
write "You entered: " list-str  ; Print out the list input for debugging
define list (string-to-list list-str)

; Get user input for the element to check
write "Enter the element to check: "
define x-str (read)
write "You entered: " x-str  ; Print out the element input for debugging
define x (string-to-number x-str)

; Call the is-member function and store the result
define result (is-member list x)

; Display the result
if result
  write "The element is present in the list: true"
else
  write "The element is NOT present in the list: false"
