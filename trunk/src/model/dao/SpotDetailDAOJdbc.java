package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import model.Account;
import model.SpotDetail;
import model.SpotDetailDAO;

public class SpotDetailDAOJdbc implements SpotDetailDAO {
	private static final String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=iiiTravel";
	private static final String SELECT = "SELECT * FROM SPOT_DETAIL WHERE SPOT_ID=?";
	private static final String INSERT = "INSERT INTO SPOT_DETAIL "
			+ "(ACCOUNT_ID, LEADER, SPOT_NAME, CITY_ID, ADDRESS,"
			+ "PHONE, LONGITUDE, LATITUDE, SPOT_INTRO, LIKE_COUNT, CATEGORY_ID, SUBCATEGORY_ID,TEMP_SPOT_ID ) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

	public SpotDetail insert(SpotDetail spot) {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			stmt = conn.prepareStatement(INSERT);
			stmt.setString(1, spot.getAccount().getAccountId());
			stmt.setString(2, "");
			stmt.setString(3, "MOS Bugger");
			stmt.setInt(4, 2);
			stmt.setString(5, "");
			stmt.setInt(6, 2);
			stmt.setFloat(7, 0);
			stmt.setFloat(8, 0);
			stmt.setString(9, "");
			stmt.setInt(10, 0);
			stmt.setInt(11, 5);
			stmt.setString(12, "RES");
			stmt.setString(13, "RES");
			stmt.execute();
//			if(rset.next()) {
//				spot = new SpotDetail();
//				spot.setSpotId(rset.getString("SPOT_ID"));
//				spot.setAccount(new Account(rset.getString("ACCOUNT_ID"), "user1@gmail.com", "", ""));
//				spot.setSpotName(rset.getString("SPOT_NAME"));
//				spot.setCityId(rset.getInt("CITY_ID"));
//				spot.setSubcategoryId(rset.getString("SUBCATEGORY_ID"));
//				spot.setCategoryId(rset.getInt("CATEGORY_ID"));
//				spot.setSpotIntro(rset.getString("SPOT_INTRO"));
//			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset!=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return spot;
	}

	public int delete(SpotDetail spot) {
		return 0;
	}

	public SpotDetail update(SpotDetail spot) {
		return null;
	}

	public SpotDetail select(String id) {
		SpotDetail spot = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		try {
			conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
			stmt = conn.prepareStatement(SELECT);
			stmt.setString(1, id);
			
			rset = stmt.executeQuery();
			if(rset.next()) {
				spot = new SpotDetail();
				spot.setSpotId(rset.getString("SPOT_ID"));
				spot.setAccount(new Account(rset.getString("ACCOUNT_ID"), "user1@gmail.com", "", ""));
				spot.setSpotName(rset.getString("SPOT_NAME"));
				spot.setCityId(rset.getInt("CITY_ID"));
				spot.setSubcategoryId(rset.getString("SUBCATEGORY_ID"));
				spot.setCategoryId(rset.getInt("CATEGORY_ID"));
				spot.setSpotIntro(rset.getString("SPOT_INTRO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset!=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return spot;
	}

	public static void main(String[] args) {
		SpotDetailDAO dao = new SpotDetailDAOJdbc();
		
		SpotDetail spot = new SpotDetail();
		spot.setTempSpotId("ABC");
		spot.setSpotName("Brown Coffee");
		spot.setCityId(1);
		spot.setCategoryId(1);
		spot.setSubcategoryId("SWT");
		spot.setAccount(new Account("M14090001", "user1@gmail.com", "", ""));
		
		SpotDetail spotResult = dao.insert(spot);
		
		System.out.println("spot : " + spotResult.toString());
	}
}
