(* fun my_reverse () = *)

fun removeNonAlphabetic str =
    String.implode(List.filter Char.isAlpha (String.explode str));

(* fun changeToLowercase () = *)

fun getLast str =
    String.implode(List.tl (tl(tl(tl(String.explode str)))));

fun getFirst str =
    String.implode [List.hd (String.explode str)];

(* fun palindrome () = *)

    