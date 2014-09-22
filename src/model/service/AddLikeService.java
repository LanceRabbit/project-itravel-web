package model.service;


import model.SpotLikeRecord;
import model.SpotLikeRecordDAO;
import model.SpotLikeRecordId;
import model.dao.SpotLikeRecordDAOHibernate;

public class AddLikeService {
	static SpotLikeRecordDAO dao = new SpotLikeRecordDAOHibernate();
	public static void main(String[] args) {
		SpotLikeRecordId spotRec = new SpotLikeRecordId();
		SpotLikeRecord spot =null;
		
		spotRec.setAccountId("M14090004");
		spotRec.setSpotId("RES14090002");
		spot = new SpotLikeRecord(spotRec);
		if(addSpotLike(spot)){
			System.out.println("like成功");
		}else{
			System.out.println("重複資料");
		}
		
		
	}
	
	public static boolean addSpotLike(SpotLikeRecord spot){
			if(dao.insert2(spot)==100){
				return true;
			}else{
				return false;
			}
		
	}


}
