package org.kkamnyang.persistence;

import org.kkamnyang.domain.AdminDTO;
import org.kkamnyang.domain.AdminVO;

public interface AdminMapper extends CRUDMapper<AdminVO, Integer> {
	public AdminVO login(AdminDTO dto) throws Exception;
	public String getPass(String email) throws Exception;
	public String getName(String email) throws Exception;
	public int getNo(String email) throws Exception;
	public boolean isEnable(String email) throws Exception;
}
