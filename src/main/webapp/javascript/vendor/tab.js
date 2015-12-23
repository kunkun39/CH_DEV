$(document).ready(function() {
			$('.back-con-l-ul li').click(function() {
				$(this).addClass('cur').siblings().removeClass('cur')
				var index = $(this).index();
				$('.leftTab-content').eq(index).show().addClass('active').siblings().removeClass('active').hide();
			});
});