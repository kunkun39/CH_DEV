$(document).ready(function() {
			$('#navbar-toggle').click(function () {
                $($(this).attr('data-target')).toggleClass('in');
            });
});