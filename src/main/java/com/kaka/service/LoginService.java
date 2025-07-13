package com.kaka.service;

import com.kaka.pojo.DTO.UserInfoDTO;
import com.kaka.pojo.VO.UserInfoVo;

public interface LoginService {
    UserInfoVo login(UserInfoDTO userInfoDTO);
}
