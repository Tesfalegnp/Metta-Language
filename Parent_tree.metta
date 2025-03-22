(space family)

(= (Parent Bob Ann))
(= (Parent Bob Joe))
(= (Parent Ann Mary))
(= (Parent Ann John))

(= (find-children ?parent)
   (match &family (Parent ?parent ?child) ?child))

(= (find-grandchildren ?grandparent)
   (match &family (Parent ?grandparent ?parent)
                  (Parent ?parent ?grandchild)
          ?grandchild))

;; Run Queries
(find-children Bob)  ;; Expected Output: (Ann Joe)
(find-grandchildren Bob)  ;; Expected Output: (Mary John)
