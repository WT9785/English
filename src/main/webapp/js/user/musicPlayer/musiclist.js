

$(function () {
    //===============创建歌曲列表节点==============================
    function createSongList(list) {
        console.log(list)
        var i = 0;
        $(list).each(function () {
            if (musicIndex == i + 1) {
                var $first = $("<div name='songItem' ></div>").addClass("p_row item rel c_wap  c_zm now_plays").attr("id", i + 1);
            } else {
                var $first = $("<div name='songItem'></div>").addClass("p_row item rel c_wap  c_zm").attr("id", i + 1);
            }
            var $first_ff = $("<div class=\"ck_act abs\"><input type=\"checkbox\" name=\"songcheckbox\" value=\"yc#2867959#\"></div>");

            var $first_first = $("<div></div>").addClass("row_item list_name rel lt  w_60");

            var $first_first_first = $("<a  href=\"javascript:void(0);\" name=\"musicName\" style='cursor: pointer'></a>").addClass("row_s_tl b lt ell w_50");
            var $first_first_first_first = $("<span></span>").addClass("lt i_sort").append(i + 1);

            var $first_first_second = $("<div class=\"act_box abs c_wap c_zm action_shop\" style=\"display: none;\"></div>");

            var $first_fisrt_second_first = $(" <a class=\"a_btn stat_btn lt play_btn\" href=\"javascript:void(0);\" onclick=\"return false;\" title=\"播放\" name='list_play'>  <i class=\"ico\">播放</i>  </a>");
            var $first_fisrt_second_second = $(" <a class=\"a_btn lt coll_btn \" href=\"javascript:void(0);\" onclick=\"return false;\" songinfo=\"#\" title=\"收藏\">  <i class=\"ico\">收藏</i>  </a>");
            var $first_fisrt_second_third = $(" <a class=\"a_btn lt dow_btn\" href=\"#\" title=\"下载\" target=\"_blank\">  <i class=\"ico\">下载</i> </a>");
            var $first_fisrt_second_fourth = $(" <a class=\"a_btn lt share_btn song_share_link\" href=\"javascript:void(0);\" onclick=\"return false;\" link=\"#\" title=\"分享\"> <i class=\"ico\">分享</i> </a>");
            var $first_fisrt_second_fifth = $("<a class=\"a_btn lt del_btn\" href=\"javascript:void(0);\" onclick=\"return false;\" title=\"删除\"> <i class=\"ico\">删除</i> </a>");

            var $first_second = $("<div class=\"row_item lt w_20 rel ell\"></div>");
            var $first_second_first = $("<a href=\"#\" target=\"_blank\"></a>");

            var $first_third = ("<div class=\"row_item lt w_20 rel ell\">--</div>");

            $first_first.append($first_first_first);
            $first_first.append($first_first_second);

            $first_first_first.append($first_first_first_first);
            $first_first_first.append(list[i].musicName);
            $first_second_first.append(list[i].artist);
            $first_first_second.append($first_fisrt_second_first);
            $first_first_second.append($first_fisrt_second_second);
            $first_first_second.append($first_fisrt_second_third);
            $first_first_second.append($first_fisrt_second_fourth);
            $first_first_second.append($first_fisrt_second_fifth);
            $first_second.append($first_second_first);
            $first.append($first_ff);
            $first.append($first_first);
            $first.append($first_second);
            $first.append($first_third);

            var $songList = $("#songList");

            $songList.append($first);

            i++;

        });

    }
    createSongList(playList);


    $("#songList").mCustomScrollbar({

        scrollButtons: {
            enable: true
        }
    });

    $("#lists_left").mCustomScrollbar({

        scrollButtons: {
            enable: true
        }
    });




//============================改变播放模式===============================
    $("#repeat").click(function () {

        var $children = $("#jp-collect2").children();
        $("#jp-collect2").empty().append($children);
        $('#jp-collect2').append("单曲循环");

    });

    $("#shuffle").click(function () {

        var $children = $("#jp-collect2").children();
        $("#jp-collect2").empty().append($children);
        $('#jp-collect2').append("随机播放");

    });

    $("#list1").click(function () {

        var $children = $("#jp-collect2").children();
        $("#jp-collect2").empty().append($children);
        $('#jp-collect2').append("列表循环");

    });

//=================修改当前播放歌曲的列表样式
    $("#prev,#next").click(function () {
        $(".now_plays").removeClass("now_plays");
        var i=0;
        if(navigator.userAgent.toLowerCase().match(/chrome/) != null){
            i=musicIndex;
            if(musicIndex==playList.length){
                i=0;
            }
            $("div[name='songItem']")[i].setAttribute("class", "p_row item rel c_wap  c_zm now_plays");
        }else{
            $("div[name='songItem']")[musicIndex - 1].setAttribute("class", "p_row item rel c_wap  c_zm now_plays");
        }



    });
//=========================显示与隐藏歌曲列表的小图标
    $("div[name='songItem']").each(function () {
        this.onmouseover = function () {
            var c = $(this).children().get(1);
            //alert($(c).children().get(1).getAttribute("class"));
            $(c).children().get(1).style.display = "block";
        }

        this.onmouseout = function () {
            var c = $(this).children().get(1);
            //alert($(c).children().get(1).getAttribute("class"));
            $(c).children().get(1).style.display = "none";
        }
    });


});
