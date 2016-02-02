package org.kkamnyang.persistence;

import org.kkamnyang.domain.ParticipateVO;
import org.springframework.stereotype.Repository;

@Repository
public class ParticipateMapperImpl extends AbstractCRUDMapper<ParticipateVO, Integer> implements ParticipateMapper {

	@Override
	public void finish(ParticipateVO vo) {
		session.update(namespace+".finish",vo);
	}

}
