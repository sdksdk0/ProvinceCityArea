package cn.tf.Action;

import java.util.ArrayList;
import java.util.List;

public class ProvinceCityAreaService {
	
	//根据省份查询城市
	public  List<String>  findCityByProvince(String province) throws Exception{
		List<String>  cityList=new ArrayList<String>();
		
		if("广东省".equals(province)){
			cityList.add("广州");
			cityList.add("深圳");
			cityList.add("中山");
			
		}else if("湖南省".equals(province)){
			cityList.add("长沙");
			cityList.add("衡阳");
		}
		return cityList;	
	}
	
	
	//根据城市查询区域
	public  List<String>  findAreaByCity(String city) throws Exception{
		List<String>  areaList=new ArrayList<String>();
		if("广州".equals(city)){
			areaList.add("天河");
			areaList.add("白云");
		}else if("深圳".equals(city)){
			areaList.add("宝安");
			areaList.add("南山");
		}else if("中山".equals(city)){
			areaList.add("AA");
			areaList.add("BB");
		}else if("长沙".equals(city)){
			areaList.add("星沙");
			areaList.add("雨花区");
		}else if("衡阳".equals(city)){
			areaList.add("珠晖区");
			areaList.add("衡南");
		}
		return areaList;
	
	}

}
