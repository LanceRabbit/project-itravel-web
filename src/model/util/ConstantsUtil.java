package model.util;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class ConstantsUtil {
	
	public static Map<String, Integer> getCityMap() {
		return ConstantsUtil.cityMap;
	}
	
	
	private static final Map<String, Integer> cityMap = createCityMap();
    private static Map<String, Integer> createCityMap() {
        Map<String, Integer> result = new HashMap<String, Integer>();
        result.put("基隆", 1);
        result.put("台北", 2);
        return Collections.unmodifiableMap(result);
    }
    
	static {
		createCityMap();
	}

}
