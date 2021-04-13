<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>音乐播放界面</title>
    <link href="${pageContext.request.contextPath}/css/user/musicPlayer/public_new.css" rel="stylesheet"
          type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user/musicPlayer/player.css"/>
    <style type="text/css">
        .item_img {
            position: relative
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/user/musicPlayer/jquery.mCustomScrollbar.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user/musicPlayer/musiclist.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user/musicPlayer/musicplayer.js"></script>
    <script type="text/javascript">
        var playList = new Array();
        /*$(function () {
            $.ajax({
                url: "http://localhost:8848/English/resource/getAllMusic",
                async: false,
                type: "GET",
                dataType: "json",
                success: function (data) {
                     var i =0;
                     for (i in data["data"]){
                         playList.push(data["data"][i])
                     }

                }
            });
        })*/
        // console.log(playList)
        $.ajax({
            url: "http://localhost:8848/English/resource/getAllMusic",
            async: false,
            type: "GET",
            dataType: "json",
            success: function (data) {
                var i = 0;
                for (i in data["data"]) {
                    playList.push(data["data"][i])
                }

            }
        });
    </script>
</head>

<body style="padding: 0px">
<div class="mian_palyer rel">
    <!--  top  -->
    <div class="p_top c_wap c_zm">

        <h1>英语资源网音乐播放</h1>
    </div>

    <!-- 播放器 -->
    <div class="p_palyer_box">
        <div id="playerbox" class="jp-audio">
            <div class="c_wap c_zm">
                <div class="jp-infos lt">
                    <div class="p_now c_wap c_zm" style="display:block;">
                        <span class="u_head lt a_btn_rb lt">
                            <a href="#">
                                <img alt="" src="${pageContext.request.contextPath}/images/user/musicPlayer/head.jpg"
                                     width="80" height="80" class="a_btn_rb">
                            </a>
                        </span>
                        <div class="lt">
                            <h2 class="sing_title f16 ell" id="_sing_title"></h2>

                            <h2 class="sing_name f12 ell" id="_sing_name"><a href="#" target="_blank"></a></h2>
                        </div>
                    </div>
                    <div class="p_noplay"><img alt=""></div>
                </div>
                <div class="rt">
                    <div class="action_btn lt c_wap c_zm">
                        <a href="#" onclick="return false;" class="jp-collect a_btn lt"
                           id="jp-collect1" tabindex="1" title="收藏"><i class="ico">收藏</i></a>
                        <a href="#" class="jp-download a_btn lt" tabindex="1" title="下载"
                           target="_blank"><i class="ico">下载</i></a>
                        <a href="#" onclick="return false;" class="jp-share song_share_link a_btn lt"
                           id="jp-share" tabindex="1" title="分享"><i class="ico">分享</i></a>
                    </div>
                    <div class="jp-controls lt c_wap c_zm">
                        <a style="display: none;" href="#" onclick="return false;" id="prev" class="wsp_c_prev a_btn lt"
                           title="上一首"><i class="ico">上一首</i></a>
                        <a href="#" onclick="return false;" id="play" class="wsp_c_play a_btn lt"
                           title="播放"><i class="ico">播放</i></a>
                        <a href="#" onclick="return false;" id="pause" class="wsp_c_pause a_btn lt"
                           title="暂停" style="display: none ;"><i class="ico">暂停</i></a>
                        <a style="display: none;" href="#" onclick="return false;" id="next" class="wsp_c_next a_btn lt"
                           title="下一首"><i class="ico">下一首</i></a>
                    </div>
                    <div class="jp-repeat lt rel" id="list">
                        <a href="#" onclick="return false;" class="repeat repeat-01 a_btn rel"
                           id="jp-collect2" title="列表循环">列表循环<i class="ico lt"></i><b class="abs"></b></a>

                        <div class="repeat_lists abs" style="display:none;">
                            <a style="display: none;" href="#" onclick="return false;" class="repeat repeat-01 a_btn"
                               title="列表循环" id="list1"><i class="ico lt"></i>列表循环</a>
                            <a style="display: none;" href="#" onclick="return false;" class="repeat repeat-02 a_btn"
                               title="单曲循环" id="repeat"><i class="ico lt"></i>单曲循环</a>
                            <a style="display: none;" href="#" onclick="return false;" class="repeat repeat-03 a_btn"
                               title="随机播放" id="shuffle"><i class="ico lt"></i>随机播放</a>
                        </div>
                    </div>
                    <div class="jp-toggles lt ">
                        <div class="total c_wap c_zm">
                            <input id="mute" class="wsp_v_mute lt ico" type="button" value="静音" title="静音">

                            <div class="wsp_v_total lt" id="volume_bar">
                                <div class="wsp_v_current" style="width: 44%;"></div>
                            </div>
                        </div>
                        <span class="wsp_currentTime f14"><strong id="currentTime">00:00</strong><strong id="duration">/00:00</strong></span>
                    </div>
                </div>
            </div>
            <!-- 进度条 -->
            <div id="pb_t" class="wsp_p_total">
                <div id="pb_b" class="wsp_p_buffered" style="width:0%;">
                    <div id="pb_c" class="wsp_p_current" style="width: 10%;"></div>
                </div>
            </div>
            <audio id="audio">
                <p>您的浏览器不支持HTML5播放器呢！赶紧换一个最新的呗^_^.</p>
            </audio>
        </div>
    </div>
    <!-- 列表 -->
    <div class="p_lists_box abs">
        <div class="p_lists rel c_wap c_zm">
            <!-- 中间内容自适应部分 -->
            <div class="p_cont_auto rel">
                <!-- 歌曲 -->
                <div class="p_song_lists" style="display:block;">
                    <div id="p_title" class="p_song_t rel c_wap c_zm">
                        <div class="ck_act abs">&nbsp;</div>
                        <div class="lt w_60 f14">歌曲</div>
                        <div class="lt w_20 f14">演唱者</div>
                        <div class="lt w_20 f14">来源</div>
                    </div>
                    <div id="fm_title" class="p_song_t rel c_wap c_zm" style="display:none">
                        <div class="ck_act abs">&nbsp;</div>
                        <div class="lt w_80 f14">歌曲名</div>
                        <div class="lt w_20 f14">演唱者</div>
                    </div>
                    <div id="list_ScrollContent" class="p_items abs" style="display:block;">

                        <div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0">
                            <div class="mCSB_container" id="songList">

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- 右 歌词部分 -->
            <div class="lrc_right abs">
                <div class="lrc_mian rel">
                    <h2 class="sing_title f16 abs tc ell" id="title"></h2>

                    <div id="lyr" class="lrc_content abs tc">
                        <div>
                            <div class="mCSB_container" id="lyricContainer"
                                 style="position: relative; top: 0px; left: 0px;">

                            </div>

                        </div>
                    </div>
                    <div id="no_lyr" class="lrc_content abs tc" style="display:none;">
                        <div class="lrc_null">
                            <i class="ico"></i>
                            <p class="tc f14">歌词还在开发哟，亲</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>

