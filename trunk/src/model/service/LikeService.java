package model.service;


import model.SpotCollectRecord;
import model.SpotCollectRecordDAO;
import model.SpotCollectRecordId;
import model.SpotCommentRecordDAO;
import model.SpotLikeRecord;
import model.SpotLikeRecordDAO;
import model.SpotLikeRecordId;
import model.dao.SpotCollectRecordDAOHibernate;
import model.dao.SpotLikeRecordDAOHibernate;

public class LikeService {
	static SpotLikeRecordDAO dao = new SpotLikeRecordDAOHibernate();
	static SpotLikeRecordId spotRec = new SpotLikeRecordId();
	static SpotLikeRecord spot =null;
	static SpotCollectRecordDAO daoC = new SpotCollectRecordDAOHibernate();
	static SpotCollectRecordId spotRecCol = new SpotCollectRecordId();
	static SpotCollectRecord spotCol =null;
	
	public static void main(String[] args) {		
		
//		spotRec.setAccountId("M14090004");
//		spotRec.setSpotId("RES14090002");
//		spot = new SpotLikeRecord(spotRec);
		
		
		
	}
	//Like部分
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
	//collect部分
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
	
	
}
