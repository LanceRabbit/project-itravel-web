package model.service;

import java.util.List;
import java.util.Set;

import model.SpotDetail;
import model.SpotImg;
import model.dao.SpotDetailDAOHibernate;
import model.util.ConstantsUtil;

public class SearchTripService {
	public List<SpotDetail> searchSpotByGeoInfo() {
		return null;
	}
	
	public List<SpotDetail> searchTripByConditions(String tripName, int day) {
		Boolean multiConditions = false;
		List<SpotDetail> result = null;
		
		
		StringBuffer query = new StringBuffer("FROM SpotDetail spot");
//		if(cityId != null) {
//			if(multiConditions)
//				query.append(" AND spot.cityId = " + cityId);
//			else {
//				query.append("  WHERE spot.cityId = " + cityId);
//				multiConditions = true;
//			}
//		}
		
		
		if((tripName != null) && (tripName.length() > 0)) {
			if(multiConditions)
				query.append(" AND spot.spotName LIKE '%" + tripName + "%'");
			else {
				query.append(" WHERE spot.spotName LIKE '%" + tripName + "%'");
				multiConditions = true;
			}
		}
		
		System.out.println("query string : " + query.toString());
		SpotDetailDAOHibernate dao = new SpotDetailDAOHibernate();
		
		if(day <= 0)
			day = 1;
		
		return dao.selectByHQL(query.append(" ORDER BY spot.spotId").toString(), day);
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
		

	}
}
