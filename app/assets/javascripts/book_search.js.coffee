jQuery ->
  $('#book_name_filter').autocomplete({source: $('#book_name_filter').data('autocomplete-source')});

function openSearch() {
    document.getElementById("myOverlay").style.display = "block";
}

function closeSearch() {
    document.getElementById("myOverlay").style.display = "none";
}
