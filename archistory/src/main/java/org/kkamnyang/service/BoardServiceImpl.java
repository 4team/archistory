package org.kkamnyang.service;

import java.util.List;

import javax.inject.Inject;

import org.kkamnyang.domain.BoardVO;
import org.kkamnyang.domain.Criteria;
import org.kkamnyang.domain.SearchCriteria;
import org.kkamnyang.persistence.BoardDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Transactional
	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
		System.out.println("글을 올립니다...");
		System.out.println(board);
		String[] files = board.getFiles();
		
		if(files==null){return;}
		for(String fileName : files){
			System.out.println(fileName);
			dao.addAttach(fileName);
		}
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(Integer boardNo) throws Exception {
		dao.updateViewCnt(boardNo);
		return dao.read(boardNo);
	}

	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
		
		Integer boardNo = board.getBoardNo();
		
		dao.deleteAttach(boardNo);
		
		String[] files = board.getFiles();
		
		if(files==null){return;}
		
		for(String fileName:files){
			dao.replaceAttach(fileName, boardNo);
		}
	}

	@Transactional
	@Override
	public void remove(Integer boardNo) throws Exception {
		dao.deleteAttach(boardNo);
		dao.delete(boardNo);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer boardNo) throws Exception {
		return dao.getAttach(boardNo);
	}

}
