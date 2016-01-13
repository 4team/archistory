package org.kkamnyang.service;

import java.util.List;

import org.kkamnyang.domain.BoardVO;
import org.kkamnyang.domain.Criteria;
import org.kkamnyang.domain.SearchCriteria;

public interface BoardService {

	public void regist(BoardVO board)throws Exception;
	
	public BoardVO read(Integer boardNo)throws Exception;
	
	public void modify(BoardVO board)throws Exception;
	
	public void remove(Integer boardNo)throws Exception;
	
	public List<BoardVO> listAll()throws Exception;	
	
	public List<BoardVO> listCriteria(Criteria cri)throws Exception;	
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public List<BoardVO> listSearchCriteria(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public List<String> getAttach(Integer boardNo)throws Exception;
	
}