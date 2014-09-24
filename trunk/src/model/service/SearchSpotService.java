package model.service;

import java.util.List;
import java.util.Set;

import model.SpotDetail;
import model.SpotImg;
import model.dao.SpotDetailDAOHibernate;
import model.util.ConstantsUtil;

public class SearchSpotService {
	public List<SpotDetail> searchSpotByGeoInfo() {
		return null;
	}
	
	public List<SpotDetail> searchSpotByConditions(String spotName, String city,
			String category, String subcategory, int pageNo) {
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
		
		if((spotName != null) && (spotName.length() > 0)) {
			if(multiConditions)
				query.append(" AND spot.spotName LIKE '%" + spotName + "%'");
			else {
				query.append(" WHERE spot.spotName LIKE '%" + spotName + "%'");
				multiConditions = true;
			}
		}
		
		System.out.println("query string : " + query.toString());
		SpotDetailDAOHibernate dao = new SpotDetailDAOHibernate();
		
		if(pageNo <= 0)
			pageNo = 1;
		
		return dao.selectByHQL(query.append(" ORDER BY spot.spotId").toString(), pageNo);
	}
	
	public SpotImg getSpotThumbnail(SpotDetail spot) {
		SpotImg result = null;
		Set<SpotImg> spotImgs = spot.getSpotImgs();
		if((spotImgs != null) && (spotImgs.size() > 0)) {
			for (SpotImg thumbnail : spotImgs) {
				if(thumbnail.getImgOrder() == 1) {
					result = thumbnail;
					break;
				}
			}
		}
		
		return result;
	}
	
	public static void main(String[] args) {
		SearchSpotService service = new SearchSpotService();
		List<SpotDetail> list = service.searchSpotByConditions(null, null, null, null, 1);
		
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
