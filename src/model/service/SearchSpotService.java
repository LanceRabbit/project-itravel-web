package model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import model.SpotDetail;
import model.SpotDetailDAO;
import model.SpotImg;
import model.SpotInfo;
import model.dao.SpotDetailDAOHibernate;
import model.util.ConstantsUtil;

@Path("/spots")
public class SearchSpotService {
	public static final int SPOTS_PER_PAGE = 6;
	
	public List<SpotDetail> searchSpotByGeoInfo() {
		return null;
	}
	
	private String getQueryStrByConditions(String spotName, String city,
			String category, String subcategory){
		String queryStr = null;
		
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
		
		queryStr = query.append(" ORDER BY spot.creationTime DESC").toString();
		
		return queryStr;
	}
	
	public int getTotalPageCountByConditions (String spotName, String city,
			String category, String subcategory, int pageNo) {
		
		String queryStr = getQueryStrByConditions(spotName, city, category, subcategory);
		
		SpotDetailDAOHibernate dao = new SpotDetailDAOHibernate();
		int count = (int)Math.ceil((double)dao.selectByHQL(queryStr).size() / (double)SPOTS_PER_PAGE);
		//System.out.println("total page count : " + count);
		
		return count;
	}
	
	public List<SpotDetail> searchSpotByConditions(String spotName, String city,
			String category, String subcategory, int pageNo) {
		
		String queryStr = getQueryStrByConditions(spotName, city, category, subcategory);
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
	
	public List<SpotDetail> getNeighborhood(String spotId) {
		List<SpotDetail> neighbors = new ArrayList<SpotDetail>(0);
		
		SpotDetailDAOHibernate dao = new SpotDetailDAOHibernate();
		SpotDetail spot = dao.selectBySpotId(spotId);
		List<SpotDetail> allSpots = dao.selectAll();
		
		for(SpotDetail neighbor : allSpots) {
//			System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
//			System.out.println(neighbor.toString());
			
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
			} else {
//				System.out.println("==================================================");
//				System.out.println("not neighbor spot id : " + neighbor.getSpotId());
			}
		}
		
		return neighbors;
	}
	
	@GET
	@Path("/{spotId}")
	@Produces("application/json;charset=utf-8")
	public SpotInfo getSpotById(@PathParam("spotId") String spotId) {
		
		System.out.println("getSpotById : spot id : " + spotId);
		SpotInfo result = null;
		
		SpotDetailDAO dao = new SpotDetailDAOHibernate();
		SpotDetail spot = dao.selectBySpotId(spotId);
		
		System.out.println("spot : " + spot.toString());
		if(spot != null)
			result = new SpotInfo(spot, null, null, null);
		
		return result;
		//return spot;
	}
	
	@GET
	@Produces("text/html;charset=utf-8")
	public String getMessage() {
		System.out.println("message : .....");
		return "<h1>哈囉, RESTful~</h1>";
	}
	
	public static void main(String[] args) {
		SearchSpotService service = new SearchSpotService();
		
		List<SpotDetail> list = service.searchSpotByConditions(null, null, null, null, 1);
		
		if(list != null) {
			for (Object o : list) {
				SpotDetail spot = (SpotDetail)o;
				
				System.out.println("============================================== " + o.toString() + " : neighbors ==============================================");
				List<SpotDetail> neighbors = service.getNeighborhood(spot.getSpotId());
				
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
