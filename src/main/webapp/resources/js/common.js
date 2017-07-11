

function checkInputEmpty($obj) {
	var count = 0;
	// i = index
	// element : object
	$obj.each(function(i, element) {
		if ($(element).val() == "") {
			var $next = $(element).next(".error");
			$next.css("display", "block");
			count++;
		}
	})
	if (count > 0) {
		return false;
	}
	return true;
}