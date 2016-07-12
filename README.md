# ProvinceCityArea
省市区三级级联的一个项目，采用struts2+jsp做一个非数据库型案例项目

导入struts2-json-plugin-2.3.1.1.jar包到/WEB-INF/lib目录下
		自已的包继承json-default包，且json-default包继承struts-default包
		那么自已的包能用到json-default和struts-default这二个包中的功能
	在Action中写一个getXxx()方法返回需要转成JSON字符串的对象 
