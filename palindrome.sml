fun getLast list = if null (tl list) then hd list else getLast (tl list);

fun removeLast list = if null (tl list) then [] else hd (list) :: removeLast (tl list);

(*Purpose: Return thee reverse order of a list*)
(*Parameters: list (Any list)*)
(*Base case: "if null list then []" If it is an empty list then return an empty list*)
(*Recursive case: Add the last element of the list to the rest of the list with the last element removed*)
(*Return: A list that is in the reverse order of the given list*)
fun my_reverse list = if null list then [] else getLast (list) :: my_reverse (removeLast list);

(*Purposee: Removes all non-alphabetic characters from a list of characters*)
(*Parameters: list (A list of characters)*)
(*Base case: "if null list then []" If it is an empty then list then return an empty list*)
(*Recursive cases: 1. If it is an alphabetic character according to ASCII then add to the returning list the head of the current list*)
(*2: If it is not an alphabetic character then add an empty list to the returning listen*)
(*Return: A list of all the alphabetic characters in a list of characters*)
fun removeNonAlphabetic list = if null list then [] else if (ord (hd list) >= 65 andalso ord (hd list) <= 90) orelse (ord (hd list) >= 97 andalso ord (hd list) <= 122) then hd (list) :: removeNonAlphabetic (tl list) else [] @ removeNonAlphabetic (tl list);

(*Purpose: To change all uppercase characters in a list of characters to lowercase*)
(*Parameters: list (A list of characters)*)
(*Base case: "if null list then []"  If it is an empty list then return an emplty list*)
(*Recursive cases: 1. If the head of the list is uppercase then add the lowercase equivalent of it to the list to be returned*)
(*2. Otherwise just add the head of the list to the list that will be returned*) 
(*Return: A list of all characters in the original list but in lowercase*)
fun changeToLowercase list = if null list then [] else if ord (hd list) >= 65 andalso ord (hd list) <= 90 then chr (ord (hd list) + 32) :: changeToLowercase (tl list) else hd (list) :: changeToLowercase (tl list);

fun is_palindrome input =
    removeNonAlphabetic (changeToLowercase (explode input)) = 
    my_reverse (removeNonAlphabetic (changeToLowercase (explode input)));
