/*!
 * JsTool v1.0.5
 * Date 2018-9-10 10:45:48
 * Author Edwin
 */

/**
 * js常用工具
  * result
 */
var  Js_Tool={
    init:function (name) {
    },
    isNullByNum:function (val) {
        /**
         * 判断数字、浮点是否为空
         *  val
         * @returns
         */
        if (val == undefined || val == null) {
            return true;
        }
        return false;
    },
    isNull:function (val) {
        /**
         * 判断是否为空
         *  val
         * @returns
         */
        if (val == undefined || val == null || val == "" || val == ''
            || val == "undefined" || val == "null" || val == "NULL") {
            return true;
        }
        return false;
    },
    isEmpty:function (source){
        /**
         * 判断字符串是否为空，若为空则返回true否则返回false
         **/
        var str = source.replace(/(^\s*)|(\s*$)/g,"");
        if(str=="" || str.toLowerCase()=="null" || str.length<=0){
            return true;
        }else{
            return false;
        }
    },
    urlAddParmert:function (urls,parameter,value){
        /**
         * 给URL追加参数
         * url
         * parameter 参数名
         * value  参数值
         */
        var buf = '';
        if(!this.isEmpty(urls)){
            buf = urls;
            if(urls.indexOf("?") > -1){  //已经有参数
                buf+="&";
            }else{
                buf+="?";
            }
            buf+=parameter;
            buf+='=';
            buf+=value;
        }
        return buf.toString();
    },
    setNormalLoading:function(obj,urls){
        /**
         * 静态化ajax页面加载  无实时刷新
         *
         */
        var tempUrl = urls;
        tempUrl = this.urlAddParmert(tempUrl,'tempdata',new Date().getTime());
        obj.css('overflow','hidden');
        $.get(tempUrl, {}, function (res) {
            obj.html(res);
        });
    },
    setCyclicLoading:function(obj,urls,delaytime){
        /**
         * 静态化ajax页面加载  有实时刷新
         *
         */
        var tempUrl = urls;
        tempUrl = this.urlAddParmert(tempUrl,'tempdata',new Date().getTime());
        obj.css('overflow','hidden');
        $.get(tempUrl, {}, function (res) {
            obj.html(res);
        });
        window.setInterval(function () {
            var tempUrl2 = urls;
            tempUrl2 = Js_Tool.urlAddParmert(tempUrl2,'tempdata',new Date().getTime());
            $.get(tempUrl2, {}, function (res) {
                obj.html(res);
            });
        }, delaytime);
    },
    /**
          * 获取base 路径信息
          * result getCurWwwPath()	/	getPathName()	/	getLocalhostPath()	/	getProjectName()	/	getBasePath()
          */
    publicMethod:function () {
        //获取当前网址，如： http://localhost:8080/ems/Pages/Basic/Person.jsp
        var curWwwPath = window.document.location.href;
        //获取主机地址之后的目录，如： /ems/Pages/Basic/Person.jsp
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        //获取主机地址，如： http://localhost:8080
        var localhostPath = curWwwPath.substring(0, pos);
        //获取带"/"的项目名，如：/ems
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        //获取项目的basePath   http://localhost:8080/ems/
        var basePath=localhostPath+projectName+"/";
        var baseF = [curWwwPath,pathName,pos,localhostPath,projectName,basePath];
        return baseF;
    },
    getCurWwwPath:function(){
        //获取当前网址
        return this.publicMethod()[0];
    },
    getPathName:function(){
        //获取主机地址之后的目录
        return this.publicMethod()[1];
    },
    getPos:function(){
        //获取终端
        return this.publicMethod()[2];
    },
    getLocalhostPath:function(){
        //获取主机地址
        return this.publicMethod()[3];
    },
    getProjectName:function(){
        //获取带"/"的项目名
        return this.publicMethod()[4];
    },
    getBasePath:function(){
        //获取项目的basePath
        return this.publicMethod()[5];
    },
    setRandomNum:function(l,m,t){
        //随机数   个数/最小数/最大数
        if(!t)t=0;
        var d=[];
        for(var i=0;i<l;i++){
            d.push(parseInt(t+Math.random()*(m-t+1)));
        }
        return d;
    },
    loadjscssfile:function(fileurl,filetype){
        /**
         * 方法说明：【动态加载js文件css文件】
         * 使用方法：loadUtil.loadjscssfile("http://libs.baidu.com/jquery/1.9.1/jquery.js","js")
         * @param fileurl 文件路径，
         * @param filetype 文件类型，支持传入类型，js、css
         */
        if(filetype == "js"){
            var fileref = document.createElement('script');
            fileref.setAttribute("type","text/javascript");
            fileref.setAttribute("src",fileurl);
        }else if(filetype == "css"){

            var fileref = document.createElement('link');
            fileref.setAttribute("rel","stylesheet");
            fileref.setAttribute("type","text/css");
            fileref.setAttribute("href",fileurl);
        }
        if(typeof fileref != "undefined"){
            document.getElementsByTagName("head")[0].appendChild(fileref);
        }else{
            console.log("loadjscssfile method error!");
        }
    },
    getQueryObject:function(url) {
        url = url == null ? window.location.href : url;
        var search = url.substring(url.lastIndexOf("?") + 1);
        var obj = {};
        var reg = /([^?&=]+)=([^?&=]*)/g;
        search.replace(reg, function (rs, $1, $2) {
            var name = decodeURIComponent($1);
            var val = decodeURIComponent($2);
            val = String(val);
            obj[name] = val;
            return rs;
        });
        return obj;
    },
    getTerminalVersions:function (){//判断是哪个终端
        var u = window.navigator.userAgent;
        return {
            trident: u.indexOf('Trident') > -1, //IE内核
            presto: u.indexOf('Presto') > -1, //opera内核
            webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
            mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/), //是否为移动终端
            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
            android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
            iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者安卓QQ浏览器
            iPad: u.indexOf('iPad') > -1, //是否为iPad
            webApp: u.indexOf('Safari') == -1, //是否为web应用程序，没有头部与底部
            weixin: u.indexOf('MicroMessenger') == -1 //是否为微信浏览器
        };
    },
    chkCheckCha:function (chname) {
        /**
         * 判断指定名称的复选框是否被选中
         *
         *            chname复选框名称
         */
        var obj = jQuery("[name='" + chname + "']");
        var isCheck = false;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].checked == true) {
                isCheck = true;
                break;
            }
        }
        return isCheck;
    },
    checkChangedOnly:function (chname) {
        /**
         * 得到指定名称的复选框被选中个数
         *
         *            chname
         * @return {}
         */
        var obj = jQuery("[name='" + chname + "']");
        var count = 0;
        for (var i = 0; i < obj.length; i++) {
            if (obj[i].checked == true) {
                count++;
            }
        }
        return count;
    },
    getValueCheckOnly:function (chname) {
        /**
         * 得到指定名称的单个被选中的复选择框的值
         *
         *            chname
         */
        var str = "";
        jQuery("[name='" + chname + "'][checked]").each(function() {
            str += jQuery(this).val();
        });
        return str;
    },
    getCheckVals:function (chname) {
        /**
         * 得到多个复选框的值
         *
         *            chname
         */
        var str = "";
        jQuery("[name='" + chname + "'][checked]").each(function() {
            str += jQuery(this).val() + "@";
        });
        return str.substring(0, str.length - 1);
    },
    getSomeChVals:function (chname) {
        /**
         * 得到一些复选框的值 复选框的值中是否包含有","若无则用","将多个值组合 若有则先将值用","隔开再用","组合
         *
         *            chname
         */
        var str = "";
        jQuery("[name='" + chname + "'][checked]").each(function() {
            var temp = jQuery(this).val();
            if (temp.indexOf(",") == -1) {
                str += temp + ",";
            } else {
                var tempValue = temp.split(",");
                str += tempValue[0] + ",";
            }
        });
        return str.substring(0, str.length - 1);
    },
    getCheckValues:function (chname) {
        /**
         * 得到指定名称的有多个值的多个复选框的值
         *
         *  chname
         */
        var str = "";
        var sids = "";
        var snames = "";
        jQuery("[name='checkbox'][checked]").each(function() {
            var strval = jQuery(this).val();
            var temp = strval.split(",");
            var sid = temp[0];
            var sname = temp[1];
            sids += sid + ",";
            snames += sname + ", ";
        });
        str = sids.substring(0, sids.length - 1) + "|"
            + snames.substring(0, snames.length - 2);
        return str;
    },
    decideCheckState:function (chname) {
        /**
         * 判断复选框的状态
         *
         *            chname
         */
        var str = this.getCheckVals(chname);
        var tstr = str.split("@");
        var temp = "";
        for (var i = 0; i < tstr.length; i++) {
            var tval = tstr[i];
            var tem = tval.substring(tval.length - 1, tval.length);
            temp += tem;
        }
        return temp;
    },
    checkboxAll:function (chname) {
        /**
         * 复选框全选
         *
         *            chname
         */
        jQuery("[name='" + chname + "']").each(function() {
            jQuery(this).attr("checked", true);
        });
    },
    inverSelect:function (chname) {
        /**
         * 复选框反选
         *
         *            chname
         */
        jQuery("[name='" + chname + "']").each(function() {
            if (jQuery(this).attr("checked")) {
                jQuery(this).attr("checked", false);
            } else {
                jQuery(this).attr("checked", true);
            }
        });
    },
    clearSelect:function (chname) {
        /**
         * 取消全选或反选
         *
         *            chname
         */
        jQuery("[name='" + chname + "']").each(function() {
            jQuery(this).attr("checked", false);
        });
    },
    checkTime:function (timevale) {
        /**
         * 校验时间格式
         *
         *            timevale
         * @return {}
         */
        var regex = /^(([0-1][0-9])|([2][0-4]))(\:)[0-5][0-9](\:)[0-5][0-9]$/g;
        var b = regex.test(timevale);
        return b;
    },
    checkIp:function (ipvale) {
        /**
         * 校验Ip地址格式
         *
         *            ipvale
         */
        var regex = /^([1-9]|[1-9]\d|1\d{2}|2[0-1]\d|22[0-3])(\.(\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])){3}$/;
        var b = regex.test(ipvale);
        return b;
    },
    checkLetOrNum:function (letVale) {
        /**
         * 是否是由字母或数字组成的字符串
         *
         *            letVale
         */
        var regex = /^([a-zA-Z_]{1})([\w]*)$/g;
        var b = regex.test(letVale);
        return b;
    },
    interceptStr:function (source, index) {
        /**
         * 取字符串的第index的字符
         *
         *            source
         *            index
         */
        var temp = source.charAt(index);
        return parseInt(temp);
    },
    checkStr:function (source, targer, beindex, endindex) {
        /**
         * 检查字符串中beindex位置到endindex位置之间是否全由targer组成
         *
         *            source
         *            targer
         *            beindex
         *            endindex
         */
        var flag = false;
        for (var i = beindex; i <= endindex; i++) {
            var temp = source.charAt(i);
            if (targer == temp) {
                flag = true;
            }
        }
        return flag;
    },
    decideString:function (source, target) {
        /**
         * 判断两个字符串是否想等 相等返回true否则返回false
         *
         *            source
         *            target
         */
        return (source == target) ? true : false;
    },
    stringToNumber:function (val){
        /**
         * 将字符串转换成数字
         */
        return Number(val);
    },
    checkIntAndFloat:function (source){
        /**
         * 验证是否是整数或小数
         */
        var regex = /^[0-9]+(\.[0-9]+)?$/g;
        return regex.test(source);
    },
    checkFloat:function (source) {
        /**
         * 验证是否是整数或只有一位小数点的小数
         *
         */
            // var regex=/^[1-9]d*.d{1}|0.d{1}[1-9]d{1}$/g;
        var regex = /^[0-9]+\d*[\.\d]?\d{0,1}$/g;
        return regex.test(source);
    },
    checkTwoInt:function (source) {
        /**
         * 验证是否两位数以内的正整数
         */
        var regex = /^[1-9][0-9]?$/g;  //两位数以内的正整数
        return regex.test(source);
    },
    checkNumber:function (source) {
        /**
         * 验证数字
         *
         */
        var regex = /^(\-|\+)?\d+(\.\d+)?$/;
        return regex.test(source);
    },
    checkTowLenFloat:function (source) {
        /**
         * 验证是否是两位小数的正实数
         *
         */
        var regex = /^[0-9]+(.[0-9]{2})?$/g;//只能输入有两位小数的正实数
        return regex.test(source);
    },
    checkTowLenFloatt:function (source) {
        /**
         * 验证是否是两位或一位小数的正实数
         *
         */
        var regex = /^[0-9]+(.[0-9]{1,2})?$/g;//只能输入有两位小数的正实数
        return regex.test(source);
    },
    checkTowFloat:function (source) {
        /**
         * 验证是否是整数或只有2位小数的数
         *
         */
        var regex = /^[1-9]+\d*[\.\d]?\d{0,2}$/g;
        return regex.test(source);
    },
    checkSpace:function (source) {
        /**
         * 验证是否有空格
         *
         *            source
         */
        var regex = /\s/g;
        return regex.test(source);
    },
    checkIntLeng:function (source) {
        /**
         * 检查一个数是否是整数则位数在8以内
         *
         *            source
         */
        var regex = /^[1-9]{1}[0-9]{1,7}$/g;
        return regex.test(source);
    },
    checkIntTwoLeng:function (source) {
        /**
         * 检查一个数是否是整数则位数在2以内
         *
         *            source
         */
        var regex = /^[1-9]{1}[0-9]{1,2}$/g;
        return regex.test(source);
    },
    checkInt:function (source) {
        /**
         * 验证正整数
         *
         *            source
         */
            // var regex=/^[1-9]d*$/g
        var regex = /^[0-9]*[1-9][0-9]*$/g;
        return regex.test(source);
    },
    checkNegative:function (source) {
        /**
         * 验证非负数
         *
         *            source
         */
        var regex=/^[1-9]\d*|0$/g;
        return regex.test(source);
    },
    getIpNum:function (ipAddress) {
        /**
         * 分割IP地址
         *
         *            ipAddress
         */
        var ip = ipAddress.split(".");
        var a = parseInt(ip[0]);
        var b = parseInt(ip[1]);
        var c = parseInt(ip[2]);
        var d = parseInt(ip[3]);
        var ipNum = a * 256 * 256 * 256 + b * 256 * 256 + c * 256 + d;
        return ipNum;
    },
    decideIp:function (startIp, endIp) {
        /**
         * 判断IP大小
         */
        var ip1 = this.getIpNum(startIp);
        var ip2 = this.getIpNum(endIp);
        return (ip2 > ip1) ? true : false;
    },
    dateToString:function (source,addval){
        /**
         * 时间变化
         * source
         * addval
         */
        var paddval = parseInt(addval);//增量(秒)
        var temp = source.split(":");
        var thrs = parseInt(temp[0])*3600;//小时化成秒
        var tmis = parseInt(temp[1])*60;//分钟化成秒;
        var tss = parseInt(temp[2]);//秒
        var totals = parseInt(thrs)+parseInt(tmis)+parseInt(tss)+parseInt(paddval);
        var result = this.timeTohhmmss(totals);
        return result;
    },
    timeTohhmmss:function (seconds){
        /**
         * 由秒数转化成hh:mm:ss格式
         *seconds
         */
        var hh;
        var mm;
        var ss;
        if(seconds==null || seconds<0){
            return;
        }
        var pseconds = parseInt(seconds);
        //得到小时
        hh = pseconds/3600|0;
        pseconds = parseInt(pseconds)-parseInt(hh)*3600;
        if(parseInt(hh)<10){
            hh="0"+hh;
        }
        if(parseInt(hh)>=24){
            hh="00";
        }
        //得到分钟
        mm = parseInt(pseconds)/60|0;
        //得到秒
        ss = parseInt(pseconds)-parseInt(mm)*60;
        if(parseInt(mm)<10){
            mm = "0"+mm;
        }
        if(parseInt(ss)<10){
            ss = "0"+ss;
        }
        return hh+":"+mm+":"+ss;
    },
    isCardNo:function (num){
        /**
         验证身份证号是否正确
         **/
        if(isNaN(num)){
            console.log("输入的身份证号不是数字！");
            return false;
        }
        var len = num.length;
        if(len<15 || len>18){
            console.log("输入的身份证号码长度不正确定！应为15位或18位");
            return false;
        }
        var re15 = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/;
        var re18 = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
        var res = (re15.test(num) || re18.test(num));
        if(res==false){
            console.log("输入的身份证号格式不正确！");
            return false;
        }
        return res;
    },
    sTelephone:function (source) {
        /**
         * 验证是否为电话号码（座机）
         *
         *            source
         */
        var regex = /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/;
        return regex.test(source);  //search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1
    },
    isMobilePhone:function (source) {
        /**
         * 验证是否为手机号码（移动手机）
         *
         *            source
         */
        var regex = /^((\(\d{3}\))|(\d{3}\-))?1\d{10}/;
        return regex.test(source);
    },
    isEmail:function (source) {
        /**
         * 验证是否为电子邮箱
         *
         *            source
         */
        var regex = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        if(source.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1){
            return true;
        }else{
            console.log("电子邮箱格式不正确");
            return false;
        }
    },
    isZip:function (source){
        /**
         *
         *验证是否为邮编
         *
         *      source
         */
        var regex=/^[1-9]\d{5}$/;
        return regex.test(source);
    },
    isChines:function (source){
        /**
         *
         *验证字符串是否是中文
         *
         **/
        var regex = /^[\u4E00-\u9FA5]+$/;
        return regex.test(source);
    },
    jsContains:function (string,substr,isIgnoreCase){
        /*
         *判断包含关系
         *string:原始字符串
         *substr:子字符串
         *isIgnoreCase:忽略大小写
         */
        if(isIgnoreCase){
            string=string.toLowerCase();
            substr=substr.toLowerCase();
        }
        var startChar=substr.substring(0,1);
        var strLen=substr.length;
        for(var j=0;j<string.length-strLen+1;j++)
        {
            if(string.charAt(j)==startChar)//如果匹配起始字符,开始查找
            {
                if(string.substring(j,j+strLen)==substr)//如果从j开始的字符与str匹配，那ok
                {
                    return true;
                }
            }
        }
        return false;
    },
    makeUUID:function () {
        /**
         * 随机数UUID
         */
        var S4 = function () {
            return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
        };
        //return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
        return (S4() + S4() + S4() + S4() + S4() + S4() + S4() + S4());
    },
    getFileExt:function (filename){
        /**
         * 得到文件的扩展名
         * filename
         */
        var d=/\.[^\.]+$/.exec(filename);
        var ext = new String(d);
        var s = ext.toLowerCase();
        return s;
    },
    strEncode:function (source){
        //字符串编码
        return encodeURIComponent(source);
    },
    strDencode:function (source){
        //字符串解码
        return decodeURIComponent(source);
    },
    strParseInt:function (source){
        /**
         * 字符串转正形
         *  source
         * @returns
         */
        if(this.isEmpty(source) || isNaN(source)){
            return 0;
        }
        return parseInt(source);
    },
    strParseFloat:function (source){
        /**
         * 字符串转Float形
         *  source
         * @returns
         */
        if(this.isEmpty(source) || isNaN(source)){
            return 0;
        }
        return parseFloat(source);
    },
    getTodayDate:function (){
        /**
         * 获取今天日期，星期几
         * @returns
         */
        var now = new Date();
        var yy = now.getFullYear();
        var mm = now.getMonth()+1;
        var dd=now.getDate();
        var day = new Array();
        day[0] = "星期日";
        day[1] = "星期一";
        day[2] = "星期二";
        day[3] = "星期三";
        day[4] = "星期四";
        day[5] = "星期五";
        day[6] = "星期六";
        return( yy + '年' + mm + '月'+ dd +'日 '+day[now.getDay()]);
    },
    getIntervalWeekends:function (beginDate,endDate) {
        /**
         * 获取一段时间中含有的周末数量
         */
        var weekends = 0;
        var dateDiffDays = this.dateDiff("d", beginDate, endDate)+1;
        if(dateDiffDays>0){
            for(var i=0;i<dateDiffDays;i++){
                var newDate = this.dateAdd("d",i,beginDate);
                if(newDate.getDay()==0 || newDate.getDay()==6){
                    weekends++;
                }
            }
        }
        return weekends;
    },
    timeStampString:function (time){
        /**
         * 时间戳转成时间
         *  time
         * @returns
         */
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
        var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
        var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
        return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
    },
    isLeapYear:function(date){
        /**
         * 判断闰年
         */
        return (0==date.getYear()%4&&((date.getYear()%100!=0)||(date.getYear()%400==0)));
    },
    numberLoader:function(obj,nums,times){
        /**
         * 数字加载动画
         */
        var k, i = 1;
        function isInteger(obj) {
            return obj%1 === 0
        }
        function counter() {
            var num = 100;
            if (i <= nums) {
                obj.html(i.toString());
                num = num - i;
                i++;
            } else {
                var numtep;
                if(isInteger(nums)){
                    numtep = nums;
                }else{
                    numtep = parseFloat(nums);
                }
                obj.html(numtep);
                window.clearInterval(k);
            }

        };

        function init() {
            var time = times ? times : 0,
                interval = time/100;
            k = window.setInterval(counter, interval);
        }
        init();
    },
    dateToStr:function(formatStr, date){
        /**
         * 日期对象转换为指定格式的字符串
         * f 日期格式,格式定义如下 yyyy-MM-dd HH:mm:ss
         *  date Date日期对象, 如果缺省，则为当前时间
         *
         * YYYY/yyyy/YY/yy 表示年份
         * MM/M 月份
         * W/w 星期
         * dd/DD/d/D 日期
         * hh/HH/h/H 时间
         * mm/m 分钟
         * ss/SS/s/S 秒
         * string 指定格式的时间字符串
         */
        formatStr = arguments[0] || "yyyy-MM-dd HH:mm:ss";
        date = arguments[1] || new Date();
        var str = formatStr;
        var Week = ['日','一','二','三','四','五','六'];
        str=str.replace(/yyyy|YYYY/,date.getFullYear());
        str=str.replace(/yy|YY/,(date.getYear() % 100)>9?(date.getYear() % 100).toString():'0' + (date.getYear() % 100));
        str=str.replace(/MM/,date.getMonth()>=9?(date.getMonth() + 1):'0' + (date.getMonth() + 1));
        str=str.replace(/M/g,date.getMonth());
        str=str.replace(/w|W/g,Week[date.getDay()]);

        str=str.replace(/dd|DD/,date.getDate()>9?date.getDate().toString():'0' + date.getDate());
        str=str.replace(/d|D/g,date.getDate());

        str=str.replace(/hh|HH/,date.getHours()>9?date.getHours().toString():'0' + date.getHours());
        str=str.replace(/h|H/g,date.getHours());
        str=str.replace(/mm/,date.getMinutes()>9?date.getMinutes().toString():'0' + date.getMinutes());
        str=str.replace(/m/g,date.getMinutes());

        str=str.replace(/ss|SS/,date.getSeconds()>9?date.getSeconds().toString():'0' + date.getSeconds());
        str=str.replace(/s|S/g,date.getSeconds());

        return str;
    },
    dateAdd:function(strInterval, num, date){
        /**
         * 日期计算
         *  strInterval string  可选值 y 年 m月 d日 w星期 ww周 h时 n分 s秒
         *  num int
         *  date Date 日期对象
         *  Date 返回日期对象
         */
        date =  arguments[2] || new Date();
        switch (strInterval) {
            case 's' :return new Date(date.getTime() + (1000 * num));
            case 'n' :return new Date(date.getTime() + (60000 * num));
            case 'h' :return new Date(date.getTime() + (3600000 * num));
            case 'd' :return new Date(date.getTime() + (86400000 * num));
            case 'w' :return new Date(date.getTime() + ((86400000 * 7) * num));
            case 'm' :return new Date(date.getFullYear(), (date.getMonth()) + num, date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds());
            case 'y' :return new Date((date.getFullYear() + num), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds());
        }
    },
    dateDiff:function(strInterval, dtStart, dtEnd) { //如 'd',new Date("2016-8-22"),new Date("2016-8-25")
        /**
         * 比较日期差 dtEnd 格式为日期型或者有效日期格式字符串
         *  strInterval string  可选值 y 年 m月 d日 w星期 ww周 h时 n分 s秒
         *  dtStart Date  可选值 y 年 m月 d日 w星期 ww周 h时 n分 s秒
         *  dtEnd Date  可选值 y 年 m月 d日 w星期 ww周 h时 n分 s秒
         */
        switch (strInterval) {
            case 's' :return parseInt((dtEnd - dtStart) / 1000);
            case 'n' :return parseInt((dtEnd - dtStart) / 60000);
            case 'h' :return parseInt((dtEnd - dtStart) / 3600000);
            case 'd' :return parseInt((dtEnd - dtStart) / 86400000);
            case 'w' :return parseInt((dtEnd - dtStart) / (86400000 * 7));
            case 'm' :return (dtEnd.getMonth()+1)+((dtEnd.getFullYear()-dtStart.getFullYear())*12) - (dtStart.getMonth()+1);
            case 'y' :return dtEnd.getFullYear() - dtStart.getFullYear();
        }
    },
    strToDate:function(dateStr){
        /**
         * 字符串转换为日期对象
         *  date Date 格式为yyyy-MM-dd HH:mm:ss，必须按年月日时分秒的顺序，中间分隔符不限制
         */
        var data = dateStr;
        var reCat = /(\d{1,4})/gm;
        var t = data.match(reCat);
        t[1] = t[1] - 1;
        eval('var d = new Date('+t.join(',')+');');
        return d;
    },
    strFormatToDate:function(formatStr, dateStr){
        /**
         * 把指定格式的字符串转换为日期对象yyyy-MM-dd HH:mm:ss
         *
         */
        var year = 0;
        var start = -1;
        var len = dateStr.length;
        if((start = formatStr.indexOf('yyyy')) > -1 && start < len){
            year = dateStr.substr(start, 4);
        }
        var month = 0;
        if((start = formatStr.indexOf('MM')) > -1  && start < len){
            month = parseInt(dateStr.substr(start, 2)) - 1;
        }
        var day = 0;
        if((start = formatStr.indexOf('dd')) > -1 && start < len){
            day = parseInt(dateStr.substr(start, 2));
        }
        var hour = 0;
        if( ((start = formatStr.indexOf('HH')) > -1 || (start = formatStr.indexOf('hh')) > 1) && start < len){
            hour = parseInt(dateStr.substr(start, 2));
        }
        var minute = 0;
        if((start = formatStr.indexOf('mm')) > -1  && start < len){
            minute = dateStr.substr(start, 2);
        }
        var second = 0;
        if((start = formatStr.indexOf('ss')) > -1  && start < len){
            second = dateStr.substr(start, 2);
        }
        return new Date(year, month, day, hour, minute, second);
    },
    dateToLong:function(date){
        /**
         * 日期对象转换为毫秒数
         */
        return date.getTime();
    },
    longToDate:function(dateVal){
        /**
         * 毫秒转换为日期对象
         *  dateVal number 日期的毫秒数
         */
        return new Date(dateVal);
    },
    isDate:function(str, formatStr){
        /**
         * 判断字符串是否为日期格式
         *  str string 字符串
         *  formatStr string 日期格式， 如下 yyyy-MM-dd
         */
        if (formatStr == null){
            formatStr = "yyyyMMdd";
        }
        var yIndex = formatStr.indexOf("yyyy");
        if(yIndex==-1){
            return false;
        }
        var year = str.substring(yIndex,yIndex+4);
        var mIndex = formatStr.indexOf("MM");
        if(mIndex==-1){
            return false;
        }
        var month = str.substring(mIndex,mIndex+2);
        var dIndex = formatStr.indexOf("dd");
        if(dIndex==-1){
            return false;
        }
        var day = str.substring(dIndex,dIndex+2);
        if(!this.isNumber(year)||year>"2100" || year< "1900"){
            return false;
        }
        if(!this.isNumber(month)||month>"12" || month< "01"){
            return false;
        }
        if(day>this.getMaxDay(year,month) || day< "01"){
            return false;
        }
        return true;
    },
    getMaxDay:function(year,month) {
        /**
         *    输入年月 判断当下月的最大天数
         */
        if(month==4||month==6||month==9||month==11)
            return "30";
        if(month==2)
            if(year%4==0&&year%100!=0 || year%400==0)
                return "29";
            else
                return "28";
        return "31";
    },
    isNumber:function(str){
        /**
         *    变量是否为数字
         */
        var regExp = /^\d+$/g;
        return regExp.test(str);
    },
    toArray:function(myDate){
        /**
         * 把日期分割成数组 [年、月、日、时、分、秒]
         */
        myDate = arguments[0] || new Date();
        var myArray = Array();
        myArray[0] = myDate.getFullYear();
        myArray[1] = myDate.getMonth();
        myArray[2] = myDate.getDate();
        myArray[3] = myDate.getHours();
        myArray[4] = myDate.getMinutes();
        myArray[5] = myDate.getSeconds();
        return myArray;
    },
    datePart:function(interval, myDate){
        /**
         * 取得日期数据信息
         * 参数 interval 表示数据类型
         * y 年 M月 d日 w星期 ww周 h时 n分 s秒
         */
        myDate = arguments[1] || new Date();
        var partStr='';
        var Week = ['日','一','二','三','四','五','六'];
        switch (interval)
        {
            case 'y' :partStr = myDate.getFullYear();break;
            case 'M' :partStr = myDate.getMonth()+1;break;
            case 'd' :partStr = myDate.getDate();break;
            case 'w' :partStr = Week[myDate.getDay()];break;
            case 'ww' :partStr = myDate.WeekNumOfYear();break;
            case 'h' :partStr = myDate.getHours();break;
            case 'm' :partStr = myDate.getMinutes();break;
            case 's' :partStr = myDate.getSeconds();break;
        }
        return partStr;
    },
    maxDayOfDate:function(date){
        /**
         * 取得当前日期所在月的最大天数
         */
        date = arguments[0] || new Date();
        date.setDate(1);
        date.setMonth(date.getMonth() + 1);
        var time = date.getTime() - 24 * 60 * 60 * 1000;
        var newDate = new Date(time);
        return newDate.getDate();
    },
    get_weekData:function (dataNum){
        //往前推n天
        var numTemp = dataNum-1;
        var myDate = new Date();
        myDate.setDate(myDate.getDate() - numTemp);
        var dArray = [];
        var dateArray = [];
        var dateNumArray = [];
        var dateTemp;
        var flag = 1;
        for (var i = 0; i < (numTemp+1); i++) {
            var month = myDate.getMonth()+1;
            var day = myDate.getDate();
            if((month+'').length==1){
                month = "0"+month;
            }
            if((day+'').length==1){
                day = "0"+day
            }
            dateTemp = month+"-"+day;
            dateArray.push(dateTemp);
            dateNumArray.push(day);
            myDate.setDate(myDate.getDate() + flag);
        }
        dArray.push(dateArray);
        dArray.push(dateNumArray);
        return dArray;
    },
    get_weekHour:function (hourNum){
        //往前推n小时
        var numTemp = hourNum-1;
        var hArray = [];
        var hourArray = [];
        var hourNumArray = [];
        var hourTemp;
        var myDate = new Date();
        var hours = myDate.setHours(myDate.getHours() - numTemp);
        var hoursN = myDate.getHours(hours);
        if ((hoursN + '').length == 1) {
            hoursN = "0" + hoursN;
        }
        for (var i = 0; i < (numTemp + 1); i++) {
            datap = myDate.getDate();
            hours = myDate.setHours(myDate.getHours() + 1);
            hoursN = myDate.getHours(hours);
            if ((myDate.getHours(hours) + '').length == 1) {
                hoursN = "0" + hoursN;
            }
            hourTemp = datap + "-" + hoursN;
            hourArray.push(hourTemp);
            hourNumArray.push(hoursN);
        }
        hArray.push(hourArray);
        hArray.push(hourNumArray);
        return hArray;
    },
    numToStr:function (numbers) {
        /**
            * 数字转汉字
            * result （String）
            */
        var ary0=["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
        var ary1=["", "十", "百", "千"];
        var ary2=["", "万", "亿", "兆"];
        var $this = this;
        var ary = function () {
            var aryg = [];
            for (var i = numbers.length; i >= 0; i--) {
                aryg.push(numbers[i]);
            }
            return aryg.join("");
        };
        var zero = "";
        var newary = "";
        var i4 = -1;
        for (var i = 0; i < ary().length; i++) {
            if (i % 4 == 0) { //首先判断万级单位，每隔四个字符就让万级单位数组索引号递增
                i4++;
                newary = ary2[1] + newary; //将万级单位存入该字符的读法中去，它肯定是放在当前字符读法的末尾，所以首先将它叠加入$r中，
                zero = ""; //在万级单位位置的“0”肯定是不用的读的，所以设置零的读法为空

            }
            //关于0的处理与判断。
            if (ary()[i] == '0') { //如果读出的字符是“0”，执行如下判断这个“0”是否读作“零”
                switch (i % 4) {
                    case 0:
                        break;
                    //如果位置索引能被4整除，表示它所处位置是万级单位位置，这个位置的0的读法在前面就已经设置好了，所以这里直接跳过
                    case 1:
                    case 2:
                    case 3:
                        if (ary()[i - 1] != '0') {
                            zero = "零"
                        }
                        ; //如果不被4整除，那么都执行这段判断代码：如果它的下一位数字（针对当前字符串来说是上一个字符，因为之前执行了反转）也是0，那么跳过，否则读作“零”
                        break;

                }

                newary = zero + newary;
                zero = '';
            }
            else { //如果不是“0”
                newary = ary0[parseInt(ary()[i])] + ary1[i % 4] + newary; //就将该当字符转换成数值型,并作为数组ary0的索引号,以得到与之对应的中文读法，其后再跟上它的的一级单位（空、十、百还是千）最后再加上前面已存入的读法内容。
            }

        }
        if (newary.indexOf("零") == 0) {
            newary = newary.substr(1)
        }//处理前面的0
        return newary;
    },
    //金钱计算
    moneyMath:{
        //加
        add:function(a,b){
            var c, d, e;
            try {
                c = a.toString().split(".")[1].length;
            } catch (f) {
                c = 0;
            }
            try {
                d = b.toString().split(".")[1].length;
            } catch (f) {
                d = 0;
            }
            return e = Math.pow(10, Math.max(c, d)), (this.mul(a, e) + this.mul(b, e)) / e;
        },
        //减法
        sub:function(a,b){
            var c, d, e;
            try {
                c = a.toString().split(".")[1].length;
            } catch (f) {
                c = 0;
            }
            try {
                d = b.toString().split(".")[1].length;
            } catch (f) {
                d = 0;
            }
            return e = Math.pow(10, Math.max(c, d)), (this.mul(a, e) - this.mul(b, e)) / e;
        },
        //乘法
        mul:function (a,b) {
            var c = 0,
                d = a.toString(),
                e = b.toString();
            try {
                c += d.split(".")[1].length;
            } catch (f) {}
            try {
                c += e.split(".")[1].length;
            } catch (f) {}
            return Number(d.replace(".", "")) * Number(e.replace(".", "")) / Math.pow(10, c);
        },
        //除法
        div:function (a,b) {
            var c, d, e = 0,
                f = 0;
            try {
                e = a.toString().split(".")[1].length;
            } catch (g) {}
            try {
                f = b.toString().split(".")[1].length;
            } catch (g) {}
            return c = Number(a.toString().replace(".", "")), d = Number(b.toString().replace(".", "")), this.mul(c / d, Math.pow(10, f - e));
        }
    },
    keepTwoDecimal:function(num) {
        var result = parseFloat(num);
        if (isNaN(result)) {
            alert('传递参数错误，请检查！');
            return false;
        }
        result = Math.round(num * 100) / 100;
        return result;
    },
    //数字转大写
    numSmalltoBIG:function (n){
        var fraction = ['角', '分'];
        var digit = ['零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖'];
        var unit = [ ['元', '万', '亿'], ['', '拾', '佰', '仟']  ];
        var head = n < 0? '负': '';
        n = Math.abs(n);

        var s = '';

        for (var i = 0; i < fraction.length; i++){
            s += (digit[Math.floor(this.moneyMath.mul(this.moneyMath.mul(n,10),Math.pow(10, i))) % 10] + fraction[i]).replace(/零./, '');
        }

        s = s || '整';

        n = Math.floor(n);

        for (var i = 0; i < unit[0].length && n > 0; i++){
            var p = '';
            for (var j = 0; j < unit[1].length && n > 0; j++){
                p = digit[n % 10] + unit[1][j] + p;
                n = Math.floor(this.moneyMath.div(n,10));
            }
            s = p.replace(/(零.)*零$/, '').replace(/^$/, digit[0])  + unit[0][i] + s;
        }
        var reslut = head + s.replace(/(零.)*零元/, '元').replace(/(零.)+/g, '零').replace(/^整$/, '零元整');
        var array = reslut.split('元');
        if(array.length == 2 && array[1].indexOf("整") == -1){
            array[1] = '零'+array[1];
            reslut = array.join('元');
        }
        return reslut;
    },
    //验证当前页面 form 是否被修改过
    formIsDirty:function(form) {
        if(jsTool.isNull(form)){
            form = $("body");
        }
        var elements = form.find("input,select,textarea");				//获取输入框控件
        for (var i = 0; i < elements.length; i++) {
            var element = elements[i];
            var type = element.type;
            if (type == "checkbox" || type == "radio") {
                if (element.checked != element.defaultChecked) {
                    return true;
                }
            }else if (type == "hidden" || type == "password" || type == "text" || type == "textarea") {
                if (element.value != element.defaultValue) {
                    return true;
                }
            }else if (type == "select-one" || type == "select-multiple") {
                for (var j = 0; j < element.options.length; j++) {
                    if($(element.options[j]).attr("selected") == "selected"){
                        if (element.options[j].selected != element.options[j].defaultSelected) {
                            return true;
                        }
                    }

                }
            }
        }
        return false;
    },
    //字符串加密
    strEncryption:function ( str ) {
        return window.btoa(unescape(encodeURIComponent( str )));
    },
    //字符串解密
    strDecrypt:function ( str ) {
        return decodeURIComponent(escape(window.atob( str )));
    },
    TableSorter:function (data){
        /*使用说明  :    表格排序
        方法1:
            new jsToll.TableSorter(obj);
        效果:
            id为tb1的table的第一行任意单元格都可以点击进行排序.

        方法2:
            new jsToll.TableSorter(obj, 0, 1, 3);
        效果:
            id为tb1的table的第一行0,1,3单元格可以进行点击排序.
        */
        var TableSorter_Info={
            tableObject : data.obj,
            tableObj : data.obj[0],
            tableObjTem : data.obj[0].innerHTML,
            Rows : [],
            Header : [],
            ViewState : [],
            LastSorted : null,
            NormalCss : "NormalCss",
            SortAscCss : "SortAscCss",
            SortDescCss : "SortDescCss",
            HeaderTemp : "",
            ViewStateTemp : "",
            rowsp:[]
        };

        try {
            if (!jsTool.isNull(data.method)) {
                data.method();
            }
        } catch (e) {
            console.error('表格排序自定义方法错误: ',  e.message);
        }

        TableSorter_Info.init=function(){
            var me=this;
            TableSorter_Info.TableSorterSet(me.tableObj);
        };

        TableSorter_Info.InitSet = function(args)//初始化表格的信息和操作
        {
            var me=this;
            for(var x = 0; x < me.tableObj.rows.length; x++)
            {
                me.Rows.push(me.tableObj.rows[x]);
            }

            me.Header = me.Rows.shift().cells;

            for(var i=0;i<me.Rows.length;i++){
                TableSorter_Info.rowsp[i] = me.Rows[i]
            }

            for(var x = 0; x < (args.length ? args.length : me.Header.length); x++)
            {
                var rowIndex = args.length ? args[x] : x;
                if(rowIndex >= me.Header.length)
                {
                    continue;
                }
                me.ViewState[rowIndex] = "def";
                me.Header[rowIndex].style.cursor = "pointer";
                me.Header[rowIndex].onclick = me.GetFunction(me, "Sort", rowIndex);

                if ($(me.Header[rowIndex]).children("a").length > 0) {
                    $(me.Header[rowIndex]).children("a").remove();
                }
                var container_a = document.createElement('a');
                $(me.Header[rowIndex]).append(container_a);
                var container_a_div_top = document.createElement('div');
                $(container_a).append(container_a_div_top);
                var container_a_div_buttom = document.createElement('div');
                $(container_a).append(container_a_div_buttom);
                $(me.Header[rowIndex]).css("position","relative");
                $(container_a).css({
                    "display": "block",
                    "position": "absolute",
                    "top": "50%",
                    "right": "0",
                    "width": "1em",
                    "height": "1em",
                    "margin-top": "-.5em"
                });
                $(container_a_div_top).css({
                    "border-top": ".25em solid transparent",
                    "border-right": ".35em solid transparent",
                    "border-bottom": ".25em solid rgba(0,0,0,.25)",
                    "border-left": ".35em solid transparent",
                    "position": "absolute",
                    "left": "0",
                    "width": "0",
                    "height": "0",
                    "transition": ".125s ease-in-out",
                    "-webkit-box-sizing": "border-box",
                    "-moz-box-sizing": "border-box",
                    "box-sizing": "border-box"
                });
                $(container_a_div_buttom).css({
                    "border-top": ".25em solid rgba(0,0,0,.25)",
                    "border-right": ".35em solid transparent",
                    "border-bottom": ".25em solid transparent",
                    "border-left": ".35em solid transparent",
                    "position": "absolute",
                    "left": "0",
                    "width": "0",
                    "height": "0",
                    "transition": ".125s ease-in-out",
                    "-webkit-box-sizing": "border-box",
                    "-moz-box-sizing": "border-box",
                    "box-sizing": "border-box"
                });
                if (!jsTool.isNull(data.color)) {
                    $(container_a_div_top).css("border-bottom", ".25em solid "+data.color);
                    $(container_a_div_buttom).css("border-top", ".25em solid "+data.color);
                }

                $(container_a_div_top).css("top","-0.1em");
                $(container_a_div_top).css("opacity","1");

                $(container_a_div_buttom).css("bottom","-0.1em");
                $(container_a_div_buttom).css("opacity","1");
            }
        };
        TableSorter_Info.GetFunction = function(variable,method,param)//取得指定对象的指定方法.
        {
            return function()
            {
                variable[method](param);
            }
        };
        TableSorter_Info.Sort = function(column)//执行排序.
        {
            var me=this;
            var SortAsNumber = true;
            for(var x = 0; x < me.Rows.length && SortAsNumber; x++)
            {
                SortAsNumber = me.IsNumeric(me.Rows[x].cells[column].innerHTML);
            }
            me.Rows.sort(
                function(row1, row2)
                {
                    var result;
                    var value1,value2;
                    value1 = row1.cells[column].innerHTML;
                    value2 = row2.cells[column].innerHTML;
                    if(value1 == value2)
                    {
                        return 0;
                    }
                    if(SortAsNumber)
                    {
                        result = parseFloat(value1) > parseFloat(value2);
                    }
                    else
                    {
                        result = value1 > value2;
                    }
                    result = result ? 1 : -1;
                    return result;
                });
            if(me.ViewState[column] == "def"){
                me.ViewState[column] = "asc";
                if ($(me.Header[column]).children("a").length > 0) {
                    $(me.Header[column]).children("a").remove();
                }
                var container_a = document.createElement('a');
                $(me.Header[column]).append(container_a);
                var container_a_div_top = document.createElement('div');
                $(container_a).append(container_a_div_top);
                var container_a_div_buttom = document.createElement('div');
                $(container_a).append(container_a_div_buttom);
                $(me.Header[column]).css("position","relative");
                $(container_a).css({
                    "display": "block",
                    "position": "absolute",
                    "top": "50%",
                    "right": "0",
                    "width": "1em",
                    "height": "1em",
                    "margin-top": "-.5em"
                });
                $(container_a_div_top).css({
                    "border-top": ".25em solid transparent",
                    "border-right": ".35em solid transparent",
                    "border-bottom": ".25em solid rgba(0,0,0,.25)",
                    "border-left": ".35em solid transparent",
                    "position": "absolute",
                    "left": "0",
                    "width": "0",
                    "height": "0",
                    "transition": ".125s ease-in-out",
                    "-webkit-box-sizing": "border-box",
                    "-moz-box-sizing": "border-box",
                    "box-sizing": "border-box"
                });
                $(container_a_div_buttom).css({
                    "border-top": ".25em solid rgba(0,0,0,.25)",
                    "border-right": ".35em solid transparent",
                    "border-bottom": ".25em solid transparent",
                    "border-left": ".35em solid transparent",
                    "position": "absolute",
                    "left": "0",
                    "width": "0",
                    "height": "0",
                    "transition": ".125s ease-in-out",
                    "-webkit-box-sizing": "border-box",
                    "-moz-box-sizing": "border-box",
                    "box-sizing": "border-box"
                });

                if (!jsTool.isNull(data.color)) {
                    $(container_a_div_top).css("border-bottom", ".25em solid "+data.color);
                    $(container_a_div_buttom).css("border-top", ".25em solid "+data.color);
                }

                $(container_a_div_top).css("top","0.1em");
                $(container_a_div_buttom).css("opacity","0");

                me.LastSorted = me.Header[column];
                var frag = document.createDocumentFragment();
                for(var x = 0; x < me.Rows.length; x++)
                {
                    frag.appendChild(me.Rows[x]);
                }
                me.tableObj.tBodies[0].appendChild(frag);
                me.HeaderTemp = me.Header[column];
                me.ViewStateTemp = me.ViewState[column];
            }else if(me.ViewState[column] == "asc"){
                me.Rows.reverse();
                me.ViewState[column] = "desc";
                if ($(me.Header[column]).children("a").length > 0) {
                    $(me.Header[column]).children("a").remove();
                }
                var container_a = document.createElement('a');
                $(me.Header[column]).append(container_a);
                var container_a_div_top = document.createElement('a');
                $(container_a).append(container_a_div_top);
                var container_a_div_buttom = document.createElement('div');
                $(container_a).append(container_a_div_buttom);

                $(me.Header[column]).css("position","relative");
                $(container_a).css({
                    "display": "block",
                    "position": "absolute",
                    "top": "50%",
                    "right": "0",
                    "width": "1em",
                    "height": "1em",
                    "margin-top": "-.5em"
                });
                $(container_a_div_top).css({
                    "border-top": ".25em solid transparent",
                    "border-right": ".35em solid transparent",
                    "border-bottom": ".25em solid rgba(0,0,0,.25)",
                    "border-left": ".35em solid transparent",
                    "position": "absolute",
                    "left": "0",
                    "width": "0",
                    "height": "0",
                    "transition": ".125s ease-in-out",
                    "-webkit-box-sizing": "border-box",
                    "-moz-box-sizing": "border-box",
                    "box-sizing": "border-box"
                });
                $(container_a_div_buttom).css({
                    "border-top": ".25em solid rgba(0,0,0,.25)",
                    "border-right": ".35em solid transparent",
                    "border-bottom": ".25em solid transparent",
                    "border-left": ".35em solid transparent",
                    "position": "absolute",
                    "left": "0",
                    "width": "0",
                    "height": "0",
                    "transition": ".125s ease-in-out",
                    "-webkit-box-sizing": "border-box",
                    "-moz-box-sizing": "border-box",
                    "box-sizing": "border-box"
                });

                if (!jsTool.isNull(data.color)) {
                    $(container_a_div_top).css("border-bottom", ".25em solid "+data.color);
                    $(container_a_div_buttom).css("border-top", ".35em solid "+data.color);
                }

                $(container_a_div_top).css("opacity","0");
                $(container_a_div_buttom).css("bottom","0.1em");

                me.LastSorted = me.Header[column];
                var frag = document.createDocumentFragment();
                for(var x = 0; x < me.Rows.length; x++)
                {
                    frag.appendChild(me.Rows[x]);
                }
                me.tableObj.tBodies[0].appendChild(frag);
                me.HeaderTemp = me.Header[column];
                me.ViewStateTemp = me.ViewState[column];
            }else if(me.ViewState[column] == "desc"){
                me.Rows.sort(
                    function(row1, row2)
                    {
                        var value1,value2;
                        var rowsN = TableSorter_Info.rowsp;
                        for(var i=0;i<rowsN.length;i++){
                            if(rowsN[i] == row1){
                                value1 = i;
                                break;
                            }
                        }
                        for(var i=0;i<rowsN.length;i++){
                            if(rowsN[i] == row2){
                                value2 = i;
                                break;
                            }
                        }
                        var result;

                        if(value1 == value2)
                        {
                            return 0;
                        }
                        if(SortAsNumber)
                        {
                            result = parseFloat(value1) > parseFloat(value2);
                        }
                        else
                        {
                            result = value1 > value2;
                        }
                        result = result ? 1 : -1;
                        return result;
                    });


                me.ViewState[column] = "def";
                if ($(me.Header[column]).children("a").length > 0) {
                    $(me.Header[column]).children("a").remove();
                }
                var container_a = document.createElement('a');
                $(me.Header[column]).append(container_a);
                var container_a_div_top = document.createElement('a');
                $(container_a).append(container_a_div_top);
                var container_a_div_buttom = document.createElement('div');
                $(container_a).append(container_a_div_buttom);

                $(me.Header[column]).css("position","relative");
                $(container_a).css({
                    "display": "block",
                    "position": "absolute",
                    "top": "50%",
                    "right": "0",
                    "width": "1em",
                    "height": "1em",
                    "margin-top": "-.5em"
                });
                $(container_a_div_top).css({
                    "border-top": ".25em solid transparent",
                    "border-right": ".35em solid transparent",
                    "border-bottom": ".25em solid rgba(0,0,0,.25)",
                    "border-left": ".35em solid transparent",
                    "position": "absolute",
                    "left": "0",
                    "width": "0",
                    "height": "0",
                    "transition": ".125s ease-in-out",
                    "-webkit-box-sizing": "border-box",
                    "-moz-box-sizing": "border-box",
                    "box-sizing": "border-box"
                });
                $(container_a_div_buttom).css({
                    "border-top": ".25em solid rgba(0,0,0,.25)",
                    "border-right": ".35em solid transparent",
                    "border-bottom": ".25em solid transparent",
                    "border-left": ".35em solid transparent",
                    "position": "absolute",
                    "left": "0",
                    "width": "0",
                    "height": "0",
                    "transition": ".125s ease-in-out",
                    "-webkit-box-sizing": "border-box",
                    "-moz-box-sizing": "border-box",
                    "box-sizing": "border-box"
                });
                if (!jsTool.isNull(data.color)) {
                    $(container_a_div_top).css("border-bottom", ".25em solid "+data.color);
                    $(container_a_div_buttom).css("border-top", ".25em solid "+data.color);
                }

                $(container_a_div_top).css("top","-0.1em");
                $(container_a_div_top).css("opacity","1");

                $(container_a_div_buttom).css("bottom","-0.1em");
                $(container_a_div_buttom).css("opacity","1");

                me.LastSorted = me.Header[column];
                var frag = document.createDocumentFragment();
                for(var x = 0; x < me.Rows.length; x++)
                {
                    frag.appendChild(me.Rows[x]);
                }
                me.tableObj.tBodies[0].appendChild(frag);
                me.HeaderTemp = me.Header[column];
                me.ViewStateTemp = me.ViewState[column];
            }
        };
        TableSorter_Info.IsNumeric = function(num)//验证是否是数字类型.
        {
            return /^\d+(\.\d+)?$/.test(num);
        };

        TableSorter_Info.TableSorterSet=function(){
            var me=this;
            if(this.tableObj.rows.length <= 1)
            {
                return;
            }
            var args = [];
            if (!jsTool.isNull(data.order)) {
                args = data.order;
            }
            me.InitSet(args);
        };

        TableSorter_Info.init();
    }

};
//创建class类
function JsTool() {
    this.init.apply(this, arguments);
}
JsTool.prototype = Js_Tool;





//常用工具加载
var jsTool = new JsTool();
//# sourceURL=jsTool v1.0.5

