function searchSeekerList(e){
  var search = $('#search-profile').val()
  if (search.length > 3){
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#search-profile" ).autocomplete({
      source: availableTags
    });
    $.get({url: `/search_seeker?search=${search}`, success: function(result){
        console.log(result)

    }});

  }
  return false;
}
