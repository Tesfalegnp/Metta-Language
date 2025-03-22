; Define the function removeDuplicates
define removeDuplicates (list)
  ; Helper function to check if an element is in the seen list
  define isInList (element seenList)
    if (is-empty seenList) 
      false
    else 
      if (= (first seenList) element)
        true
      else
        (isInList element (rest seenList))

  ; Recursive function to remove duplicates
  define remove (list seenList)
    if (is-empty list) 
      seenList ; Return the new list with unique elements
    else
      ; Check if the first element is already in the seenList
      if (isInList (first list) seenList) 
        (remove (rest list) seenList) ; Skip this element, as it's already in seenList
      else 
        ; Include the first element if it's not in seenList
        (remove (rest list) (cons (first list) seenList))

  ; Start the recursion with an empty seenList
  (remove list '())

; Function to convert the user input string to a list of integers (if needed)
define string-to-list (str)
  (map string-to-number (split str " "))

; Get user input for the list
write "Enter the list (space-separated numbers): "
define list-str (read) ; Read the list input as a string
define list (string-to-list list-str) ; Convert string to list of numbers

; Call the removeDuplicates function and store the result
define result (removeDuplicates list)

; Display the result
write "List after removing duplicates: "
write result
