package org.kkamnyang.persistence;

import org.kkamnyang.domain.AdminVO;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMapperImpl extends AbstractCRUDMapper<AdminVO, Integer> implements AdminMapper {

	@Override
	public AdminVO login(AdminVO vo) throws Exception {
		return session.selectOne(namespace+".login",vo);
	}


}
