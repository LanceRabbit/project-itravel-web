package model.service;



import java.util.List;
import java.util.Set;

import org.json.JSONException;

import model.Account;
import model.AccountDAO;
import model.SpotCollectRecord;
import model.SpotCollectRecordDAO;
import model.SpotCollectRecordId;
import model.SpotDetail;
import model.dao.AccountDAOHibernate;
import model.dao.SpotCollectRecordDAOHibernate;

public class MyCollectService {
	SpotCollectRecordDAO dao = new SpotCollectRecordDAOHibernate();
	AccountDAO daoAcc = new AccountDAOHibernate();
	
	
	
	public static void main(String[] args) {
		
		
		

	}
	
	//測試用
	public boolean isEmptySpotCollect(String AccountId){
		return true;
	}
	
	//刪除收藏
	public boolean deletSpotCollect(String AccountId,String SpotId){
		SpotCollectRecordId spotColRec = new SpotCollectRecordId();
		SpotCollectRecord spot = new SpotCollectRecord();
		spotColRec.setAccountId(AccountId);
		spotColRec.setSpotId(SpotId);
		spot.setId(spotColRec);
		dao.delete(spot);		
		
		return true;		
	}
	
	//尋找有無收藏紀錄
	public List<SpotCollectRecord> searchSpotCollect(String AccountId) {
		List<SpotCollectRecord> result = dao.selectListByAccountId(AccountId);
		
		return result;		
	}
	//
	public Set<SpotDetail> searchDetail(String AccountId) {
		Account acc = new Account();
		acc = daoAcc.selectById(AccountId);
		Set<SpotDetail> result = acc.getSpotCollect();
		
		
		
		return result;		
	}
	

}
