package vote.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import vote.bean.User;
import vote.bean.Vote;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml",
		"file:WebContent/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {
	
	@Autowired
	WebApplicationContext context;
	//虚拟mvc请求，获取处理结果
	MockMvc mockMvc;
	
	@Before
	public void intiMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testDepts() throws Exception {
		//User user = new User("zdk","1234",1234);
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders
				.get("/adduser").param("user", "zdk,1234,1234"))
				.andReturn();
		MockHttpServletRequest request = result.getRequest();
		int count = (int) request.getAttribute("count");
		System.out.println(count);
		
	}
	@Test
	public void testvoteInfo() throws Exception {
		//User user = new User("zdk","1234",1234);
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders
				.get("/voteinfo").param("voteId", "2"))
				.andReturn();
		MockHttpServletRequest request = result.getRequest();
		Vote vote = (Vote) request.getAttribute("vote");
		System.out.println(vote.getVoteName());
		
	}

}
