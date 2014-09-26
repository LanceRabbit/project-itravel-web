package model.service;


import model.SpotLikeRecord;
import model.SpotLikeRecordDAO;
import model.SpotLikeRecordId;
import model.dao.SpotLikeRecordDAOHibernate;

public class LikeService {
	static SpotLikeRecordDAO dao = new SpotLikeRecordDAOHibernate();
	static SpotLikeRecordId spotRec = new SpotLikeRecordId();
	static SpotLikeRecord spot =null;
	public static void main(String[] args) {		
		
//		spotRec.setAccountId("M14090004");
//		spotRec.setSpotId("RES14090002");
//		spot = new SpotLikeRecord(spotRec);
		
		
		
	}
	
	public static boolean addSpotLike(String AccountId,String SpotId){
				
		spotRec.setAccountId(AccountId);
		spotRec.setSpotId(SpotId);
		spot = new SpotLikeRecord(spotRec);
		if(dao.insert2(spot)==100){
				return true;
			}else{
				return false;
			}
		
	}
	public static boolean isEmpty(String AccountId,String SpotId){
		spotRec.setAccountId(AccountId);
		spotRec.setSpotId(SpotId);
		spot = new SpotLikeRecord(spotRec);
		if(dao.select(spot)==null){		
			return true;
		}else{
			return false;
			
		}
		
	}
	
	public static boolean deletSpotLike(String AccountId,String SpotId){
	
		spotRec.setAccountId(AccountId);
		spotRec.setSpotId(SpotId);
		spot = new SpotLikeRecord(spotRec);
		if(dao.delete(spot)==100){
			return true;			
		}else{
			return false;				
		}
	
	}
	
	
	public static boolean checkSpotLike(String AccountId,String SpotId){
	
		spotRec.setAccountId(AccountId);
		spotRec.setSpotId(SpotId);
		spot = new SpotLikeRecord(spotRec);
		if(dao.select(spot)!=null){
			return true;			
		}else{
			return false;				
		}
	}
	
}
