package model.service;

import java.util.List;

import model.SpotDetail;
import model.dao.SpotDetailDAOHibernate;
import model.util.ConstantsUtil;

public class SearchSpotService {
	public List<SpotDetail> searchSpotByGeoInfo() {
		return null;
	}
	
	public List<SpotDetail> searchSpotByConditions(String spotName, String city,
			String category, String subcategory) {
		Boolean multiConditions = false;
		List<SpotDetail> result = null;
		
		Integer cityId = ConstantsUtil.getCityMap().get(city);
		Integer categoryId = ConstantsUtil.getCategoryMap().get(category);
		String subcategoryId = ConstantsUtil.getSubcategoryMap().get(subcategory);
		
		StringBuffer query = new StringBuffer("FROM SpotDetail spot");
		if(cityId != null) {
			if(multiConditions)
				query.append(" AND spot.cityId = " + cityId);
			else {
				query.append("  WHERE spot.cityId = " + cityId);
				multiConditions = true;
			}
		}
		
		if(categoryId != null) {
			if(multiConditions)
				query.append(" AND spot.categoryId = " + categoryId);
			else {
				query.append(" WHERE spot.categoryId = " + categoryId);
				multiConditions = true;
			}
		}
				
		if((subcategoryId != null) && (subcategoryId.length() > 0)) {
			if(multiConditions)
				query.append(" AND spot.subcategoryId = " + subcategoryId);
			else {
				query.append(" WHERE spot.subcategoryId = " + subcategoryId);
				multiConditions = true;
			}
		}
		
		System.out.println("query string : " + query.toString());
		SpotDetailDAOHibernate dao = new SpotDetailDAOHibernate();
		return dao.selectByHQL(query.append(" ORDER BY spot.likeCount").toString());
	}
	
	public static void main(String[] args) {
		SearchSpotService service = new SearchSpotService();
		List<SpotDetail> list = service.searchSpotByConditions(null, null, null, null);
		
		if(list != null) {
			for (Object o : list) {
				System.out.println(o);
			}
		}
		else {
			System.out.println("null list....");
		}
	}
}
