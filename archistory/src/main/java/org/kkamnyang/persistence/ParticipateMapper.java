package org.kkamnyang.persistence;

import org.kkamnyang.domain.ParticipateVO;


public interface ParticipateMapper extends CRUDMapper<ParticipateVO, Integer> {

	void finish(ParticipateVO vo);

}
