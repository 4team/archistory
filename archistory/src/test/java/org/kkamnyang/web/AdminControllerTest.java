package org.kkamnyang.web;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.kkamnyang.domain.AdminVO;
import org.kkamnyang.persistence.AdminMapper;
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
public class AdminControllerTest {

	private static final Logger logger = 
			LoggerFactory.getLogger(RouteControllerTest.class);
	
	@Autowired
	AdminMapper mapper;
	
	
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
		AdminVO vo = mapper.read(1);
		System.out.println(vo);
	}

	@Test
	public void loginTest() throws Exception{
		AdminVO vo = new AdminVO();
		vo.setEmail("archistory@knkn.com");
		vo.setPassword("knkn");
		AdminVO result = mapper.login(vo);
		System.out.println(result);
	}
}
