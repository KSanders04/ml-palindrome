(* Authors: Kyle Sanders, Raymond Gueta 
    Date: 4/3/2026
    Purpose: This program determines whether an input is a palindrome or not.
    In this program it ignores spacing, punctuation, and capitalization so
    that only the alphabetical characters are used to determine if it is a palindrome. *)

(* Returns the last element in a list
    Base case: if the tail has no elements, then the head is the last element
    Recursive case: call getLast on the tail until the base case is reached *)
fun getLast list = if null (tl list) then hd list else getLast (tl list);

(*Returns a list with the last element removed
    Base case: if the tail is empty, then return an empty list
    Recursive case: keep the head and recurse on the list without the last element*)
fun removeLast list = if null (tl list) then [] else hd (list) :: removeLast (tl list);

fun my_reverse list = if null list then [] else getLast (list) :: my_reverse (removeLast list);

fun removeNonAlphabetic list = if null list then [] else if (ord (hd list) >= 65 andalso ord (hd list) <= 90) orelse (ord (hd list) >= 97 andalso ord (hd list) <= 122) then hd (list) :: removeNonAlphabetic (tl list) else [] @ removeNonAlphabetic (tl list);

fun changeToLowercase list = if null list then [] else if ord (hd list) >= 65 andalso ord (hd list) <= 90 then chr (ord (hd list) + 32) :: changeToLowercase (tl list) else hd (list) :: changeToLowercase (tl list);

(* Determines whether the input is a palindrome while ignoring spaces, punctuation, and cases.
    When input is a palindrome then it will return true, otherwise false.
*)
fun is_palindrome input =

    (*explodes the input into a char list, then we make everything 
    lowercase with the changeToLowercase function. After that we call 
    function removeNonAlphabetic to remove anything that is not an alphabetical
    character. After we have a cleaned list then we check to see if the input matches
    the clean list. If it matches then it is a palindrome.
    *)
    removeNonAlphabetic (changeToLowercase (explode input)) = 
    my_reverse (removeNonAlphabetic (changeToLowercase (explode input)));
