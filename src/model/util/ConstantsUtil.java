package model.util;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class ConstantsUtil {
	
	public static Map<String, Integer> getCityMap() {
		return ConstantsUtil.cityMap;
	}
	
	public static Map<String, Integer> getCategoryMap() {
		return ConstantsUtil.categoryMap;
	}
	
	public static Map<String, String> getSubcategoryMap() {
		return ConstantsUtil.subcategoryMap;
	}
	
	
	private static final Map<String, Integer> cityMap = createCityMap();
	private static final Map<String, Integer> categoryMap = createCategoryMap();
	private static final Map<String, String> subcategoryMap = createSubcategoryMap();
	
    private static Map<String, Integer> createCityMap() {
        Map<String, Integer> result = new HashMap<String, Integer>();
        
        result.put("基隆", new Integer(1));
        result.put("台北", new Integer(2));
        result.put("桃園", new Integer(3));
        result.put("新竹", new Integer(4));
        result.put("苗栗", new Integer(5));
        result.put("彰化", new Integer(6));
        result.put("台中", new Integer(7));
        result.put("南投", new Integer(8));
        result.put("雲林", new Integer(9));
        result.put("嘉義", new Integer(10));
        result.put("台南", new Integer(11));
        result.put("高雄", new Integer(12));
        result.put("屏東", new Integer(13));
        result.put("綠島", new Integer(14));
        result.put("蘭嶼", new Integer(15));
        result.put("澎湖", new Integer(16));
        result.put("金門", new Integer(17));
        result.put("馬祖", new Integer(18));
        return Collections.unmodifiableMap(result);
    }
    
    private static Map<String, Integer> createCategoryMap() {
        Map<String, Integer> result = new HashMap<String, Integer>();
        
        result.put("美食", new Integer(1));
        result.put("購物", new Integer(2));
        result.put("住宿", new Integer(3));
        result.put("景點", new Integer(4));
        result.put("活動", new Integer(5));
        
        return Collections.unmodifiableMap(result);
    }
    
    private static Map<String, String> createSubcategoryMap() {
        Map<String, String> result = new HashMap<String, String>();
        
        result.put("餐廳", "RES");
        result.put("小吃", "VEN");
        result.put("美食街", "CAF");
        result.put("甜品", "SWT");
        result.put("其他", "OTH");
        result.put("百貨公司", "DEP");
        result.put("大賣場", "MAL");
        result.put("個性商店", "SHO");
        result.put("路邊攤", "STR");
        result.put("飯店", "HOT");
        result.put("旅舍", "HOS");
        result.put("民宿", "HOM");
        result.put("營地", "CAM");
        result.put("風景區", "NAT");
        result.put("國家公園", "PAR");
        result.put("古蹟", "HIS");
        result.put("遊樂園", "LAN");
        result.put("藝文展覽", "ART");
        result.put("親子活動", "FAM");
        result.put("競賽活動", "GAM");
        return Collections.unmodifiableMap(result);
    }
    
	static {
		createCityMap();
		createCategoryMap();
		createSubcategoryMap();
	}

}
