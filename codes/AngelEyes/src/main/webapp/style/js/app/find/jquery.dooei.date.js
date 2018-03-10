/*
文件名:jquery.dooei.date.js
版本：Ver 1.03 完整版
功能说明:日期联动选择JS封装类
作者:张云浩
编写日期:2008/03/12  
QQ:4256780
Email:zyh@mye.cc 
网址:http://www.dooei.com
版权所有:吉智动维(吉林)科技有限公司
*/
function InitDooeiDate(obj_year, obj_month, obj_day) {
    var date = new Date(); //实例化一个日期对象
    var year = date.getFullYear(); //获取当前年份
    var month = date.getMonth() + 1; //获取当前月份
    var day = date.getDate(); //获取当前日
    var yearOptions = '';
    var monthOptions = '';
    var dayOptions = '';

    yearOptions = addOption(1932, 0); //定义年份选项，第一个参数为开始年份。
    $('#'+obj_year).html(yearOptions); //添加月份选项
    $("#"+obj_year).attr("value", year); //定位当前年
    monthOptions = addOption(month, 1); //定义月份选项
    $('#'+obj_month).html(monthOptions); //添加月份选项
    $("#"+obj_month).attr("value", month); //定位月份
    dayOptions = addOption(day, 2); //定义日选项
    $('#'+obj_day).html(dayOptions); //添加日选项
    $("#"+obj_day).attr("value", day); //定位日

    //年选择器函数
    $("#"+obj_year).change(function () {
        var tmpYear = $("#"+obj_year).val(); //获取当前年选择器的值
        var tmpMonth = $("#"+obj_month).val(); //获取当前月选择器的值
        var tmpDay = $("#"+obj_day).val(); //获取当前日选择器的值
        var days = getDays(tmpYear, tmpMonth); //获取当前的年月有多少天
        if (tmpYear == year) {//判断是否为当前年
            monthOptions = addOption(month, 1);
            $('#'+obj_month).html(monthOptions);
            $("#"+obj_month).attr("value", tmpMonth);
            if (tmpMonth == month) {//判断是否为当前月
                tmpDays = day;
                tmpDay = tmpDay > tmpDays ? tmpDays : tmpDay; //防止当前选择大于本月最大值
            } else {
                tmpDays = days;
                tmpDay = tmpDay > days ? days : tmpDay; //防止当前日大于本月最大值，如当前日为31，当前月选择为2月获取4月等，最大值不到31
            }
            dayOptions = addOption(tmpDays, 2);
            $('#'+obj_day).html(dayOptions);
            $("#"+obj_day).attr("value", tmpDay);

        } else {
            monthOptions = addOption(12, 1);
            $('#'+obj_month).html(monthOptions);
            $("#"+obj_month).attr("value", tmpMonth);

            dayOptions = addOption(days, 2);
            $('#'+obj_day).html(dayOptions);
            $("#"+obj_day).attr("value", tmpDay);
        }
    });
    //月选择器选择函数
    $("#"+obj_month).change(function () {
        var tmpYear = $("#"+obj_year).val(); //获取当前年选择器的值
        var tmpMonth = $("#"+obj_month).val(); //获取当前月选择器的值
        var tmpDay = $("#"+obj_day).val(); //获取当前日选择器的值
        var days = getDays(tmpYear, tmpMonth); //获取当前的年月有多少天
        if (tmpYear == year && tmpMonth == month) {//判断是否为当前年而且当前月
            tmpDays = day;
            tmpDay = tmpDay > tmpDays ? tmpDays : tmpDay; //防止当前选择大于本月最大值
        } else {
            tmpDays = days;
            tmpDay = tmpDay > days ? days : tmpDay; //防止当前日大于本月最大值，如当前日为31，当前月选择为2月获取4月等，最大值不到31
        }
        dayOptions = addOption(tmpDays, 2);
        $('#'+obj_day).html(dayOptions);
        $("#"+obj_day).attr("value", tmpDay);
    });
    function getDays(years, months) {//获取某年的某月有多少天

        var d = new Date(years, months, 0);
        days = d.getDate();
        return days;
    }
    function addOption(length, option) {//length表示当前选项的长度,当option为0时，length为开始年份，option：0：为添加年,1为添加月，2为添加天
        newOptions = '';
        if (option == 0) {
            var tmpLen = year - parseInt(length) + 1;
            for (i = 0; i < tmpLen; i++) {
                newOptions += "<option value='" + (i + length) + "'>" + (i + length) + "年</option>";
            }
        } else {
            var option = option == 1 ? "月" : "日";
            for (i = 1; i <= length; i++) {
                newOptions += "<option value='" + i + "'>" + i + option + "</option>";
            }
        }
        return newOptions;
    }
}
