package model.service;

import java.util.Date;
import java.util.List;

import model.Account;
import model.BlacklistRecord;
import model.BlacklistRecordDAO;
import model.BlacklistRecordId;
import model.CommentInfo;
import model.SpotCommentRecord;
import model.SpotCommentRecordDAO;
import model.dao.BlacklistRecordDAOHibernate;
import model.dao.SpotCommentRecordDAOHibernate;

public class CommentService {
	public int createComment(String commenter, String spotId, String comment) {
		int result = -1;
		
		SpotCommentRecordDAO dao = new SpotCommentRecordDAOHibernate();
		SpotCommentRecord record = new SpotCommentRecord();

		 java.util.Date date = new java.util.Date();
		 record.setCmtDt(date);
		 record.setComment(comment);
		 record.setTempCommentId("TEMP");
		 record.setAccountId(commenter);
		 record.setSpotId(spotId);
		 SpotCommentRecord newRecord = dao.insert(record);
		
		if(newRecord != null) {
			result = 0;
			
			newRecord.toString();
		}
		
		return result;
	}
	
	public void setCommenterNickname(List<CommentInfo> comments) {
		for(CommentInfo comment : comments) {
			AccountService service = new AccountService();
			Account commenter = service.selectById(comment.getCommenterId());
			comment.setCommenterNickname(commenter.getNickname());
		}
	}
	
	public int reportInvalidComment(String reporterId, String reportedId, String commentId, String report) {
		// 0 for success
		int result = -1;
		
		BlacklistRecord bRecord = new BlacklistRecord();
		BlacklistRecordId id = new BlacklistRecordId();
		id.setReporterId(reporterId);
		id.setReportedId(reportedId);
		id.setCommentId(commentId);
		bRecord.setId(id);
		bRecord.setReason(report);
		bRecord.setReportDt(new java.util.Date());
		bRecord.setStatus(0);
		
		//SpotCommentRecordDAO commentDAO = new SpotCommentRecordDAOHibernate();
		//commentDAO.update(commentId, "");
		
		BlacklistRecordDAO bListDAO =new BlacklistRecordDAOHibernate();
		bRecord = bListDAO.insert(bRecord);
		if(bRecord != null)
			result = 0;
		
		return result;
	}
}
