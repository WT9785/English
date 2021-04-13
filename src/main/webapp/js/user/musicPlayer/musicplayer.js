/**
 * Created by yu on 2015/8/4.
 */
var musicIndex = 1;
var audio;


window.onload = function () {
    var lyricContainer = document.getElementById('lyricContainer');

    function $(ele) {
        return document.querySelector(ele);
    }

    audio = $('#audio');
    var musicMode = 'list';

    var bufferTimer = null;
    var volumePercent = 0.44;


    initPlayer(musicIndex - 1);

    audio.volume = 0.44;
    audio.addEventListener('canplay', bufferBar, false);

    function initPlayer(index) {

        //����·��

        audio.setAttribute('src', playList[index].musicURL);

        //������
        $('.wsp_p_current').style.width = 0 + 'px';
        getLyric(audio.src.replace('.mp3', '.lrc'));
        //���������
        audio.removeEventListener('canplay', bufferBar, false);

        clearInterval(bufferTimer);
        $('.wsp_p_buffered').style.width = 0 + 'px';
    }

    audio.addEventListener('timeupdate', function () {
        if (!isNaN(audio.duration)) {
            //ʣ��ʱ��
            var duration = audio.duration;
            var durationMin = parseInt(duration / 60);
            var durationSecond = parseInt(duration % 60);
            var surplus = audio.currentTime;
            var surplusMin = parseInt(surplus / 60);
            var surplusSecond = parseInt(surplus % 60);
            if (surplusSecond < 10) {
                surplusSecond = '0' + surplusSecond;
            }
            ;
            $('#duration').innerHTML = "/" + durationMin + ":" + durationSecond;
            $('#currentTime').innerHTML = surplusMin + ":" + surplusSecond;

            //���Ž�����
            var progressValue = audio.currentTime / audio.duration;
            $('.wsp_p_current').style.width = progressValue * 100 + '%';
        }
        ;
    }, false);


    $('#play').onclick = function () {

        toPlay('play');
    }

    $('#pause').onclick = function () {

        toPlay('pause');
    }

    $('#prev').onclick = function () {

        toPlay('prev');
    };

    $('#next').onclick = function () {

        toPlay('next');
    };

    //��������ʱ��
    $('.wsp_p_total').onclick = function (ev) {

        adjustPorgress(this, ev);
    };

    //��������

    $('#volume_bar').onclick = function (ev) {
        adjustVolume(this, ev);
    };

    function adjustVolume(dom, ev) {
        var event = window.event || ev;
        var domWidth = dom.offsetWidth;
        var domToLeftW = dom.getBoundingClientRect().left;
        var volumeX = event.clientX - domToLeftW;
        volumePercent = (volumeX / domWidth).toFixed(2);

        audio.volume = volumePercent;
        $('.wsp_v_current').style.width = volumePercent * 100 + '%';
    };


    $('#mute').onclick = function () {

        if (audio.muted == false) {


            $("#mute").setAttribute("class", "wsp_v_mute lt ico wsp_v_mute_sel");
            $('.wsp_v_current').style.width = 0 + '%';
            audio.muted = true;
        }
        else if (audio.muted == true) {

            this.setAttribute("class", "wsp_v_mute lt ico");
            $('.wsp_v_current').style.width = volumePercent * 100 + '%';
            audio.muted = false;
        }
        ;
    };

    $('#list').onmouseover = function () {

        $('.repeat_lists').style.display = "block";


    }


    $('#list').onmouseout = function () {
        $('.repeat_lists').style.display = "none";
    }


    $('#repeat').onclick = function () {
        musicMode = 'repeat';
        $('#jp-collect2').setAttribute("title", "单曲循环");
        $('#jp-collect2').setAttribute("class", "repeat repeat-02 a_btn");
        $('.repeat_lists').style.display = "none";


    };

    $('#shuffle').onclick = function () {
        musicMode = 'shuffle';
        $('#jp-collect2').setAttribute("title", "随机播放");
        $('#jp-collect2').setAttribute("class", "repeat repeat-03 a_btn");
        $('.repeat_lists').style.display = "none";

    };

    $('#list1').onclick = function () {

        musicMode = 'list';
        $('#jp-collect2').setAttribute("title", "列表循环");
        $('#jp-collect2').setAttribute("class", "repeat repeat-01 a_btn");
        $('.repeat_lists').style.display = "none";

    };


    function toPlay(action) {
        if (action == 'play') {
            audio.play();

            $('#play').style.display = "none";
            $('#pause').style.display = "block";


        }
        else if (action == 'pause') {
            audio.pause();

            $('#pause').style.display = "none";
            $('#play').style.display = "block";

        }
        else if (action == 'prev') {

            playMusicMode(action);
        }
        else if (action == 'next') {
            playMusicMode(action);
        }
        ;
    }


    function playMusicMode(action) {
        var musicNum = playList.length;
        var index = musicIndex;
		

        if (musicMode == 'list') {

            if (action == 'prev') {
            	console.log(index)
                if (index == 1||index==0) {
                    index = musicNum;
                }
                else {
                	console.log(index)
                    index -= 1;
                }
            }
            else if (action == 'next' || action == 'ended') {
                if (index == musicNum) {
                    index = 1;
                }
                else {
                    index += 1;
                }
            }
            ;
        }
        ;

        if (musicMode == 'shuffle') {
            var randomIndex = parseInt(musicNum * Math.random());
            index = randomIndex + 1;
            /*if (index == musicIndex) {
                index += 1;
            }
            ;*/
        }
        ;


        if (musicMode == 'repeat') {

            if (action == 'prev') {
                if (index == 1) {
                    index = musicNum;
                }
                else {
                    index -= 1;
                }
            }
            else if (action == 'next') {
                alert(musicMode)
                if (index == musicNum) {
                    index = 1;
                }
                else {
                    index += 1;
                }
            } else {

            }
        }
        ;
        musicIndex = index;
        playIndex(index-1);
    }


    audio.addEventListener('ended', function () {
        playMusicMode('ended');
    }, false);


    function hasClass(dom, className) {
        var classNum = dom.className.split(" "),
            hasClass;

        for (var i = 0; i < classNum.length; i++) {
            if (classNum[i] == className) {
                hasClass = true;
                break;
            }
            else {
                hasClass = false;
            }
            ;
        }
        ;

        return hasClass;
    }


    function replaceClass(dom, className, replaceClass) {
        if (hasClass(dom, className)) {
            var classNum = dom.className.split(" ");
            for (var i = 0; i < classNum.length; i++) {
                if (classNum[i] == className) {
                    classNum.splice(i, 1, replaceClass);
                    dom.className = className.join(" ");
                    break;
                }
                ;
            }
            ;
        }
        ;
    }

    //=============================================�������Ž�����
    function adjustPorgress(dom, ev) {
        var event = window.event || ev;
        var progressX = event.clientX - dom.getBoundingClientRect().left;
        var width = dom.offsetWidth;
        audio.currentTime = parseInt(audio.duration / width * progressX);
        audio.removeEventListener('canplay', bufferBar, false);
    }

//===============================================��ʾ���������
    function bufferBar() {

        bufferTimer = setInterval(function () {

            // ��ȡ�ѻ��岿�ֵ� TimeRanges ����
            var timeRanges = audio.buffered;
            //// ��ȡ�Ի����ʱ��
            var timeBuffered = timeRanges.end(timeRanges.length - 1);
            //// ��ȡ������ȣ�ֵΪ0��1
            var bufferPercent = timeBuffered / audio.duration;

            if (bufferPercent > 0 && audio.buffered != undefined) {

                $('.wsp_p_buffered').style.width = bufferPercent * 100 + '%';
                if (bufferPercent >= 1) {

                    clearInterval(bufferTimer);
                }
            }
            ;


        }, 1000);
    }

    function playIndex(index) {

        initPlayer(index);
        audio.load();
        audio.addEventListener('canplay', bufferBar, false);
        toPlay('play');
    }

    var plays = document.getElementsByName("list_play");
    var lists = document.getElementsByName("musicName");

    for (var i = 0; i < lists.length; i++) {
        lists[i].onclick = function () {

            var id = this.parentNode.parentNode.getAttribute("id");
            musicIndex = parseInt(id);

            $('.now_plays').setAttribute("class", "p_row item rel c_wap  c_zm");
            this.parentNode.parentNode.setAttribute("class", "p_row item rel c_wap  c_zm now_plays");
            playIndex(id - 1)

        }


    }

    for (var i = 0; i < plays.length; i++) {
        plays[i].onclick = function () {

            var id = this.parentNode.parentNode.parentNode.getAttribute("id");
            musicIndex = parseInt(id);

            $('.now_plays').setAttribute("class", "p_row item rel c_wap  c_zm");
            this.parentNode.parentNode.parentNode.setAttribute("class", "p_row item rel c_wap  c_zm now_plays");
            playIndex(id - 1)

        }


    }

    //==========================歌词同步=============================
    function getLyric(url) {


        var request = new XMLHttpRequest();
        request.open('GET', url, true);
        request.responseType = 'text';
        //fix for the messy code problem for Chinese.  reference: http://xx.time8.org/php/20101218/ajax-xmlhttprequest.html
        //request['overrideMimeType'] && request.overrideMimeType("text/html;charset=gb2312");

        request.onreadystatechange = function () {
            lyricContainer.textContent = 'loading lyric...';
            if (request.readyState == 4) {
$('#title').textContent=playList[musicIndex-1].musicName;
                if (request.status == 200) {

                    $('#no_lyr').style.display = "none";
                    lyric = request.response;
                    lyric = parseLyric(lyric);
                    //display lyric to the page
                    appendLyric(lyric);
                }

                if (request.status == 403 || request.status == 404) {
                    lyricContainer.textContent = '';

                    $('#no_lyr').style.display = "block";


                }
            }
        }


        request.onerror = request.onabort = function () {

            lyricContainer.textContent = '!failed to load the lyric :(';
        }



        request.send();
    }

    function parseLyric(text) {

        //将文本分隔成一行一行，存入数组
        var lines = text.split('\n'),
        //用于匹配时间的正则表达式，匹配的结果类似[xx:xx.xx]
            pattern = /\[\d{2}:\d{2}.\d{2}\]/g,
        //保存最终结果的数组
            result = [];
        //去掉不含时间的行
        while (!pattern.test(lines[0])) {
            lines = lines.slice(1);
        }
        ;
        //上面用'\n'生成生成数组时，结果中最后一个为空元素，这里将去掉
        lines[lines.length - 1].length === 0 && lines.pop();
        lines.forEach(function (v /*数组元素值*/, i /*元素索引*/, a /*数组本身*/) {
            //提取出时间[xx:xx.xx]
            var time = v.match(pattern),
            //提取歌词
                value = v.replace(pattern, '');
            //因为一行里面可能有多个时间，所以time有可能是[xx:xx.xx][xx:xx.xx][xx:xx.xx]的形式，需要进一步分隔
            time.forEach(function (v1, i1, a1) {
                //去掉时间里的中括号得到xx:xx.xx
                var t = v1.slice(1, -1).split(':');
                //将结果压入最终数组
                result.push([parseInt(t[0], 10) * 60 + parseFloat(t[1]), value]);
            });
        });
        //最后将结果数组中的元素按时间大小排序，以便保存之后正常显示歌词
        result.sort(function (a, b) {
            return a[0] - b[0];
        });
        return result;
    }

    var lyric = null;

    function appendLyric(lyric) {

        var fragment = document.createDocumentFragment()

        fragment = document.createDocumentFragment();
        //clear the lyric container first
        lyricContainer.innerHTML = '';
        lyric.forEach(function (v, i, a) {
            var line = document.createElement('p');
            line.id = 'line-' + i;
            line.textContent = v[1];
            fragment.appendChild(line);
        });
        lyricContainer.appendChild(fragment);
    }

    var lyricStyle = 0;
    audio.ontimeupdate = function (e) {

        if (!lyric) return;
        for (var i = 0, l = lyric.length; i < l; i++) {
            if (this.currentTime > lyric[i][0] - 0.50 /*preload the lyric by 0.50s*/) {
                //single line display mode
                // that.lyricContainer.textC
                //
                // ontent = that.lyric[i][1];
                //scroll mode
                var line = document.getElementById('line-' + i),
                    prevLine = document.getElementById('line-' + (i > 0 ? i - 1 : i));
                prevLine.className = '';
                //randomize the color of the current line of the lyric
                line.className = 'current-line-' + lyricStyle;
                lyricContainer.style.top = 130 - line.offsetTop + 'px';
            }
            ;
        }
        ;
    }


}

