package com.kaka.mapper;

import com.kaka.pojo.DO.Emp;
import com.kaka.pojo.DTO.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    @Select("select id, username, password, name from emp where username=#{username} and password=#{password}")
    public Emp selectByUsernameAndPassword(UserInfoDTO userInfoDTO);
}
