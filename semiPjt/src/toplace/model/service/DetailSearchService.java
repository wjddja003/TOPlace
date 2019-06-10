package toplace.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import space.model.vo.Space;
import toplace.model.dao.DetailSearchDao;

public class DetailSearchService {
	public ArrayList<Space> detailSearch(int inputType,int index,String type){
		Connection conn=JDBCTemplate.getConnection();
		String typeArr = "";
		
		ArrayList<Space> list = null;
		if(inputType==1) {
			for(int i =0;i<23;i++) {
				if(i==index*2) {
					typeArr += "1";
				}else {
					typeArr += "_";
				}
			}
			System.out.println(typeArr);
			list = new DetailSearchDao().placeTypeSearch(conn,typeArr);
		} else if(inputType==2) {
				
		} else if(inputType==3) {
			System.out.println(type);
			list = new DetailSearchDao().unknownTypeSearch(conn,type);
		}
		
		
		if(list != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Space> filterSearch(int inputType,int index,String type,String filter){
		Connection conn=JDBCTemplate.getConnection();
		String typeArr = "";
		String filterArr= "";
		for(int i = 0; i<21; i++){
			if(i<20) {
				if(filter.charAt(i) == '1') {
					filterArr += "1";
					filterArr += "_";
				}else {
					filterArr += "_";
					filterArr += "_";
				}
			}else {
				if(filter.charAt(i) == '1') {
					filterArr += "1";
				}else {
					filterArr += "_";
				}
			}
			
		}
		System.out.println(filterArr);
		ArrayList<Space> list = null;
		if(inputType==1) {
			for(int i =0;i<23;i++) {
				if(i==index*2) {
					typeArr += "1";
				}else {
					typeArr += "_";
				}
			}
			System.out.println(typeArr);
			list = new DetailSearchDao().placeFilterSearch(conn,typeArr,filterArr);
		} else if(inputType==2) {
				
		} else if(inputType==3) {
			System.out.println(type);
			list = new DetailSearchDao().unknownFilterSearch(conn,type,filterArr);
		}
		
		
		if(list != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<Space> searchAddress(){
		Connection conn=JDBCTemplate.getConnection();
		ArrayList<Space> list =new DetailSearchDao().searchAddress(conn);
		if(list != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Space> allSearch(){
		Connection conn=JDBCTemplate.getConnection();
		ArrayList<Space> list =new DetailSearchDao().allSearch(conn);
		if(list != null) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return list;
	}
}
