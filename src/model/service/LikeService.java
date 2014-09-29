package model.service;


import model.SpotCollectRecord;
import model.SpotCollectRecordDAO;
import model.SpotCollectRecordId;
import model.SpotLikeRecord;
import model.SpotLikeRecordDAO;
import model.SpotLikeRecordId;
import model.TripCollectRecord;
import model.TripCollectRecordDAO;
import model.TripCollectRecordId;
import model.TripLikeRecord;
import model.TripLikeRecordDAO;
import model.TripLikeRecordId;
import model.dao.SpotCollectRecordDAOHibernate;
import model.dao.SpotLikeRecordDAOHibernate;
import model.dao.TripCollectRecordDAOHibernate;
import model.dao.TripLikeRecordDAOHibernate;

public class LikeService {
	static SpotLikeRecordDAO dao = new SpotLikeRecordDAOHibernate();
	static SpotLikeRecordId spotRec = new SpotLikeRecordId();
	static SpotLikeRecord spot =null;
	
	static SpotCollectRecordDAO daoC = new SpotCollectRecordDAOHibernate();
	static SpotCollectRecordId spotRecCol = new SpotCollectRecordId();
	static SpotCollectRecord spotCol =null;
	
	static TripLikeRecordDAO daoT = new TripLikeRecordDAOHibernate();
	static TripLikeRecordId tripRec = new TripLikeRecordId();
	static TripLikeRecord trip = new TripLikeRecord();
	
	static TripCollectRecordDAO daoTc = new TripCollectRecordDAOHibernate();
	static TripCollectRecordId tripRecCol = new TripCollectRecordId();
	static TripCollectRecord tripCol = new TripCollectRecord();
	
	
	public static void main(String[] args) {		
		
//		spotRec.setAccountId("M14090004");
//		spotRec.setSpotId("RES14090002");
//		spot = new SpotLikeRecord(spotRec);
		
		
		
	}
	//SpotLike部分
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
	public static boolean isLikeEmpty(String AccountId,String SpotId){
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
	//Spotcollect部分
	public static boolean addSpotCollect(String AccountId,String SpotId){
		
		spotRecCol.setAccountId(AccountId);
		spotRecCol.setSpotId(SpotId);
		spotCol = new SpotCollectRecord(spotRecCol);
		if(daoC.insert2(spotCol)==100){
				return true;
			}else{
				return false;
			}
		
	}
	
	public static boolean isCollectEmpty(String AccountId,String SpotId){
		spotRecCol.setAccountId(AccountId);
		spotRecCol.setSpotId(SpotId);
		spotCol = new SpotCollectRecord(spotRecCol);
		if(daoC.select(spotCol)==null){		
			return true;
		}else{
			return false;
			
		}
		
	}
	public static boolean deletSpotCollect(String AccountId,String SpotId){
		
		spotRecCol.setAccountId(AccountId);
		spotRecCol.setSpotId(SpotId);
		spotCol = new SpotCollectRecord(spotRecCol);
		if(daoC.delete(spotCol)==100){
			return true;			
		}else{
			return false;				
		}
	
	}
	
	public static boolean checkSpotCollect(String AccountId,String SpotId){
		
		spotRecCol.setAccountId(AccountId);
		spotRecCol.setSpotId(SpotId);
		spotCol = new SpotCollectRecord(spotRecCol);
		if(daoC.select(spotCol)!=null){
			return true;			
		}else{
			return false;				
		}
	}
	
	
	//TripLike部分
		public static boolean addTripLike(String AccountId,String TripId){
					
			tripRec.setAccountId(AccountId);
			tripRec.setTripId(TripId);
			trip = new TripLikeRecord(tripRec);
			if(daoT.insert2(trip)==100){
					return true;
				}else{
					return false;
				}
			
		}
		public static boolean isTripLikeEmpty(String AccountId,String TripId){
			tripRec.setAccountId(AccountId);
			tripRec.setTripId(TripId);
			trip = new TripLikeRecord(tripRec);
			if(daoT.select(trip)==null){		
				return true;
			}else{
				return false;
				
			}
			
		}
		
		public static boolean deletTripLike(String AccountId,String TripId){
		
			tripRec.setAccountId(AccountId);
			tripRec.setTripId(TripId);
			trip = new TripLikeRecord(tripRec);
			if(daoT.delete(trip)==100){
				return true;			
			}else{
				return false;				
			}
		
		}
		
		
		public static boolean checkTripLike(String AccountId,String TripId){
		
			tripRec.setAccountId(AccountId);
			tripRec.setTripId(TripId);
			trip = new TripLikeRecord(tripRec);
			if(daoT.select(trip)!=null){
				return true;			
			}else{
				return false;				
			}
		}
	
		//Tripcollect部分
		public static boolean addTripCollect(String AccountId,String TripId){
			
			tripRecCol.setAccountId(AccountId);
			tripRecCol.setTripId(TripId);
			tripCol = new TripCollectRecord(tripRecCol);
			if(daoTc.insert2(tripCol)==100){
					return true;
				}else{
					return false;
				}
			
		}
		
		public static boolean isTripCollectEmpty(String AccountId,String TripId){
			tripRecCol.setAccountId(AccountId);
			tripRecCol.setTripId(TripId);
			tripCol = new TripCollectRecord(tripRecCol);			
			if(daoTc.select(tripCol)==null){		
				return true;
			}else{
				return false;
				
			}
			
		}
		public static boolean deletTripCollect(String AccountId,String TripId){
			
			tripRecCol.setAccountId(AccountId);
			tripRecCol.setTripId(TripId);
			tripCol = new TripCollectRecord(tripRecCol);	
			if(daoTc.delete(tripCol)==100){
				return true;			
			}else{
				return false;				
			}
		
		}
		
		public static boolean checkTripCollect(String AccountId,String TripId){
			
			tripRecCol.setAccountId(AccountId);
			tripRecCol.setTripId(TripId);
			tripCol = new TripCollectRecord(tripRecCol);	
			if(daoTc.select(tripCol)!=null){
				return true;			
			}else{
				return false;				
			}
		}
		
}
