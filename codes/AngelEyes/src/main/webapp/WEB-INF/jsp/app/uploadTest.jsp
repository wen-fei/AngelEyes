<%--
  Created by IntelliJ IDEA.
  User: TenYun
  Date: 2018/3/16
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form  method="post" id="test">
    选择文件:<input type="file" name="file" width="120px" >
    <input type="submit" value="上传" id="submitBtn">
</form>
</body>
<script src="../../../style/js/jquery.min.js"></script>
<script src="../../../style/js/bootstrap.js"></script>
<script>
    $(function(){
        $("#submitBtn").click(function(){
            var form = new FormData($("#test")[0]);
            alert(form);
            $.ajax({
                url: "${pageContext.request.contextPath}/app/loster/upload",
                type: 'post',
                data: form,
                cache: false,
                dataType: 'JSON',
                processData: false,
                contentType: false,
                success: function (data, status) {
                    if (data === "1") {
                        // alert("上传成功");
                        // window.location.reload();
                    } else if (data === "0") {
                        // alert("上传失败");
                    }
                },
                error: function (xhr, textStatus, errorThrown) {
                    // alert("error！");
                }
            });
        });
    });
</script>
</html>
