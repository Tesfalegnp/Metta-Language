; Define the extracter function that filters elements based on a predicate
define extracter (lst predicate)
  ; Base case: if the list is empty, return an empty list
  if (is-empty lst)
    '()
  else
    ; Check if the first element satisfies the predicate
    if (predicate (first lst))
      ; If it satisfies the condition, include it in the result
      (cons (first lst) (extracter (rest lst) predicate))
    else
      ; Otherwise, skip it
      (extracter (rest lst) predicate)

; Define the notEmpty predicate function
define notEmpty (x)
  (not (is-empty x))

; Function to read user input and convert it into a list
define string-to-list (str)
  (map string-to-symbol (split str " "))

; Get user input for the list
write "Enter a list (space-separated values, with parentheses for sub-lists): "
define list-str (read)  ; Read the list input as a string
define list (string-to-list list-str)  ; Convert the string to a list of symbols

; Get user input for the predicate function
write "Enter a predicate function (e.g., 'notEmpty'): "
define predicate-str (read)  ; Read the predicate input as a string

; Determine the predicate function based on user input
define predicate
  (if (= predicate-str "notEmpty") notEmpty)

; Apply the extracter function with the provided list and predicate
define result (extracter list predicate)

; Display the result
write "Filtered list: "
write result
