package com.ed.smarthome.struts;

import java.util.Map;

import com.ed.smarthome.entity.Users;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptor implements Interceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		       
      
        String actionName=invocation.getInvocationContext().getName();
        
        //判断action
        if(actionName.equals("login")||actionName.equals("register")||actionName.equals("androidlogin")||actionName.equals("androidgetuserinfo")||actionName.equals("statusjson")
        		||actionName.equals("androidreg")||actionName.equals("rc")||actionName.equals("devicestatus")||actionName.equals("history")){
        	return invocation.invoke();
        }else{
        	Map<String, Object> sessionMap = ActionContext.getContext().getSession(); 
        	Users u=(Users) sessionMap.get("user");
        	if(u!=null){
            	return invocation.invoke();
            }else{
            	return "unlogin";
            }
        }
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}
}
