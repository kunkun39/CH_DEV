var appInfo = {
	categoryName:'',
	appName:'',
	appPackage:'',
	versionInt:0,
	version:'',
	sizeFormat:'',
	iconPath:'',
	posterPath:'',
	description:''
}

function get_scrollTop_of_body() {
    var scrollTop;
    if (typeof window.pageYOffset != 'undefined') {
        scrollTop = window.pageYOffset;
    } else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') {
        scrollTop = document.documentElement.scrollTop;
    } else if (typeof document.body != 'undefined') {
        scrollTop = document.body.scrollTop;
    }
    return scrollTop;
}

function showDetails(appInfo, id) {
    var offset = $('#' + id).offset(),
    diff = {
        top: offset.top,
        left: offset.left
    },
    //			scrollTop = $('body').scrollTop(),
    scrollTop = get_scrollTop_of_body(),
    scrollLeft = $('body').scrollLeft(),
    eleTop = diff.top - scrollTop,
    eleLeft = diff.left - scrollLeft,
    eleWidth = $(this).width(),
    eleHeight = $(this).height(),
    tableWidth = $('#outerContainer').width(),
    tableHeight = $('#outerContainer').height(),
    endWidth = parseInt(document.getElementById("details").style.width) + 27 * 2,
    endHeight = parseInt(document.getElementById("details").style.height) + 27 * 2,
    endLeft = $(window).width() / 2 - endWidth / 2,
    endTop = $(window).height() / 2 - endHeight / 2;
    $('#categoryName').html(appInfo.categoryName);
    $('#appName').html(appInfo.appName);
    $('#appPackage').html(appInfo.appPackage);
    $('#versionInt').html(appInfo.versionInt);
    $('#version').html(appInfo.version);
    $('#sizeFormat').html(appInfo.sizeFormat);
    var imgIcon = document.getElementById("iconPath");
    imgIcon.src = appInfo.iconPath;
    var imgPoater = document.getElementById("posterPath");
    imgPoater.src = appInfo.posterPath;
    $('#description').html(appInfo.description);
    $('#lightbox').css({
        width: parseInt(document.getElementById("details").style.height) + 27 * 2 + "px",
        height: 'auto',
        left: endLeft,
        //top: endTop
        top: 30 + 'px'
    }).show(1500);
    $('#overlay').show()
}

$('#closeLink').click(end);

function end(Event) {
    if (Event) {
        var id = $(Event.target).attr("id");
        if (getID("closeLink") != id && getID("lightbox") != id && getID("overlay") != id) {
            return;
        }
    }
    $("#lightbox").stop(true, false);
    $("#lightbox").hide();
    $("#overlay").fadeOut(1000);
}

function getID(id) {
    return id;
}