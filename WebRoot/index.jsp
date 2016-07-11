<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	 <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
  </head>
  
  <body>
    
    	<select id="province">
		<option>请选择省份</option>
		<option>湖南省</option>
		<option>广东省</option>
	</select>

	<select id="city">
		<option>请选择城市</option>
	</select>

	<select id="area">
		<option>请选择区域</option>
	</select>
	

	
	<script type="text/javascript">
		//定位"省份"下拉框，同时提交change事件
		$("#province").change(function(){
			//清空城市下拉框中的内容，除第一项外
			$("#city option:gt(0)").remove();
			//清空区域下拉框中的内容，除第一项外
			$("#area option:gt(0)").remove();
			//获取选中的省份
			var province = $("#province option:selected").text();
			//如果不是"选择省份"的话
			if("请选择省份" != province){
				//异步发送请求到服务器
				//参数一：url表示请求的路径
				var url = "${pageContext.request.contextPath}/findCityRequest?time="+new Date().getTime();
				//参数二：sendData表示以JSON格式发送的数据
				var sendData = {
					"bean.province" : province
				};
				//参数三：function(){}处理或回调函数
				$.post(url,sendData,function(backData,textStatus,ajax){
					//测试 
					//alert( ajax.responseText );
					//测试，backData是一个js对象，cityList是属性
					var array = backData.cityList;
					//数组的长度
					var size = array.length;
					//迭代数组
					for(var i=0;i<size;i++){
						//获取数组中的每个元素
						var city = array[i];
						//创建option元素
						var $option = $("<option>"+city+"</option>");
						//将option元素添加到城市下拉框中
						$("#city").append( $option );
					}
				});
			}
		});					
	</script>
	

	
	<!-- 城市--区域 -->
	<script type="text/javascript">
		//定位"城市"下拉框，同时提交change事件
		$("#city").change(function(){
			//清空区域下拉框中的内容，除第一项外
			$("#area option:gt(0)").remove();
			//获取选中的城市
			var city = $("#city option:selected").text();
			//如果不是"选择省份"的话
			if("请选择城市" != city){
				//异步发送请求到服务器
				//参数一：url表示请求的路径
				var url = "${pageContext.request.contextPath}/findAreaRequest?time="+new Date().getTime();
				//参数二：sendData表示以JSON格式发送的数据
				var sendData = {
					"bean.city" : city
				};
				//参数三：function(){}处理或回调函数
				$.post(url,sendData,function(backData,textStatus,ajax){
					//测试 
					//alert( ajax.responseText );
					//测试，backData是一个js对象，cityList是属性
					var array = backData.areaList;
					//数组的长度
					var size = array.length;
					//迭代数组
					for(var i=0;i<size;i++){
						//获取数组中的每个元素
						var area = array[i];
						//创建option元素
						var $option = $("<option>"+area+"</option>");
						//将option元素添加到区域下拉框中
						$("#area").append( $option );
					}
				});
			}
		});
	</script>
    
    
  </body>
</html>
