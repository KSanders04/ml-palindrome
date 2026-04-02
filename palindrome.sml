fun getLast list = if null (tl list) then hd list else getLast (tl list);

fun removeLast list = if null (tl list) then [] else hd (list) :: removeLast (tl list);

fun my_reverse list = if null list then [] else getLast (list) :: my_reverse (removeLast list);

fun removeNonAlphabetic list = if null list then [] else if (ord (hd list) >= 65 andalso ord (hd list) <= 90) orelse (ord (hd list) >= 97 andalso ord (hd list) <= 122) then hd (list) :: removeNonAlphabetic (tl list) else [] @ removeNonAlphabetic (tl list);

fun changeToLowercase list = if null list then [] else if ord (hd list) >= 65 andalso ord (hd list) <= 90 then chr (ord (hd list) + 32) :: changeToLowercase (tl list) else hd (list) :: changeToLowercase (tl list);

(* fun palindrome () = *)

