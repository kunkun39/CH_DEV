/**
 * @file 首页用的到的 JavaScript 交互，目前会压缩，拟在打包时内联插入到 homepage 的指定位置
 * @author by yuanyuan07 on 2015/8/12.
 */

(function ($) {
    // 点击立刻检测跳转到检测页
    function openHealthChecker(e) {
        var siteURL = $('#health-checker-input').val();
        if (!siteURL) {
            e.preventDefault();
            $('#health-checker-input').focus();
        }
    }

    $('#start-health-checker').click(openHealthChecker);
    $('#health-checker-input').keydown(function (e) {
        if (e.keyCode === 13) {
            openHealthChecker(e);
        }
    });

    // 恶意站点轮播功能
    var evilSitesObject = {
        HTMLContent: [],
        renderHTML: function (data) {
            var t = this;

            t.contentLength = data.length;
            for (var i = 0; i < data.length; i++) {
                var tmpResult = '';
                for (var j = 0; j < data[i].length; j++) {
                    tmpResult += '<tr><td>'
                        + data[i][j].host
                        + '</td><td>'
                        + data[i][j].type
                        + '</td><td>'
                        + data[i][j].update_time
                        + '</td></tr>';
                }
                t.HTMLContent.push(tmpResult);
            }
        },
        switchRandomContent: function () {
            var next = Math.floor(Math.random() * this.contentLength);
            $(this.target).html(this.HTMLContent[next]);
        },
        startSwitch: function () {
            var t = this;
            t.switchRandomContent();
            t.switchTimeout = setTimeout(function () {
                t.startSwitch();
            }, 2000);
        },
        switchTimeout: null,
        target: null,
        contentLength: 0,
        load: function (selector) {
            this.target = $(selector);
            this.renderHTML(evilSitesData);
            this.startSwitch();
        }
    };
    evilSitesObject.load('#evil-sites-body');


    /*if (deviceState < 3) {
     // 预加载所有的 js 和消息啊！！如果不是移动端！！
     for (var i = 0; i < preLoadJavascriptArray.length; i++) {
     $.ajax(preLoadJavascriptArray[i], {jsonp: true});
     }
     for (var i = 0; i < preLoadOtherResourcesArray.length; i++) {
     $.ajax(preLoadOtherResourcesArray[i]);
     }
     }*/

})(jQuery);

// 如果需要 DOM 操作，需要自己粘贴一份 qsa 而不是用 jQuery 啊！！
