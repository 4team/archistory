package org.kkamnyang.persistence;

import org.kkamnyang.domain.AdminDTO;
import org.kkamnyang.domain.AdminVO;

public interface AdminMapper extends CRUDMapper<AdminVO, Integer> {
	public AdminVO login(AdminDTO dto) throws Exception;
}
