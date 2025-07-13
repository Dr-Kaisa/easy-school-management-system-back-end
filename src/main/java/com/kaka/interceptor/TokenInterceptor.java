package com.kaka.interceptor;

import com.kaka.Utils.CurrentHolder;
import com.kaka.Utils.JwtUtils;
import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

//自定义拦截器
@Slf4j
@Component
public class TokenInterceptor implements HandlerInterceptor {
    //目标资源方法执行前执行。 返回true：放行    返回false：不放行
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("preHandle .... ");
        //效验 token
        String token = request.getHeader("token");
        try {
            Claims claims = JwtUtils.parseJWT(token);
            Integer id=(Integer) claims.get("id");
            log.info("当前用户id为：{}",id);
            CurrentHolder.setCurrentId(id);
            log.info("get当前用户id为：{}",CurrentHolder.getCurrentId());
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return false;
        }

        return true; //true表示放行
    }

    //目标资源方法执行后执行
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        CurrentHolder.remove(); //移除当前线程的当前员工id
    }

    //视图渲染完毕后执行，最后执行————这个一般用不到，因为现在都是前后端分离了
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
