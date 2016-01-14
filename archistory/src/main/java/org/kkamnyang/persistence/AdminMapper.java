package org.kkamnyang.persistence;

import org.kkamnyang.domain.AdminVO;

public interface AdminMapper extends CRUDMapper<AdminVO, Integer> {
	public AdminVO login(AdminVO vo) throws Exception;
}
