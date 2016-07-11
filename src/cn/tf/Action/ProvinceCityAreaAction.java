package cn.tf.Action;

import java.util.List;


import com.opensymphony.xwork2.ActionSupport;

public class ProvinceCityAreaAction extends ActionSupport {
	//业务层
		private ProvinceCityAreaService provinceCityAreaService = new ProvinceCityAreaService();
		//Bean是实体，封装省份和城市
		private Bean bean;
		public Bean getBean() {
			return bean;
		}
		public void setBean(Bean bean) {
			this.bean = bean;
		}
		/**
		 * 根据省份查询城市
		 */
		public String findCityByProvince() throws Exception{
			cityList = provinceCityAreaService.findCityByProvince(bean.getProvince());
			//将List集合转成JSON文本
			return SUCCESS;
		}
		/**
		 * 根据城市查询区域
		 */
		public String findAreaByCity() throws Exception{
			areaList = provinceCityAreaService.findAreaByCity(bean.getCity());
			//将List集合转成JSON文本
			return SUCCESS;
		}
		
		
		
		
		private List<String> cityList;//需要转成JSON的集合，且为其设置值
		private List<String> areaList;//需要转成JSON的集合，且为其设置值

		public List<String> getCityList() {//插件会调用getXxx()方法来获取需要转成JSON的集合
			return cityList;
		}
		public List<String> getAreaList() {
			return areaList;
		}
	
}
