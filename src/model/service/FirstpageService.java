package model.service;

import model.AdDAO;
import model.dao.AdDAOHibernate;

public class FirstpageService {
	AdDAO dao = new AdDAOHibernate();
	
	
	public static void main(String[] args) {
		
	

	}
	
	public AdDAO findAD(){
		
		
		
		return dao;
		
		
	}
	

}
