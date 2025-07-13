package com.kaka.service;

import com.kaka.pojo.DO.Emp;
import com.kaka.pojo.DTO.EmpPageParm;
import com.kaka.pojo.VO.PageResult;

public interface EmpService {
    public PageResult<Emp> page(EmpPageParm parm);

    void add(Emp emp);


    void delete(Integer[] ids);

    Emp getById(Integer id);

    void update(Emp emp);
}
