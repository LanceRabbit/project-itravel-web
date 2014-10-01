package model.service;

import java.util.List;
import java.util.Set;

import model.Account;
import model.AccountDAO;
import model.SpotCollectRecord;
import model.SpotCollectRecordDAO;
import model.SpotCollectRecordId;
import model.SpotDetail;
import model.Trip;
import model.TripCollectRecord;
import model.TripCollectRecordDAO;
import model.TripCollectRecordId;
import model.dao.AccountDAOHibernate;
import model.dao.SpotCollectRecordDAOHibernate;
import model.dao.TripCollectRecordDAOHibernate;

public class MyCollectService {
	SpotCollectRecordDAO dao = new SpotCollectRecordDAOHibernate();
	AccountDAO daoAcc = new AccountDAOHibernate();
	TripCollectRecordDAO daoTrip = new TripCollectRecordDAOHibernate();

	public static void main(String[] args) {

	}

	// 測試用
	public boolean isEmptySpotCollect(String AccountId) {
		return true;
	}

	// 刪除收藏
	public boolean deletSpotCollect(String AccountId, String SpotId) {
		SpotCollectRecordId spotColRec = new SpotCollectRecordId();
		SpotCollectRecord spot = new SpotCollectRecord();
		spotColRec.setAccountId(AccountId);
		spotColRec.setSpotId(SpotId);
		spot.setId(spotColRec);
		dao.delete(spot);

		return true;
	}

	// 尋找有無收藏紀錄
	public List<SpotCollectRecord> searchSpotCollect(String AccountId) {
		List<SpotCollectRecord> result = dao.selectListByAccountId(AccountId);

		return result;
	}

	// 以account找景點資訊
	public Set<SpotDetail> searchDetail(String AccountId) {
		Account acc = new Account();
		acc = daoAcc.selectById(AccountId);
		Set<SpotDetail> result = acc.getSpotCollect();

		return result;
	}

	// 刪除行程收藏
	public boolean deletTripCollect(String AccountId, String TripId) {
		TripCollectRecordId tripColRec = new TripCollectRecordId();
		TripCollectRecord trip = new TripCollectRecord();
		tripColRec.setAccountId(AccountId);
		tripColRec.setTripId(TripId);
		trip.setId(tripColRec);
		daoTrip.delete(trip);

		return true;
	}

	// 尋找有無景點收藏紀錄
	public List<TripCollectRecord> searchTripCollect(String AccountId) {
		List<TripCollectRecord> result = daoTrip
				.selectListByAccountId(AccountId);

		return result;
	}

	// 以account找景點資訊
	public Set<Trip> searchTripDetail(String AccountId) {
		Account acc = new Account();
		acc = daoAcc.selectById(AccountId);
		Set<Trip> result = acc.getTripCollect();

		return result;
	}

}
