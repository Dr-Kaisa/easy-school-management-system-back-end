package com.kaka.service.impl;

import com.kaka.pojo.DO.Emp;
import com.kaka.pojo.DTO.UserInfoDTO;
import com.kaka.Utils.JwtUtils;
import com.kaka.pojo.VO.UserInfoVo;
import com.kaka.mapper.UserMapper;
import com.kaka.service.LoginService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class LoginServiceImpl implements LoginService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public UserInfoVo login(UserInfoDTO userInfoDTO) {
        Emp emp =userMapper.selectByUsernameAndPassword(userInfoDTO);

        UserInfoVo userInfoVo =new UserInfoVo();
        if (emp!=null){
            userInfoVo.setId(emp.getId());
            userInfoVo.setName(emp.getName());
            Map<String,Object> claims =new HashMap<>();
            claims.put("id",emp.getId());
            claims.put("username",emp.getUsername());
            String token =JwtUtils.generateJwt(claims);
            userInfoVo.setToken(token);
        }else {
            userInfoVo=null;
        }
        return userInfoVo;
    }
}
