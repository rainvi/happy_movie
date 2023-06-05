package dao;

import org.springframework.stereotype.Repository;

import dto.BookmarkDTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

@Repository("BookmarkMapper")
public class BookmarkDAO implements BookmarkDAOInt {
	SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// ÀüÁ¦ ºÏ¸¶Å©
	public List<BookmarkDTO> bookmarkList(){
		List<BookmarkDTO> list = session.selectList("bookmarkList");
		return list;
	}

	@Override
	public void insertBookmark(BookmarkDTO bd) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBookmark(BookmarkDTO bd) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BookmarkDTO> selectBookmark(String user_id) {
		List<BookmarkDTO> list = session.selectList("bookmarkList", user_id);
		return list;
	}
	
}
