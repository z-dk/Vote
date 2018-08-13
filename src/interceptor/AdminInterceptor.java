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
		String adminName = (String) request.getSession().getAttribute("adminName");
		if(adminName==null) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("管理员被拦截");
			return false;
		}else {
			System.out.println(adminName);
			return true;
		}
	}
	
	public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object handler,  
            ModelAndView modelAndView) throws Exception {
        if(modelAndView != null){
            modelAndView.addObject("admin", "adminvalue");
        }
    }
	
	public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object handler, Exception ex)  
            throws Exception {  
		System.out.println("afterCompletion");
    }  
}
