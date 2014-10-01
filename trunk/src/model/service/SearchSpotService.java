package model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import model.SpotDetail;
import model.SpotDetailDAO;
import model.SpotImg;
import model.SpotInfo;
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
		
		String queryStr = query.append(" ORDER BY spot.creationTime DESC").toString();
		System.out.println("query string : " + queryStr);
		SpotDetailDAOHibernate dao = new SpotDetailDAOHibernate();
		
		if(pageNo <= 0)
			pageNo = 1;
		
		return dao.selectByHQL(queryStr, pageNo);
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
	
	public SpotInfo getSpotIfoById(String spotId, String viewer, String webAppURL, String deployDir) {
		SpotInfo result = null;
		
		SpotDetailDAO dao = new SpotDetailDAOHibernate();
		SpotDetail spot = dao.selectBySpotId(spotId);
		if(spot != null)
			result = new SpotInfo(spot, viewer, webAppURL, deployDir);
		
		return result;
	}
	
	private double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}
	
	private double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}

	private double distanceInKM(SpotDetail spot1, SpotDetail spot2) {
		double dist = -1.0; // distance can't be calculated
		
		double lon1 = (spot1.getLongitude() == null)? 0.0 : spot1.getLongitude().doubleValue();
		double lon2 = (spot2.getLongitude() == null)? 0.0 : spot2.getLongitude().doubleValue();
		
		double lat1 = (spot1.getLatitude() == null)? 0.0 : spot1.getLatitude().doubleValue();
		double lat2 = (spot2.getLatitude() == null)? 0.0 : spot2.getLatitude().doubleValue();
		
		if(((lon1 == 0.0) && (lat1 == 0.0)) || ((lon2 == 0.0) && (lat2 == 0.0))) 
			return dist;
		
		double theta = lon1 - lon2;
		dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;
		dist = dist * 1.609344;

		return dist;
	}
	
	public List<SpotDetail> getNeighborhood(SpotDetail spot) {
		List<SpotDetail> neighbors = new ArrayList<SpotDetail>(0);
		
		SpotDetailDAOHibernate dao = new SpotDetailDAOHibernate();
		List<SpotDetail> allSpots = dao.selectAll();
		
		for(SpotDetail neighbor : allSpots) {
			if(neighbor.getSpotId().equals(spot.getSpotId())) {
//				System.out.println("==================================================");
//				System.out.println("spot id : " + spot.getSpotId());
//				System.out.println("neighbor id : " + neighbor.getSpotId());
				continue;
			}
			
			double dist = distanceInKM(spot, neighbor); 
			if( (dist > 0.0) && ( dist < 5.0)) {
//				System.out.println("==================================================");
//				System.out.println("spot id : " + spot.getSpotId());
//				System.out.println("neighbor id : " + neighbor.getSpotId());
//				System.out.println("dist : " + dist);
				neighbors.add(neighbor);
			}
		}
		
		return neighbors;
	}
	
	public static void main(String[] args) {
		SearchSpotService service = new SearchSpotService();
		
		List<SpotDetail> list = service.searchSpotByConditions(null, null, null, null, 1);
		
		if(list != null) {
			for (Object o : list) {
				SpotDetail spot = (SpotDetail)o;
				
				System.out.println("============================================== " + o.toString() + " : neighbors ==============================================");
				List<SpotDetail> neighbors = service.getNeighborhood(spot);
				
				for(SpotDetail neighbor : neighbors) {
					System.out.println(neighbor.toString());
				}
			}
		}
		else {
			System.out.println("null list....");
		}
	}
}
