# Family Tree Knowledge Representation in MeTTa

This project implements a **Family Tree** in MeTTa programming language. The tree represents parent-child relationships, and the following tasks are accomplished:

1. **find-children**: A function that finds the children of a given person.
2. **find-grandchildren**: A function that finds the grandchildren of a given person.

## Problem Description

You are given a family tree with the following relationships:

- Bob is the parent of Ann
- Bob is the parent of Joe
- Ann is the parent of Mary
- Ann is the parent of John

### Task

1. **Represent the family tree in MeTTa** using the Parent relationship.
2. **Write a MeTTa function called `find-children`** that takes a person's name as input and returns their children.
3. **Write a MeTTa function called `find-grandchildren`** that takes a person's name as input and returns their grandchildren.

### Example Input/Output:

**Input**:
```lisp
(find-children 'Bob)
```
**OutPut**
(Ann Joe)
**Input**
```
(find-grandchildren 'Bob)
```
**Output**
(Mary John)


# `is-member` Function in MeTTa

This project implements a function called `is-member` in MeTTa programming language, which checks if an element is present in a list. It takes two arguments:
- A list
- An element

It returns `true` if the element is found in the list, and `false` otherwise.

## Problem Description

You need to implement a function in MeTTa that checks if a given element exists in a list.

### Example:

**Input**:
```lisp
(is-member '(a b c) 'b)
```



# Extracter Function in MeTTa

This project implements a function called `extracter` in MeTTa programming language that filters elements from a list based on a given condition. The function takes a list and a predicate function as inputs, and returns a new list containing only the elements that satisfy the predicate.

## Problem Description

You need to implement a function in MeTTa that extracts only the elements from a list that satisfy a given condition. The function should accept:
- A list
- A predicate function

The function should return a new list that only contains elements which satisfy the predicate function.

### Example:

**Input**:
(extracter '((a)(b g)(d e) ()) 'notEmpty)

**Output**:
((a)(b g)(d e))

### Predicate Function:
- The predicate function used in the example is `notEmpty`, which checks whether a list is not empty.

## Code Explanation

### `extracter` Function

This function filters elements from the list based on a given predicate:
1. If the list is empty, it returns an empty list.
2. For each element, it applies the predicate. If the predicate returns `true`, the element is included in the result; otherwise, it is skipped.

### `notEmpty` Predicate Function

This function checks whether a given list is empty. If the list is empty, it returns `false`; otherwise, it returns `true`.

## How to Use

1. The program first asks for user input for the list.
2. Then, the program asks for the predicate function (e.g., `notEmpty`).
3. After receiving the input, it applies the `extracter` function and returns the filtered list.

## MeTTa Code

Here is the full MeTTa code that implements the solution:

```metta
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
  (not (is-empty x)))

; Function to read user input and convert it into a list
define string-to-list (str)
  (map string-to-symbol (split str " ")))

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
