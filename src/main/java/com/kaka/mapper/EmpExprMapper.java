package com.kaka.mapper;

import com.kaka.pojo.DO.EmpExpr;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EmpExprMapper {
    void insertBatch(List<EmpExpr> empList);

    void deleteByEmpId(Integer[] ids);
}
