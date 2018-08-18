package interceptor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) 
			throws ServletException, IOException {
		String adminName = (String) request.getSession().getAttribute("adName");
		if(adminName==null) {
			request.getRequestDispatcher("/ad.jsp").forward(request, response);
			System.out.println("管理员请求被拦截");
			return false;
		}else {
			return true;
		}
	}
	
	public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler,  
            ModelAndView modelAndView) throws Exception {
        
    }
	
	public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object handler, Exception ex)  
            throws Exception {  
		
    }  
}
