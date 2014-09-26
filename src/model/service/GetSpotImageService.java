package model.service;

import model.SpotImg;
import model.SpotImgDAO;
import model.dao.SpotImgDAOHibernate;

public class GetSpotImageService {
	public SpotImg getSpotImageById(String imgId) {
		SpotImg result = null;
		SpotImgDAO dao = new SpotImgDAOHibernate();
		
		result = dao.selectByImgId(imgId);
		return result;
	}
}
