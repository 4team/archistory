package org.kkamnyang.web;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.kkamnyang.domain.RouteVO;
import org.kkamnyang.service.RouteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class RouteControllerTest {

	
	private static final Logger logger = 
			LoggerFactory.getLogger(RouteControllerTest.class);
	
	@Autowired
	RouteService service;
	
	@Inject
    private WebApplicationContext wac;

    private MockMvc mockMvc;
    
    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
        logger.info("setup............");
    }
	
	
	@Test
	public void test() throws Exception{
		RouteVO vo = new RouteVO();
		vo.setAdminno(1);
		vo.setRoutename("스프링서비스 루트");
		vo.setLat(37.123);
		vo.setLng(127.1111);
		vo.setStep(true);
		service.regist(vo);
	}
	
	@Test
	public void testss() throws Exception{
		try{
		RouteVO vo = new RouteVO();
		vo.setRouteno(1);
		System.out.println(vo.getRouteno());
		service.remove(1);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
