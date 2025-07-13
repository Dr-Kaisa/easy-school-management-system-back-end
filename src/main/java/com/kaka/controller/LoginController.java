package com.kaka.controller;

import com.kaka.pojo.DO.Result;
import com.kaka.pojo.DTO.UserInfoDTO;
import com.kaka.pojo.VO.UserInfoVo;
import com.kaka.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @PostMapping
    public Result login(@RequestBody UserInfoDTO userInfoDTO) {
        UserInfoVo userInfoVo =loginService.login(userInfoDTO);
        if(userInfoVo!=null){
            return Result.success(userInfoVo);
        }
        return Result.error("用户名或密码错误");
    }
}
